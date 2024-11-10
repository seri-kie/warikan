import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'normal_calculate_page_controller.g.dart';
part 'normal_calculate_page_controller.freezed.dart';

enum FractionRound { none, roundUp, roundDown }

@riverpod
class NormalCalculatePageController extends _$NormalCalculatePageController {
  @override
  NormalCalculatePageState build() {
    return const NormalCalculatePageState(
      inputAmount: -1,
      inputPeople: -1,
      fraction: FractionRound.none,
      fractionPrice: 1,
      calcResult: -1,
    );
  }

  void setInputAmount(int value) {
    state = state.copyWith(inputAmount: value);
  }

  void setInputPeople(int value) {
    state = state.copyWith(inputPeople: value);
  }

  void setFraction(FractionRound value) {
    state = state.copyWith(fraction: value);
  }

  void setFractionPrice(int value) {
    state = state.copyWith(fractionPrice: value);
  }

  void divide() {
    //　人数と金額の両方が入力されている場合のみ計算を行う
    if (state.inputAmount != -1 && state.inputPeople != -1) {
      // 割り勘結果
      double result = state.inputAmount / state.inputPeople;
      // 端数処理の設定によって計算結果を変える
      if (state.fraction == FractionRound.roundUp) {
        // 端数処理が切り上げの場合、fractionPriceの値で切り上げを行う
        state =
            state.copyWith(calcResult: roundUp(result, state.fractionPrice));
      } else if (state.fraction == FractionRound.roundDown) {
        state = state.copyWith(
          calcResult: roundDown(result, state.fractionPrice),
        );
      } else {
        state = state.copyWith(
          calcResult: state.inputAmount / state.inputPeople,
        );
      }
    }
  }

  double roundUp(double value, int fractionPrice) {
    // 割り切れる場合はそのままの値を返す
    if (value % fractionPrice == 0) {
      return value;
    }
    return (value / fractionPrice).ceil() * fractionPrice.toDouble();
  }

  double roundDown(double value, int fractionPrice) {
    return (value / fractionPrice).floor() * fractionPrice.toDouble();
  }
}

@freezed
class NormalCalculatePageState with _$NormalCalculatePageState {
  const factory NormalCalculatePageState({
    required int inputAmount,
    required int inputPeople,
    required FractionRound fraction,
    required int fractionPrice,
    required double calcResult,
  }) = _NormalCalculatePageState;
}
