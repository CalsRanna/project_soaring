// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trial.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTrialCollection on Isar {
  IsarCollection<Trial> get trials => this.collection();
}

const TrialSchema = CollectionSchema(
  name: r'trials',
  id: 7512566520791111132,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'floor': PropertySchema(
      id: 1,
      name: r'floor',
      type: IsarType.long,
    )
  },
  estimateSize: _trialEstimateSize,
  serialize: _trialSerialize,
  deserialize: _trialDeserialize,
  deserializeProp: _trialDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'creatures': LinkSchema(
      id: 6063382609079090670,
      name: r'creatures',
      target: r'creatures',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _trialGetId,
  getLinks: _trialGetLinks,
  attach: _trialAttach,
  version: '3.1.0+1',
);

int _trialEstimateSize(
  Trial object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _trialSerialize(
  Trial object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeLong(offsets[1], object.floor);
}

Trial _trialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Trial();
  object.completed = reader.readBool(offsets[0]);
  object.floor = reader.readLong(offsets[1]);
  object.id = id;
  return object;
}

P _trialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _trialGetId(Trial object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _trialGetLinks(Trial object) {
  return [object.creatures];
}

void _trialAttach(IsarCollection<dynamic> col, Id id, Trial object) {
  object.id = id;
  object.creatures
      .attach(col, col.isar.collection<Creature>(), r'creatures', id);
}

extension TrialQueryWhereSort on QueryBuilder<Trial, Trial, QWhere> {
  QueryBuilder<Trial, Trial, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TrialQueryWhere on QueryBuilder<Trial, Trial, QWhereClause> {
  QueryBuilder<Trial, Trial, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Trial, Trial, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Trial, Trial, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Trial, Trial, QAfterWhereClause> idBetween(
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

extension TrialQueryFilter on QueryBuilder<Trial, Trial, QFilterCondition> {
  QueryBuilder<Trial, Trial, QAfterFilterCondition> completedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'completed',
        value: value,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> floorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> floorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> floorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> floorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Trial, Trial, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Trial, Trial, QAfterFilterCondition> idBetween(
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
}

extension TrialQueryObject on QueryBuilder<Trial, Trial, QFilterCondition> {}

extension TrialQueryLinks on QueryBuilder<Trial, Trial, QFilterCondition> {
  QueryBuilder<Trial, Trial, QAfterFilterCondition> creatures(
      FilterQuery<Creature> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'creatures');
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'creatures', length, true, length, true);
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'creatures', 0, true, 0, true);
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'creatures', 0, false, 999999, true);
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'creatures', 0, true, length, include);
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'creatures', length, include, 999999, true);
    });
  }

  QueryBuilder<Trial, Trial, QAfterFilterCondition> creaturesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'creatures', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TrialQuerySortBy on QueryBuilder<Trial, Trial, QSortBy> {
  QueryBuilder<Trial, Trial, QAfterSortBy> sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> sortByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.asc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> sortByFloorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.desc);
    });
  }
}

extension TrialQuerySortThenBy on QueryBuilder<Trial, Trial, QSortThenBy> {
  QueryBuilder<Trial, Trial, QAfterSortBy> thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> thenByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.asc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> thenByFloorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.desc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Trial, Trial, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TrialQueryWhereDistinct on QueryBuilder<Trial, Trial, QDistinct> {
  QueryBuilder<Trial, Trial, QDistinct> distinctByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed');
    });
  }

  QueryBuilder<Trial, Trial, QDistinct> distinctByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floor');
    });
  }
}

extension TrialQueryProperty on QueryBuilder<Trial, Trial, QQueryProperty> {
  QueryBuilder<Trial, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Trial, bool, QQueryOperations> completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<Trial, int, QQueryOperations> floorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floor');
    });
  }
}
