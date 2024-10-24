import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'total_amount.g.dart';

@riverpod
class TotalAmount extends _$TotalAmount {
  @override
  int build() => 0;

  void set(int value) {
    state = value;
  }

  bool hasValue() {
    return state > 0;
  }
}
