import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warikan/gen/assets.gen.dart';
import 'package:warikan/pages/normal_calculate_page/normal_calculate_page_controller.dart';

class ResultContainer extends ConsumerWidget {
  const ResultContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(normalCalculatePageControllerProvider);
    final calcResult = state.divideResult;
    final fraction = state.fraction;
    final difference = state.difference;

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
            if (fraction != FractionRound.none)
              AutoSizeText(
                difference > 0
                    ? '余り金額: ${difference.toStringAsFixed(0)}円'
                    : '不足金額: ${difference.abs().toStringAsFixed(0)}円',
                maxLines: 1,
                overflow: TextOverflow.clip,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
