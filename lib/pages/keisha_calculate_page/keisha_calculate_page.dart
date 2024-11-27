import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page_controller.dart';
import 'package:warikan/pages/keisha_calculate_page/widgets/result_container_keisha.dart';
import 'package:warikan/pages/new_group_page/new_group_page.dart';

class KeishaCalculatePage extends ConsumerWidget {
  const KeishaCalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keishaGroups =
        ref.watch(keishaCalculatePageControllerProvider).keishaGroups;

    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              _inputTotalAmount(context, ref),
              Expanded(child: _inputTotalPeople(context, ref)),
            ],
          ),
          Column(
            children: [
              if (keishaGroups.isEmpty) ...[
                const Center(
                  child: Text('グループがありません'),
                ),
              ] else ...[
                const Text('傾斜グループ一覧'),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: keishaGroups.length,
                  itemBuilder: (context, index) {
                    final group = keishaGroups[index];
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${group.groupName}・',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${group.totalPeople}名→',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${group.totalAmount}円',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          if (group.calcSlope == CalcSlope.discount) ...[
                            const Text(
                              '引き',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ] else if (group.calcSlope == CalcSlope.premium) ...[
                            const Text(
                              '増し',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ]
                        ]);
                  },
                ),
              ]
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          const ResultContainerKeisha()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewGroupPage()));
        },
        label: const Text(
          'グループを追加',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _inputTotalAmount(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.55,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            return;
          }
          ref
              .read(keishaCalculatePageControllerProvider.notifier)
              .setInputTotal(int.parse(value));
          if (ref.read(keishaCalculatePageControllerProvider).inputPeople !=
              -1) {
            ref.read(keishaCalculatePageControllerProvider.notifier).divide();
          }
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            prefixIcon: Icon(Icons.monetization_on_outlined),
            labelText: '合計金額',
            suffix: Text(
              '円',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }

  Widget _inputTotalPeople(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            return;
          }
          ref
              .read(keishaCalculatePageControllerProvider.notifier)
              .setInputPeople(int.parse(value));
          ref.read(keishaCalculatePageControllerProvider.notifier).divide();
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            prefixIcon: Icon(Icons.group),
            labelText: '人数',
            suffix: Text(
              '人',
              style: TextStyle(color: Colors.black),
            )),
      ),
    );
  }
}
