import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/gen/assets.gen.dart';
import 'package:warikan/pages/keisha_calculate_page/keisha_calculate_page_controller.dart';

class ResultContainerKeisha extends ConsumerWidget {
  const ResultContainerKeisha({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(keishaCalculatePageControllerProvider);
    final calcResult = state.divideResultRemain;
    final keishaGroups = state.keishaGroups;

    return Container(
      alignment: Alignment.center,
      width: 250,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.bgWarikan.path),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: keishaGroups.length,
              itemBuilder: (context, index) {
                final group = keishaGroups[index];
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '${group.groupName}:',
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      if (group.calcSlope == CalcSlope.fit) ...[
                        AutoSizeText(
                          '${group.totalAmount}円',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ] else if (group.calcSlope == CalcSlope.discount) ...[
                        AutoSizeText(
                          '${calcResult - group.totalAmount}円',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ] else if (group.calcSlope == CalcSlope.premium) ...[
                        AutoSizeText(
                          '${calcResult + group.totalAmount}円',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ]
                    ]);
              },
            ),
            AutoSizeText(
              calcResult == 0
                  ? '金額と人数を入力してください'
                  : (calcResult % 1 == 0 // 整数の場合
                      ? '1人:${calcResult.toStringAsFixed(0)}円' // 整数として表示
                      : '1人:${calcResult.toStringAsFixed(3)}円'), // それ以外は小数点以下3桁
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
