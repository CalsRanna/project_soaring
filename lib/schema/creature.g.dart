// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCreatureCollection on Isar {
  IsarCollection<Creature> get creatures => this.collection();
}

const CreatureSchema = CollectionSchema(
  name: r'creatures',
  id: -8457060367723167695,
  properties: {
    r'attack': PropertySchema(
      id: 0,
      name: r'attack',
      type: IsarType.long,
    ),
    r'defense': PropertySchema(
      id: 1,
      name: r'defense',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 2,
      name: r'level',
      type: IsarType.long,
    ),
    r'life': PropertySchema(
      id: 3,
      name: r'life',
      type: IsarType.long,
    ),
    r'mana': PropertySchema(
      id: 4,
      name: r'mana',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'rank': PropertySchema(
      id: 6,
      name: r'rank',
      type: IsarType.long,
    )
  },
  estimateSize: _creatureEstimateSize,
  serialize: _creatureSerialize,
  deserialize: _creatureDeserialize,
  deserializeProp: _creatureDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _creatureGetId,
  getLinks: _creatureGetLinks,
  attach: _creatureAttach,
  version: '3.1.0+1',
);

int _creatureEstimateSize(
  Creature object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _creatureSerialize(
  Creature object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.attack);
  writer.writeLong(offsets[1], object.defense);
  writer.writeLong(offsets[2], object.level);
  writer.writeLong(offsets[3], object.life);
  writer.writeLong(offsets[4], object.mana);
  writer.writeString(offsets[5], object.name);
  writer.writeLong(offsets[6], object.rank);
}

Creature _creatureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Creature();
  object.attack = reader.readLong(offsets[0]);
  object.defense = reader.readLong(offsets[1]);
  object.id = id;
  object.level = reader.readLong(offsets[2]);
  object.life = reader.readLong(offsets[3]);
  object.mana = reader.readLong(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.rank = reader.readLong(offsets[6]);
  return object;
}

P _creatureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _creatureGetId(Creature object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _creatureGetLinks(Creature object) {
  return [];
}

void _creatureAttach(IsarCollection<dynamic> col, Id id, Creature object) {
  object.id = id;
}

extension CreatureQueryWhereSort on QueryBuilder<Creature, Creature, QWhere> {
  QueryBuilder<Creature, Creature, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CreatureQueryWhere on QueryBuilder<Creature, Creature, QWhereClause> {
  QueryBuilder<Creature, Creature, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Creature, Creature, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Creature, Creature, QAfterWhereClause> idBetween(
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

extension CreatureQueryFilter
    on QueryBuilder<Creature, Creature, QFilterCondition> {
  QueryBuilder<Creature, Creature, QAfterFilterCondition> attackEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> attackGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> attackLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attack',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> attackBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attack',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> defenseEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> defenseGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> defenseLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'defense',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> defenseBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'defense',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Creature, Creature, QAfterFilterCondition> levelEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> lifeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'life',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> lifeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'life',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> lifeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'life',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> lifeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'life',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> manaEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mana',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> manaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mana',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> manaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mana',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> manaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mana',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> rankEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> rankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> rankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rank',
        value: value,
      ));
    });
  }

  QueryBuilder<Creature, Creature, QAfterFilterCondition> rankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CreatureQueryObject
    on QueryBuilder<Creature, Creature, QFilterCondition> {}

extension CreatureQueryLinks
    on QueryBuilder<Creature, Creature, QFilterCondition> {}

extension CreatureQuerySortBy on QueryBuilder<Creature, Creature, QSortBy> {
  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attack', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attack', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defense', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByDefenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defense', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'life', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'life', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByMana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mana', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByManaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mana', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }
}

extension CreatureQuerySortThenBy
    on QueryBuilder<Creature, Creature, QSortThenBy> {
  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attack', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByAttackDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attack', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defense', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByDefenseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defense', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'life', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByLifeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'life', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByMana() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mana', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByManaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mana', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<Creature, Creature, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }
}

extension CreatureQueryWhereDistinct
    on QueryBuilder<Creature, Creature, QDistinct> {
  QueryBuilder<Creature, Creature, QDistinct> distinctByAttack() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attack');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByDefense() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defense');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByLife() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'life');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByMana() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mana');
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Creature, Creature, QDistinct> distinctByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank');
    });
  }
}

extension CreatureQueryProperty
    on QueryBuilder<Creature, Creature, QQueryProperty> {
  QueryBuilder<Creature, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> attackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attack');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> defenseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defense');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> lifeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'life');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> manaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mana');
    });
  }

  QueryBuilder<Creature, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Creature, int, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }
}
