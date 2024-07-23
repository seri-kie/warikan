import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warikan/gen/assets.gen.dart';

enum FractionRound { none, roundUp, roundDown }

class NormalCalculatePage extends StatefulWidget {
  const NormalCalculatePage({super.key});

  @override
  State<NormalCalculatePage> createState() => _NormalCalculatePageState();
}

class _NormalCalculatePageState extends State<NormalCalculatePage> {
  Set<FractionRound> selected = {FractionRound.none};
  int fraction = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.55,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              ),
            ),
          ],
        ),
        const Text(
          '端数処理',
        ),
        SegmentedButton(
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
        if (!selected.contains(FractionRound.none))
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
                    setState(() {
                      fraction = 1;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("10円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 10,
                  onSelected: (_) {
                    setState(() {
                      fraction = 10;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("100円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 100,
                  onSelected: (_) {
                    setState(() {
                      fraction = 100;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text("1000円"),
                  backgroundColor: Colors.grey[350],
                  selectedColor: const Color.fromARGB(255, 104, 245, 172),
                  selected: fraction == 1000,
                  onSelected: (_) {
                    setState(() {
                      fraction = 1000;
                    });
                  },
                ),
              ],
            ),
          ),
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.images.bgWarikan.path),
                    fit: BoxFit.fitWidth)),
            child: const AutoSizeText(
              maxLines: 2,
              'ここに割り勘結果を表示',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
