// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_keisha.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEventKeishaCollection on Isar {
  IsarCollection<EventKeisha> get eventKeishas => this.collection();
}

const EventKeishaSchema = CollectionSchema(
  name: r'EventKeisha',
  id: 5999273754070171753,
  properties: {
    r'allPeople': PropertySchema(
      id: 0,
      name: r'allPeople',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'eventName': PropertySchema(
      id: 2,
      name: r'eventName',
      type: IsarType.string,
    ),
    r'keishaGroups': PropertySchema(
      id: 3,
      name: r'keishaGroups',
      type: IsarType.objectList,
      target: r'KeishaGroupForIsar',
    ),
    r'nameList': PropertySchema(
      id: 4,
      name: r'nameList',
      type: IsarType.stringList,
    ),
    r'payList': PropertySchema(
      id: 5,
      name: r'payList',
      type: IsarType.boolList,
    ),
    r'remainPeople': PropertySchema(
      id: 6,
      name: r'remainPeople',
      type: IsarType.long,
    ),
    r'remainPerPerson': PropertySchema(
      id: 7,
      name: r'remainPerPerson',
      type: IsarType.double,
    )
  },
  estimateSize: _eventKeishaEstimateSize,
  serialize: _eventKeishaSerialize,
  deserialize: _eventKeishaDeserialize,
  deserializeProp: _eventKeishaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'KeishaGroupForIsar': KeishaGroupForIsarSchema},
  getId: _eventKeishaGetId,
  getLinks: _eventKeishaGetLinks,
  attach: _eventKeishaAttach,
  version: '3.1.0+1',
);

int _eventKeishaEstimateSize(
  EventKeisha object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.eventName.length * 3;
  {
    final list = object.keishaGroups;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[KeishaGroupForIsar]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              KeishaGroupForIsarSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  bytesCount += 3 + object.nameList.length * 3;
  {
    for (var i = 0; i < object.nameList.length; i++) {
      final value = object.nameList[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.payList.length;
  return bytesCount;
}

void _eventKeishaSerialize(
  EventKeisha object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.allPeople);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.eventName);
  writer.writeObjectList<KeishaGroupForIsar>(
    offsets[3],
    allOffsets,
    KeishaGroupForIsarSchema.serialize,
    object.keishaGroups,
  );
  writer.writeStringList(offsets[4], object.nameList);
  writer.writeBoolList(offsets[5], object.payList);
  writer.writeLong(offsets[6], object.remainPeople);
  writer.writeDouble(offsets[7], object.remainPerPerson);
}

EventKeisha _eventKeishaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EventKeisha(
    allPeople: reader.readLong(offsets[0]),
    date: reader.readDateTime(offsets[1]),
    keishaGroups: reader.readObjectList<KeishaGroupForIsar>(
      offsets[3],
      KeishaGroupForIsarSchema.deserialize,
      allOffsets,
      KeishaGroupForIsar(),
    ),
    remainPeople: reader.readLong(offsets[6]),
    remainPerPerson: reader.readDouble(offsets[7]),
  );
  object.eventName = reader.readString(offsets[2]);
  object.id = id;
  object.nameList = reader.readStringList(offsets[4]) ?? [];
  object.payList = reader.readBoolList(offsets[5]) ?? [];
  return object;
}

P _eventKeishaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectList<KeishaGroupForIsar>(
        offset,
        KeishaGroupForIsarSchema.deserialize,
        allOffsets,
        KeishaGroupForIsar(),
      )) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readBoolList(offset) ?? []) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _eventKeishaGetId(EventKeisha object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _eventKeishaGetLinks(EventKeisha object) {
  return [];
}

void _eventKeishaAttach(
    IsarCollection<dynamic> col, Id id, EventKeisha object) {
  object.id = id;
}

extension EventKeishaQueryWhereSort
    on QueryBuilder<EventKeisha, EventKeisha, QWhere> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EventKeishaQueryWhere
    on QueryBuilder<EventKeisha, EventKeisha, QWhereClause> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterWhereClause> idBetween(
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

extension EventKeishaQueryFilter
    on QueryBuilder<EventKeisha, EventKeisha, QFilterCondition> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      allPeopleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'allPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      allPeopleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'allPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      allPeopleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'allPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      allPeopleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'allPeople',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      eventNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eventName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      eventNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eventName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      eventNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eventName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      eventNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eventName',
        value: '',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition> idBetween(
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

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'keishaGroups',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'keishaGroups',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'keishaGroups',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nameList',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nameList',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nameList',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nameList',
        value: '',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nameList',
        value: '',
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      nameListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'nameList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListElementEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payList',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      payListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'payList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPeopleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPeopleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPeopleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainPeople',
        value: value,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPeopleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainPeople',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPerPersonEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remainPerPerson',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPerPersonGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remainPerPerson',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPerPersonLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remainPerPerson',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      remainPerPersonBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remainPerPerson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension EventKeishaQueryObject
    on QueryBuilder<EventKeisha, EventKeisha, QFilterCondition> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterFilterCondition>
      keishaGroupsElement(FilterQuery<KeishaGroupForIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'keishaGroups');
    });
  }
}

extension EventKeishaQueryLinks
    on QueryBuilder<EventKeisha, EventKeisha, QFilterCondition> {}

extension EventKeishaQuerySortBy
    on QueryBuilder<EventKeisha, EventKeisha, QSortBy> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByAllPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allPeople', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByAllPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allPeople', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByEventName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByEventNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByRemainPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPeople', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy>
      sortByRemainPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPeople', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> sortByRemainPerPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPerPerson', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy>
      sortByRemainPerPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPerPerson', Sort.desc);
    });
  }
}

extension EventKeishaQuerySortThenBy
    on QueryBuilder<EventKeisha, EventKeisha, QSortThenBy> {
  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByAllPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allPeople', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByAllPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'allPeople', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByEventName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByEventNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eventName', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByRemainPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPeople', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy>
      thenByRemainPeopleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPeople', Sort.desc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy> thenByRemainPerPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPerPerson', Sort.asc);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QAfterSortBy>
      thenByRemainPerPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remainPerPerson', Sort.desc);
    });
  }
}

extension EventKeishaQueryWhereDistinct
    on QueryBuilder<EventKeisha, EventKeisha, QDistinct> {
  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByAllPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'allPeople');
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByEventName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eventName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByNameList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameList');
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByPayList() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payList');
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct> distinctByRemainPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainPeople');
    });
  }

  QueryBuilder<EventKeisha, EventKeisha, QDistinct>
      distinctByRemainPerPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remainPerPerson');
    });
  }
}

extension EventKeishaQueryProperty
    on QueryBuilder<EventKeisha, EventKeisha, QQueryProperty> {
  QueryBuilder<EventKeisha, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<EventKeisha, int, QQueryOperations> allPeopleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'allPeople');
    });
  }

  QueryBuilder<EventKeisha, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<EventKeisha, String, QQueryOperations> eventNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eventName');
    });
  }

  QueryBuilder<EventKeisha, List<KeishaGroupForIsar>?, QQueryOperations>
      keishaGroupsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keishaGroups');
    });
  }

  QueryBuilder<EventKeisha, List<String>, QQueryOperations> nameListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameList');
    });
  }

  QueryBuilder<EventKeisha, List<bool>, QQueryOperations> payListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payList');
    });
  }

  QueryBuilder<EventKeisha, int, QQueryOperations> remainPeopleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainPeople');
    });
  }

  QueryBuilder<EventKeisha, double, QQueryOperations>
      remainPerPersonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remainPerPerson');
    });
  }
}
