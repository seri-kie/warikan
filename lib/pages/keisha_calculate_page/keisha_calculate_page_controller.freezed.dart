// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'keisha_calculate_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KeishaCalculatePageState {
  int get inputTotal => throw _privateConstructorUsedError;
  int get inputPeople => throw _privateConstructorUsedError;
  double get divideResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeishaCalculatePageStateCopyWith<KeishaCalculatePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeishaCalculatePageStateCopyWith<$Res> {
  factory $KeishaCalculatePageStateCopyWith(KeishaCalculatePageState value,
          $Res Function(KeishaCalculatePageState) then) =
      _$KeishaCalculatePageStateCopyWithImpl<$Res, KeishaCalculatePageState>;
  @useResult
  $Res call({int inputTotal, int inputPeople, double divideResult});
}

/// @nodoc
class _$KeishaCalculatePageStateCopyWithImpl<$Res,
        $Val extends KeishaCalculatePageState>
    implements $KeishaCalculatePageStateCopyWith<$Res> {
  _$KeishaCalculatePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTotal = null,
    Object? inputPeople = null,
    Object? divideResult = null,
  }) {
    return _then(_value.copyWith(
      inputTotal: null == inputTotal
          ? _value.inputTotal
          : inputTotal // ignore: cast_nullable_to_non_nullable
              as int,
      inputPeople: null == inputPeople
          ? _value.inputPeople
          : inputPeople // ignore: cast_nullable_to_non_nullable
              as int,
      divideResult: null == divideResult
          ? _value.divideResult
          : divideResult // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeishaCalculatePageStateImplCopyWith<$Res>
    implements $KeishaCalculatePageStateCopyWith<$Res> {
  factory _$$KeishaCalculatePageStateImplCopyWith(
          _$KeishaCalculatePageStateImpl value,
          $Res Function(_$KeishaCalculatePageStateImpl) then) =
      __$$KeishaCalculatePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int inputTotal, int inputPeople, double divideResult});
}

/// @nodoc
class __$$KeishaCalculatePageStateImplCopyWithImpl<$Res>
    extends _$KeishaCalculatePageStateCopyWithImpl<$Res,
        _$KeishaCalculatePageStateImpl>
    implements _$$KeishaCalculatePageStateImplCopyWith<$Res> {
  __$$KeishaCalculatePageStateImplCopyWithImpl(
      _$KeishaCalculatePageStateImpl _value,
      $Res Function(_$KeishaCalculatePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inputTotal = null,
    Object? inputPeople = null,
    Object? divideResult = null,
  }) {
    return _then(_$KeishaCalculatePageStateImpl(
      inputTotal: null == inputTotal
          ? _value.inputTotal
          : inputTotal // ignore: cast_nullable_to_non_nullable
              as int,
      inputPeople: null == inputPeople
          ? _value.inputPeople
          : inputPeople // ignore: cast_nullable_to_non_nullable
              as int,
      divideResult: null == divideResult
          ? _value.divideResult
          : divideResult // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$KeishaCalculatePageStateImpl implements _KeishaCalculatePageState {
  const _$KeishaCalculatePageStateImpl(
      {required this.inputTotal,
      required this.inputPeople,
      required this.divideResult});

  @override
  final int inputTotal;
  @override
  final int inputPeople;
  @override
  final double divideResult;

  @override
  String toString() {
    return 'KeishaCalculatePageState(inputTotal: $inputTotal, inputPeople: $inputPeople, divideResult: $divideResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeishaCalculatePageStateImpl &&
            (identical(other.inputTotal, inputTotal) ||
                other.inputTotal == inputTotal) &&
            (identical(other.inputPeople, inputPeople) ||
                other.inputPeople == inputPeople) &&
            (identical(other.divideResult, divideResult) ||
                other.divideResult == divideResult));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, inputTotal, inputPeople, divideResult);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeishaCalculatePageStateImplCopyWith<_$KeishaCalculatePageStateImpl>
      get copyWith => __$$KeishaCalculatePageStateImplCopyWithImpl<
          _$KeishaCalculatePageStateImpl>(this, _$identity);
}

abstract class _KeishaCalculatePageState implements KeishaCalculatePageState {
  const factory _KeishaCalculatePageState(
      {required final int inputTotal,
      required final int inputPeople,
      required final double divideResult}) = _$KeishaCalculatePageStateImpl;

  @override
  int get inputTotal;
  @override
  int get inputPeople;
  @override
  double get divideResult;
  @override
  @JsonKey(ignore: true)
  _$$KeishaCalculatePageStateImplCopyWith<_$KeishaCalculatePageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}