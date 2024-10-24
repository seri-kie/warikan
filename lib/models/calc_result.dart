import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:warikan/models/total_amount.dart';
import 'package:warikan/models/total_people.dart';
part 'calc_result.g.dart';

@riverpod
class CalcResult extends _$CalcResult {
  @override
  double build() => -1;

  void increase() => state++;

  void divide() {
    state = ref.watch(totalAmountProvider) / ref.watch(totalPeopleProvider);
  }
}
