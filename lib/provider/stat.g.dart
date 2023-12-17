// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$attackHash() => r'50ab6beec8d77cb3821b151a3cef91343b7be39f';

/// See also [attack].
@ProviderFor(attack)
final attackProvider = AutoDisposeFutureProvider<int>.internal(
  attack,
  name: r'attackProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$attackHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AttackRef = AutoDisposeFutureProviderRef<int>;
String _$defenseHash() => r'9bbe11bfbea130e4a7ce1bf3a2676edf17d4417d';

/// See also [defense].
@ProviderFor(defense)
final defenseProvider = AutoDisposeFutureProvider<int>.internal(
  defense,
  name: r'defenseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$defenseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefenseRef = AutoDisposeFutureProviderRef<int>;
String _$lifeHash() => r'6a1dda03f59fbd2f0e14996fd4cc8f636209eb65';

/// See also [life].
@ProviderFor(life)
final lifeProvider = AutoDisposeFutureProvider<int>.internal(
  life,
  name: r'lifeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lifeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LifeRef = AutoDisposeFutureProviderRef<int>;
String _$manaHash() => r'729b7c649d4b859f325c657bcd72b9d71ead8e83';

/// See also [mana].
@ProviderFor(mana)
final manaProvider = AutoDisposeFutureProvider<int>.internal(
  mana,
  name: r'manaProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$manaHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ManaRef = AutoDisposeFutureProviderRef<int>;
String _$strengthHash() => r'e2fa2cca25558ea774a8750d9b333fb8937a9996';

/// See also [strength].
@ProviderFor(strength)
final strengthProvider = AutoDisposeFutureProvider<int>.internal(
  strength,
  name: r'strengthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$strengthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StrengthRef = AutoDisposeFutureProviderRef<int>;
String _$agilityHash() => r'5703c7138246e138bf632aff1661ed96f9a9fb89';

/// See also [agility].
@ProviderFor(agility)
final agilityProvider = AutoDisposeFutureProvider<int>.internal(
  agility,
  name: r'agilityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$agilityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AgilityRef = AutoDisposeFutureProviderRef<int>;
String _$intelligenceHash() => r'7b5503e601912084b476cd95300649005e5d0fa0';

/// See also [intelligence].
@ProviderFor(intelligence)
final intelligenceProvider = AutoDisposeFutureProvider<int>.internal(
  intelligence,
  name: r'intelligenceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$intelligenceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IntelligenceRef = AutoDisposeFutureProviderRef<int>;
String _$spiritHash() => r'1813ff9032e9ffa872d01e850f7f5be7e8c4ac66';

/// See also [spirit].
@ProviderFor(spirit)
final spiritProvider = AutoDisposeFutureProvider<int>.internal(
  spirit,
  name: r'spiritProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$spiritHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SpiritRef = AutoDisposeFutureProviderRef<int>;
String _$vitalityHash() => r'e47cda664f28ca36017a76acbee224a2515ec1cf';

/// See also [vitality].
@ProviderFor(vitality)
final vitalityProvider = AutoDisposeFutureProvider<int>.internal(
  vitality,
  name: r'vitalityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$vitalityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VitalityRef = AutoDisposeFutureProviderRef<int>;
String _$statsHash() => r'e4f6c5f309cf07f7befd2133a9bd4576635e4bac';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [stats].
@ProviderFor(stats)
const statsProvider = StatsFamily();

/// See also [stats].
class StatsFamily extends Family<AsyncValue<int>> {
  /// See also [stats].
  const StatsFamily();

  /// See also [stats].
  StatsProvider call(
    int stat,
  ) {
    return StatsProvider(
      stat,
    );
  }

  @override
  StatsProvider getProviderOverride(
    covariant StatsProvider provider,
  ) {
    return call(
      provider.stat,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'statsProvider';
}

/// See also [stats].
class StatsProvider extends AutoDisposeFutureProvider<int> {
  /// See also [stats].
  StatsProvider(
    int stat,
  ) : this._internal(
          (ref) => stats(
            ref as StatsRef,
            stat,
          ),
          from: statsProvider,
          name: r'statsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$statsHash,
          dependencies: StatsFamily._dependencies,
          allTransitiveDependencies: StatsFamily._allTransitiveDependencies,
          stat: stat,
        );

  StatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stat,
  }) : super.internal();

  final int stat;

  @override
  Override overrideWith(
    FutureOr<int> Function(StatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StatsProvider._internal(
        (ref) => create(ref as StatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stat: stat,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _StatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatsProvider && other.stat == stat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StatsRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `stat` of this provider.
  int get stat;
}

class _StatsProviderElement extends AutoDisposeFutureProviderElement<int>
    with StatsRef {
  _StatsProviderElement(super.provider);

  @override
  int get stat => (origin as StatsProvider).stat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
