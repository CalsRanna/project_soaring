// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dungeon.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDungeonCollection on Isar {
  IsarCollection<Dungeon> get dungeons => this.collection();
}

const DungeonSchema = CollectionSchema(
  name: r'dungeons',
  id: 7734008579263544280,
  properties: {
    r'difficulty': PropertySchema(
      id: 0,
      name: r'difficulty',
      type: IsarType.long,
    ),
    r'explored': PropertySchema(
      id: 1,
      name: r'explored',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'story': PropertySchema(
      id: 3,
      name: r'story',
      type: IsarType.string,
    ),
    r'tiles': PropertySchema(
      id: 4,
      name: r'tiles',
      type: IsarType.objectList,
      target: r'tiles',
    )
  },
  estimateSize: _dungeonEstimateSize,
  serialize: _dungeonSerialize,
  deserialize: _dungeonDeserialize,
  deserializeProp: _dungeonDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'tiles': TileSchema},
  getId: _dungeonGetId,
  getLinks: _dungeonGetLinks,
  attach: _dungeonAttach,
  version: '3.1.0+1',
);

int _dungeonEstimateSize(
  Dungeon object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.story.length * 3;
  bytesCount += 3 + object.tiles.length * 3;
  {
    final offsets = allOffsets[Tile]!;
    for (var i = 0; i < object.tiles.length; i++) {
      final value = object.tiles[i];
      bytesCount += TileSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _dungeonSerialize(
  Dungeon object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.difficulty);
  writer.writeBool(offsets[1], object.explored);
  writer.writeString(offsets[2], object.name);
  writer.writeString(offsets[3], object.story);
  writer.writeObjectList<Tile>(
    offsets[4],
    allOffsets,
    TileSchema.serialize,
    object.tiles,
  );
}

Dungeon _dungeonDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Dungeon();
  object.difficulty = reader.readLong(offsets[0]);
  object.explored = reader.readBool(offsets[1]);
  object.id = id;
  object.name = reader.readString(offsets[2]);
  object.story = reader.readString(offsets[3]);
  object.tiles = reader.readObjectList<Tile>(
        offsets[4],
        TileSchema.deserialize,
        allOffsets,
        Tile(),
      ) ??
      [];
  return object;
}

P _dungeonDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectList<Tile>(
            offset,
            TileSchema.deserialize,
            allOffsets,
            Tile(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dungeonGetId(Dungeon object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dungeonGetLinks(Dungeon object) {
  return [];
}

void _dungeonAttach(IsarCollection<dynamic> col, Id id, Dungeon object) {
  object.id = id;
}

extension DungeonQueryWhereSort on QueryBuilder<Dungeon, Dungeon, QWhere> {
  QueryBuilder<Dungeon, Dungeon, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DungeonQueryWhere on QueryBuilder<Dungeon, Dungeon, QWhereClause> {
  QueryBuilder<Dungeon, Dungeon, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Dungeon, Dungeon, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterWhereClause> idBetween(
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

extension DungeonQueryFilter
    on QueryBuilder<Dungeon, Dungeon, QFilterCondition> {
  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> difficultyEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> difficultyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> difficultyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> difficultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> exploredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explored',
        value: value,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'story',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'story',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'story',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'story',
        value: '',
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> storyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'story',
        value: '',
      ));
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tiles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DungeonQueryObject
    on QueryBuilder<Dungeon, Dungeon, QFilterCondition> {
  QueryBuilder<Dungeon, Dungeon, QAfterFilterCondition> tilesElement(
      FilterQuery<Tile> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tiles');
    });
  }
}

extension DungeonQueryLinks
    on QueryBuilder<Dungeon, Dungeon, QFilterCondition> {}

extension DungeonQuerySortBy on QueryBuilder<Dungeon, Dungeon, QSortBy> {
  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByExplored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explored', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByExploredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explored', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByStory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'story', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> sortByStoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'story', Sort.desc);
    });
  }
}

extension DungeonQuerySortThenBy
    on QueryBuilder<Dungeon, Dungeon, QSortThenBy> {
  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByExplored() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explored', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByExploredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explored', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByStory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'story', Sort.asc);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QAfterSortBy> thenByStoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'story', Sort.desc);
    });
  }
}

extension DungeonQueryWhereDistinct
    on QueryBuilder<Dungeon, Dungeon, QDistinct> {
  QueryBuilder<Dungeon, Dungeon, QDistinct> distinctByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty');
    });
  }

  QueryBuilder<Dungeon, Dungeon, QDistinct> distinctByExplored() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explored');
    });
  }

  QueryBuilder<Dungeon, Dungeon, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Dungeon, Dungeon, QDistinct> distinctByStory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'story', caseSensitive: caseSensitive);
    });
  }
}

extension DungeonQueryProperty
    on QueryBuilder<Dungeon, Dungeon, QQueryProperty> {
  QueryBuilder<Dungeon, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Dungeon, int, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<Dungeon, bool, QQueryOperations> exploredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explored');
    });
  }

  QueryBuilder<Dungeon, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Dungeon, String, QQueryOperations> storyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'story');
    });
  }

  QueryBuilder<Dungeon, List<Tile>, QQueryOperations> tilesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tiles');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TileSchema = Schema(
  name: r'tiles',
  id: 4251427989165971134,
  properties: {
    r'difficulty': PropertySchema(
      id: 0,
      name: r'difficulty',
      type: IsarType.long,
    ),
    r'explored': PropertySchema(
      id: 1,
      name: r'explored',
      type: IsarType.bool,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.long,
    ),
    r'x': PropertySchema(
      id: 3,
      name: r'x',
      type: IsarType.long,
    ),
    r'y': PropertySchema(
      id: 4,
      name: r'y',
      type: IsarType.long,
    )
  },
  estimateSize: _tileEstimateSize,
  serialize: _tileSerialize,
  deserialize: _tileDeserialize,
  deserializeProp: _tileDeserializeProp,
);

int _tileEstimateSize(
  Tile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tileSerialize(
  Tile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.difficulty);
  writer.writeBool(offsets[1], object.explored);
  writer.writeLong(offsets[2], object.type);
  writer.writeLong(offsets[3], object.x);
  writer.writeLong(offsets[4], object.y);
}

Tile _tileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Tile();
  object.difficulty = reader.readLong(offsets[0]);
  object.explored = reader.readBool(offsets[1]);
  object.type = reader.readLong(offsets[2]);
  object.x = reader.readLong(offsets[3]);
  object.y = reader.readLong(offsets[4]);
  return object;
}

P _tileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TileQueryFilter on QueryBuilder<Tile, Tile, QFilterCondition> {
  QueryBuilder<Tile, Tile, QAfterFilterCondition> difficultyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> difficultyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> difficultyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'difficulty',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> difficultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'difficulty',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> exploredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explored',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> typeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> typeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> typeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> typeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> xEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> xGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> xLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> xBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> yEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> yGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> yLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
      ));
    });
  }

  QueryBuilder<Tile, Tile, QAfterFilterCondition> yBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TileQueryObject on QueryBuilder<Tile, Tile, QFilterCondition> {}
