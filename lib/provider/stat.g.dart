// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$statHash() => r'd9fb4dcf94943a436f2819df77393301ef525022';

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

/// See also [stat].
@ProviderFor(stat)
const statProvider = StatFamily();

/// See also [stat].
class StatFamily extends Family<AsyncValue<int>> {
  /// See also [stat].
  const StatFamily();

  /// See also [stat].
  StatProvider call(
    int type,
  ) {
    return StatProvider(
      type,
    );
  }

  @override
  StatProvider getProviderOverride(
    covariant StatProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'statProvider';
}

/// See also [stat].
class StatProvider extends AutoDisposeFutureProvider<int> {
  /// See also [stat].
  StatProvider(
    int type,
  ) : this._internal(
          (ref) => stat(
            ref as StatRef,
            type,
          ),
          from: statProvider,
          name: r'statProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$statHash,
          dependencies: StatFamily._dependencies,
          allTransitiveDependencies: StatFamily._allTransitiveDependencies,
          type: type,
        );

  StatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final int type;

  @override
  Override overrideWith(
    FutureOr<int> Function(StatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StatProvider._internal(
        (ref) => create(ref as StatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _StatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StatProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StatRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `type` of this provider.
  int get type;
}

class _StatProviderElement extends AutoDisposeFutureProviderElement<int>
    with StatRef {
  _StatProviderElement(super.provider);

  @override
  int get type => (origin as StatProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
