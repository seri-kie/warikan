import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/gen/assets.gen.dart';
import 'package:warikan/models/keisha_group.dart';
import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page_controller.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({super.key});

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  Set<CalcSlope> selected = {CalcSlope.fit};
  String groupName = '';
  int totalPeople = 0;
  int amount = 0;

  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: const Text(
              '新規グループ作成',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: const Color(0xFF198D34),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
                ref
                    .read(keishaCalculatePageControllerProvider.notifier)
                    .divide();
              },
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text('傾斜方法'),
              Center(
                child: SegmentedButton<CalcSlope>(
                    onSelectionChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                    style: SegmentedButton.styleFrom(
                        backgroundColor: Colors.grey[350],
                        selectedBackgroundColor:
                            const Color.fromARGB(255, 104, 245, 172)),
                    segments: const [
                      ButtonSegment(
                          value: CalcSlope.fit,
                          label: Text(
                            'キリよく',
                          )),
                      ButtonSegment(
                          value: CalcSlope.discount,
                          label: Text(
                            '割り引き',
                          )),
                      ButtonSegment(
                          value: CalcSlope.premium,
                          label: Text(
                            '割り増し',
                          ))
                    ],
                    selected: selected),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputGroupName(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          _inputTotalPeople(),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            selected.contains(CalcSlope.fit)
                                ? 'はキリよく'
                                : selected.contains(CalcSlope.discount)
                                    ? 'は割り引き'
                                    : 'は割り増し',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          _inputTotalAmount(),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'で！',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //　イベント作成ボタンを押したらKeishaGroupのインタンスを作成して追加する
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // リップルを角丸に
                ),
                onTap: () {
                  if (groupName.isEmpty || totalPeople == 0 || amount == 0) {
                    return;
                  }
                  final keishaGroup = KeishaGroup(
                      groupName: groupName,
                      totalPeople: totalPeople,
                      totalAmount: amount,
                      calcSlope: selected.first);
                  ref
                      .read(keishaCalculatePageControllerProvider.notifier)
                      .addGroup(keishaGroup);
                  groupNameController.clear();
                  totalPeopleController.clear();
                  amountController.clear();
                  // グループ追加完了のメッセージを表示
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('グループが追加されました')),
                  );
                },
                child: Image.asset(
                  Assets.images.groupAddButton.path,
                  height: 75, // ボタンの高さを指定
                  fit: BoxFit.fitHeight, // 画像をボタンサイズにフィット
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _inputGroupName() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: groupNameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          if (value.isEmpty) {
            return;
          } else {
            groupName = value;
          }
        },
        decoration: const InputDecoration(
          hintText: '1年生',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          prefixIcon: Icon(Icons.abc),
          labelText: 'グループ名',
        ),
      ),
    );
  }

  Widget _inputTotalPeople() {
    return SizedBox(
      width: 120,
      child: TextFormField(
        controller: totalPeopleController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isEmpty) {
            return;
          }
          totalPeople = int.parse(value);
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            prefixIcon: Icon(Icons.group),
            hintText: '5',
            labelText: '人数',
            suffix: Text(
              '人',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  Widget _inputTotalAmount() {
    return SizedBox(
      width: 200,
      child: TextFormField(
        controller: amountController,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          if (value.isEmpty) {
            return;
          }
          amount = int.parse(value);
        },
        decoration: const InputDecoration(
            hintText: '1000',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            prefixIcon: Icon(Icons.monetization_on_outlined),
            labelText: '金額',
            suffix: Text(
              '円',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
