import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/gen/assets.gen.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page_controller.dart';

class NormalCalculatePage extends ConsumerWidget {
  final int fraction = 1;

  const NormalCalculatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Set<FractionRound> selected = {FractionRound.none};
    final calcResult =
        ref.watch(normalCalculatePageControllerProvider).calcResult;
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
        const SizedBox(
          height: 10,
        ),
        if (ref.watch(normalCalculatePageControllerProvider).fraction !=
            FractionRound.none)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceChip(
                  label: const Text("1円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 1,
                  onSelected: (_) {
                    ref
                        .read(normalCalculatePageControllerProvider.notifier)
                        .setFractionPrice(1);
                  },
                ),
                ChoiceChip(
                  label: const Text("10円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 10,
                  onSelected: (_) {
                    ref
                        .read(normalCalculatePageControllerProvider.notifier)
                        .setFractionPrice(10);
                  },
                ),
                ChoiceChip(
                  label: const Text("100円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 100,
                  onSelected: (_) {
                    ref
                        .read(normalCalculatePageControllerProvider.notifier)
                        .setFractionPrice(100);
                  },
                ),
                ChoiceChip(
                  label: const Text("1000円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 1000,
                  onSelected: (_) {
                    ref
                        .read(normalCalculatePageControllerProvider.notifier)
                        .setFractionPrice(1000);
                  },
                ),
              ],
            ),
          ),
        Container(
            alignment: Alignment.center,
            width: 250,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.bgWarikan.path),
                    fit: BoxFit.fitWidth)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                calcResult == -1
                    ? '金額と人数を入力してください'
                    : (calcResult % 1 == 0 // 整数の場合
                        ? '1人:${calcResult.toStringAsFixed(0)}円' // 整数として表示
                        : '1人:${calcResult.toStringAsFixed(3)}円'), // それ以外は小数点以下3桁
                maxLines: 1,
                overflow: TextOverflow.clip,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ))
      ],
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
          ref
              .read(normalCalculatePageControllerProvider.notifier)
              .setInputAmount(int.parse(value));
          debugPrint('inputTotal: ${int.parse(value)}');
          ref.read(normalCalculatePageControllerProvider.notifier).divide();
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
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.55,
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onFieldSubmitted: (value) {
          ref
              .read(normalCalculatePageControllerProvider.notifier)
              .setInputPeople(int.parse(value));
          debugPrint(
              'inputTotal: ${ref.read(normalCalculatePageControllerProvider).inputPeople}');
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
}
