// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statsHash() => r'0138e71aa7b28f1cda1d0374c0121d725fd4051e';

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
