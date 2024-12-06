import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page_controller.dart';
import 'package:warikan/pages/normal_calculate_page/widgets/event_save_pop_up.dart';
import 'package:warikan/pages/normal_calculate_page/widgets/result_container.dart';

class NormalCalculatePage extends ConsumerWidget {
  final int fraction = 1;
  Set<FractionRound> selected = {FractionRound.none};
  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController totalPeopleController = TextEditingController();

  NormalCalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            _inputTotalAmount(context, ref),
            Expanded(child: _inputTotalPeople(context, ref)),
          ],
        ),
        const Text(
          '端数処理',
        ),
        SegmentedButton<FractionRound>(
            onSelectionChanged: (value) {
              selected = value;
              ref
                  .read(normalCalculatePageControllerProvider.notifier)
                  .setFraction(selected.contains(FractionRound.none)
                      ? FractionRound.none
                      : selected.first);
              ref.read(normalCalculatePageControllerProvider.notifier).divide();
            },
            style: SegmentedButton.styleFrom(
                backgroundColor: Colors.grey[350],
                selectedBackgroundColor:
                    const Color.fromARGB(255, 104, 245, 172)),
            segments: const [
              ButtonSegment(
                  value: FractionRound.none,
                  label: Text(
                    '処理なし',
                  )),
              ButtonSegment(
                  value: FractionRound.roundUp,
                  label: Text(
                    '切り上げ',
                  )),
              ButtonSegment(
                  value: FractionRound.roundDown,
                  label: Text(
                    '切り下げ',
                  ))
            ],
            selected: selected),
        if (ref.watch(normalCalculatePageControllerProvider).fraction !=
            FractionRound.none)
          _fractionChoiceChips(ref),
        const ResultContainer(),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EventSavePopUp();
                  });
            },
            child: const Text('イベントを作成')),
      ],
    );
  }

  Widget _inputTotalAmount(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.55,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: totalAmountController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            return;
          }
          ref
              .read(normalCalculatePageControllerProvider.notifier)
              .setInputTotal(int.parse(value));
          if (ref.read(normalCalculatePageControllerProvider).inputPeople !=
              -1) {
            ref.read(normalCalculatePageControllerProvider.notifier).divide();
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
      width: MediaQuery.of(context).size.width * 0.55,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: totalPeopleController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            return;
          }
          ref
              .read(normalCalculatePageControllerProvider.notifier)
              .setInputPeople(int.parse(value));
          ref.read(normalCalculatePageControllerProvider.notifier).divide();
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

  Widget _fractionChoiceChips(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip(
            label: const Text("1円"),
            backgroundColor: Colors.grey[350],
            selectedColor: const Color.fromARGB(255, 104, 245, 172),
            selected: ref
                    .watch(normalCalculatePageControllerProvider)
                    .fractionPrice ==
                1,
            onSelected: (_) {
              ref
                  .read(normalCalculatePageControllerProvider.notifier)
                  .setFractionPrice(1);
              ref.read(normalCalculatePageControllerProvider.notifier).divide();
            },
          ),
          ChoiceChip(
            label: const Text("10円"),
            backgroundColor: Colors.grey[350],
            selectedColor: const Color.fromARGB(255, 104, 245, 172),
            selected: ref
                    .watch(normalCalculatePageControllerProvider)
                    .fractionPrice ==
                10,
            onSelected: (_) {
              ref
                  .read(normalCalculatePageControllerProvider.notifier)
                  .setFractionPrice(10);
              ref.read(normalCalculatePageControllerProvider.notifier).divide();
            },
          ),
          ChoiceChip(
            label: const Text("100円"),
            backgroundColor: Colors.grey[350],
            selectedColor: const Color.fromARGB(255, 104, 245, 172),
            selected: ref
                    .watch(normalCalculatePageControllerProvider)
                    .fractionPrice ==
                100,
            onSelected: (_) {
              ref
                  .read(normalCalculatePageControllerProvider.notifier)
                  .setFractionPrice(100);
              ref.read(normalCalculatePageControllerProvider.notifier).divide();
            },
          ),
          ChoiceChip(
            label: const Text("1000円"),
            backgroundColor: Colors.grey[350],
            selectedColor: const Color.fromARGB(255, 104, 245, 172),
            selected: ref
                    .watch(normalCalculatePageControllerProvider)
                    .fractionPrice ==
                1000,
            onSelected: (_) {
              ref
                  .read(normalCalculatePageControllerProvider.notifier)
                  .setFractionPrice(1000);
              ref.read(normalCalculatePageControllerProvider.notifier).divide();
            },
          ),
        ],
      ),
    );
  }
}
