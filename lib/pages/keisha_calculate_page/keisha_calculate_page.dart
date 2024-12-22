import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:warikan/models/calc_slope.dart';
import 'package:warikan/models/event_keisha.dart';
import 'package:warikan/models/keisha_group_for_isar.dart';
import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page_controller.dart';
import 'package:warikan/pages/keisha_calculate_page/widgets/event_save_pop_up_keisha.dart';
import 'package:warikan/pages/keisha_calculate_page/widgets/result_container_keisha.dart';
import 'package:warikan/pages/new_group_page/new_group_page.dart';
import 'package:warikan/pages/utils/keyboard_config.dart';

class KeishaCalculatePage extends ConsumerStatefulWidget {
  final Isar isar;

  const KeishaCalculatePage({super.key, required this.isar});

  @override
  _KeishaCalculatePageState createState() => _KeishaCalculatePageState();
}

class _KeishaCalculatePageState extends ConsumerState<KeishaCalculatePage> {
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();
  final FocusNode focusNodeAmount = FocusNode();
  final FocusNode focusNodePeople = FocusNode();

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    totalAmountController.dispose();
    totalPeopleController.dispose();
    focusNodeAmount.dispose();
    focusNodePeople.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keishaGroups =
        ref.watch(keishaCalculatePageControllerProvider).keishaGroups;

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: KeyboardActions(
          autoScroll: false,
          config: buildKeyboardConfig(
              focusNodeAmount: focusNodeAmount,
              focusNodePeople: focusNodePeople),
          child: Column(
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
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 80,
                      ),
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: ListView.builder(
                          controller: scrollController,
                          shrinkWrap: true,
                          itemCount: keishaGroups.length,
                          itemBuilder: (context, index) {
                            final group = keishaGroups[index];
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      '${group.groupName}・',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    '${group.totalPeople}名→',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    '${group.totalAmount}円',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  if (group.calcSlope ==
                                      CalcSlope.discount) ...[
                                    const Text(
                                      '引き',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ] else if (group.calcSlope ==
                                      CalcSlope.premium) ...[
                                    const Text(
                                      '増し',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                  const SizedBox(
                                    width: 20,
                                  )
                                ]);
                          },
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              const ResultContainerKeisha(),
              const SizedBox(height: 20),
              eventSaveButton(context, ref),
            ],
          ),
        ),
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
        focusNode: focusNodeAmount,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        controller: totalAmountController,
        onChanged: (value) {
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
        focusNode: focusNodePeople,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: totalPeopleController,
        onChanged: (value) {
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

  Widget eventSaveButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 200,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 2.5),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
          onPressed: totalAmountController.text.isEmpty ||
                  totalPeopleController.text.isEmpty
              ? null
              : () {
                  final state = ref.read(keishaCalculatePageControllerProvider);
                  final List<KeishaGroupForIsar> keishaGroups = [];
                  for (final group in state.keishaGroups) {
                    keishaGroups.add(KeishaGroupForIsar(
                        groupName: group.groupName,
                        totalAmount: group.totalAmount,
                        totalPeople: group.totalPeople,
                        calcSlope: group.calcSlope));
                  }
                  final eventKeisha = EventKeisha(
                      keishaGroups: keishaGroups,
                      remainPerPerson: state.divideResult,
                      remainPeople: state.remainingPeople,
                      allPeople: int.parse(totalPeopleController.text),
                      date: DateTime.now());
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EventSavePopUpKeisha(
                          isar: widget.isar,
                          event: eventKeisha,
                        );
                      });
                },
          child: const Text('イベントを保存',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
    );
  }
}
