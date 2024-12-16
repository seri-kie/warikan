// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keisha_group_for_isar.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const KeishaGroupForIsarSchema = Schema(
  name: r'KeishaGroupForIsar',
  id: -5804216617129716972,
  properties: {
    r'calcSlope': PropertySchema(
      id: 0,
      name: r'calcSlope',
      type: IsarType.string,
      enumMap: _KeishaGroupForIsarcalcSlopeEnumValueMap,
    ),
    r'groupName': PropertySchema(
      id: 1,
      name: r'groupName',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 2,
      name: r'totalAmount',
      type: IsarType.long,
    ),
    r'totalPeople': PropertySchema(
      id: 3,
      name: r'totalPeople',
      type: IsarType.long,
    )
  },
  estimateSize: _keishaGroupForIsarEstimateSize,
  serialize: _keishaGroupForIsarSerialize,
  deserialize: _keishaGroupForIsarDeserialize,
  deserializeProp: _keishaGroupForIsarDeserializeProp,
);

int _keishaGroupForIsarEstimateSize(
  KeishaGroupForIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.calcSlope;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.groupName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _keishaGroupForIsarSerialize(
  KeishaGroupForIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.calcSlope?.name);
  writer.writeString(offsets[1], object.groupName);
  writer.writeLong(offsets[2], object.totalAmount);
  writer.writeLong(offsets[3], object.totalPeople);
}

KeishaGroupForIsar _keishaGroupForIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KeishaGroupForIsar(
    calcSlope: _KeishaGroupForIsarcalcSlopeValueEnumMap[
        reader.readStringOrNull(offsets[0])],
    groupName: reader.readStringOrNull(offsets[1]),
    totalAmount: reader.readLongOrNull(offsets[2]),
    totalPeople: reader.readLongOrNull(offsets[3]),
  );
  return object;
}

P _keishaGroupForIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_KeishaGroupForIsarcalcSlopeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _KeishaGroupForIsarcalcSlopeEnumValueMap = {
  r'fit': r'fit',
  r'discount': r'discount',
  r'premium': r'premium',
};
const _KeishaGroupForIsarcalcSlopeValueEnumMap = {
  r'fit': CalcSlope.fit,
  r'discount': CalcSlope.discount,
  r'premium': CalcSlope.premium,
};

extension KeishaGroupForIsarQueryFilter
    on QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QFilterCondition> {
  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'calcSlope',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'calcSlope',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeEqualTo(
    CalcSlope? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeGreaterThan(
    CalcSlope? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeLessThan(
    CalcSlope? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeBetween(
    CalcSlope? lower,
    CalcSlope? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calcSlope',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'calcSlope',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'calcSlope',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calcSlope',
        value: '',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      calcSlopeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'calcSlope',
        value: '',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupName',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupName',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupName',
        value: '',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      groupNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupName',
        value: '',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalPeople',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalPeople',
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QAfterFilterCondition>
      totalPeopleBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPeople',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KeishaGroupForIsarQueryObject
    on QueryBuilder<KeishaGroupForIsar, KeishaGroupForIsar, QFilterCondition> {}
