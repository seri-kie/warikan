// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_normal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventNormalCollection on Isar {
  IsarCollection<EventNormal> get eventNormals => this.collection();
}

const EventNormalSchema = CollectionSchema(
  name: r'EventNormal',
  id: -5823983595249128484,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'difference': PropertySchema(
      id: 1,
      name: r'difference',
      type: IsarType.double,
    ),
    r'divideResult': PropertySchema(
      id: 2,
      name: r'divideResult',
      type: IsarType.double,
    ),
    r'eventName': PropertySchema(
      id: 3,
      name: r'eventName',
      type: IsarType.string,
    ),
    r'fraction': PropertySchema(
      id: 4,
      name: r'fraction',
      type: IsarType.string,
      enumMap: _EventNormalfractionEnumValueMap,
    ),
    r'inputPeople': PropertySchema(
      id: 5,
      name: r'inputPeople',
      type: IsarType.long,
    )
  },
  estimateSize: _eventNormalEstimateSize,
  serialize: _eventNormalSerialize,
  deserialize: _eventNormalDeserialize,
  deserializeProp: _eventNormalDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _eventNormalGetId,
  getLinks: _eventNormalGetLinks,
  attach: _eventNormalAttach,
  version: '3.1.0+1',
);

int _eventNormalEstimateSize(
  EventNormal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.eventName.length * 3;
  bytesCount += 3 + object.fraction.name.length * 3;
  return bytesCount;
}

void _eventNormalSerialize(
  EventNormal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeDouble(offsets[1], object.difference);
  writer.writeDouble(offsets[2], object.divideResult);
  writer.writeString(offsets[3], object.eventName);
  writer.writeString(offsets[4], object.fraction.name);
  writer.writeLong(offsets[5], object.inputPeople);
}

EventNormal _eventNormalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventNormal(
    date: reader.readDateTime(offsets[0]),
    difference: reader.readDouble(offsets[1]),
    divideResult: reader.readDouble(offsets[2]),
    eventName: reader.readStringOrNull(offsets[3]) ?? 'イベント名未設定',
    fraction:
        _EventNormalfractionValueEnumMap[reader.readStringOrNull(offsets[4])] ??
            FractionRound.none,
    inputPeople: reader.readLong(offsets[5]),
  );
  object.id = id;
  return object;
}

P _eventNormalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? 'イベント名未設定') as P;
    case 4:
      return (_EventNormalfractionValueEnumMap[
              reader.readStringOrNull(offset)] ??
          FractionRound.none) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EventNormalfractionEnumValueMap = {
  r'none': r'none',
  r'roundUp': r'roundUp',
  r'roundDown': r'roundDown',
};
const _EventNormalfractionValueEnumMap = {
  r'none': FractionRound.none,
  r'roundUp': FractionRound.roundUp,
  r'roundDown': FractionRound.roundDown,
};

Id _eventNormalGetId(EventNormal object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eventNormalGetLinks(EventNormal object) {
  return [];
}

void _eventNormalAttach(
    IsarCollection<dynamic> col, Id id, EventNormal object) {
  object.id = id;
}

extension EventNormalQueryWhereSort
    on QueryBuilder<EventNormal, EventNormal, QWhere> {
  QueryBuilder<EventNormal, EventNormal, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventNormalQueryWhere
    on QueryBuilder<EventNormal, EventNormal, QWhereClause> {
  QueryBuilder<EventNormal, EventNormal, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EventNormalQueryFilter
    on QueryBuilder<EventNormal, EventNormal, QFilterCondition> {
  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      differenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      differenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      differenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difference',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      differenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difference',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      divideResultEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'divideResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      divideResultGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'divideResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      divideResultLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'divideResult',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      divideResultBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'divideResult',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eventName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      eventNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> fractionEqualTo(
    FractionRound value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionGreaterThan(
    FractionRound value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionLessThan(
    FractionRound value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> fractionBetween(
    FractionRound lower,
    FractionRound upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fraction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> fractionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fraction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fraction',
        value: '',
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      fractionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fraction',
        value: '',
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      inputPeopleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inputPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      inputPeopleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inputPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      inputPeopleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inputPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterFilterCondition>
      inputPeopleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inputPeople',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EventNormalQueryObject
    on QueryBuilder<EventNormal, EventNormal, QFilterCondition> {}

extension EventNormalQueryLinks
    on QueryBuilder<EventNormal, EventNormal, QFilterCondition> {}

extension EventNormalQuerySortBy
    on QueryBuilder<EventNormal, EventNormal, QSortBy> {
  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByDivideResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'divideResult', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy>
      sortByDivideResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'divideResult', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByEventName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByEventNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByFraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fraction', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByFractionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fraction', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByInputPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputPeople', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> sortByInputPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputPeople', Sort.desc);
    });
  }
}

extension EventNormalQuerySortThenBy
    on QueryBuilder<EventNormal, EventNormal, QSortThenBy> {
  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByDifferenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difference', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByDivideResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'divideResult', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy>
      thenByDivideResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'divideResult', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByEventName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByEventNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByFraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fraction', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByFractionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fraction', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByInputPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputPeople', Sort.asc);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QAfterSortBy> thenByInputPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inputPeople', Sort.desc);
    });
  }
}

extension EventNormalQueryWhereDistinct
    on QueryBuilder<EventNormal, EventNormal, QDistinct> {
  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByDifference() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difference');
    });
  }

  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByDivideResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'divideResult');
    });
  }

  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByEventName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByFraction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fraction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventNormal, EventNormal, QDistinct> distinctByInputPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inputPeople');
    });
  }
}

extension EventNormalQueryProperty
    on QueryBuilder<EventNormal, EventNormal, QQueryProperty> {
  QueryBuilder<EventNormal, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EventNormal, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<EventNormal, double, QQueryOperations> differenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difference');
    });
  }

  QueryBuilder<EventNormal, double, QQueryOperations> divideResultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'divideResult');
    });
  }

  QueryBuilder<EventNormal, String, QQueryOperations> eventNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventName');
    });
  }

  QueryBuilder<EventNormal, FractionRound, QQueryOperations>
      fractionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fraction');
    });
  }

  QueryBuilder<EventNormal, int, QQueryOperations> inputPeopleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inputPeople');
    });
  }
}
