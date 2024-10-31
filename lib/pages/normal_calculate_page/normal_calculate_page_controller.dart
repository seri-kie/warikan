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
      fractionPrice: 0,
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
    if (state.inputAmount != -1 && state.inputPeople != -1) {
      state = state.copyWith(
        calcResult: state.inputAmount / state.inputPeople,
      );
    }
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
