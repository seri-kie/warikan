import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'total_people.g.dart';

@riverpod
class TotalPeople extends _$TotalPeople {
  @override
  int build() {
    return 0;
  }

  void set(int value) {
    state = value;
  }

  bool hasValue() {
    return state > 0;
  }
}
