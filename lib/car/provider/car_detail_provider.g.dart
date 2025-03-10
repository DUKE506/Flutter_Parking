// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carDetailHash() => r'f9977dd69c292c53f3e4bc74004c9a985355192f';

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

/// See also [carDetail].
@ProviderFor(carDetail)
const carDetailProvider = CarDetailFamily();

/// See also [carDetail].
class CarDetailFamily extends Family<AsyncValue<CarDetailModel>> {
  /// See also [carDetail].
  const CarDetailFamily();

  /// See also [carDetail].
  CarDetailProvider call({
    required String id,
  }) {
    return CarDetailProvider(
      id: id,
    );
  }

  @override
  CarDetailProvider getProviderOverride(
    covariant CarDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'carDetailProvider';
}

/// See also [carDetail].
class CarDetailProvider extends FutureProvider<CarDetailModel> {
  /// See also [carDetail].
  CarDetailProvider({
    required String id,
  }) : this._internal(
          (ref) => carDetail(
            ref as CarDetailRef,
            id: id,
          ),
          from: carDetailProvider,
          name: r'carDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$carDetailHash,
          dependencies: CarDetailFamily._dependencies,
          allTransitiveDependencies: CarDetailFamily._allTransitiveDependencies,
          id: id,
        );

  CarDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CarDetailModel> Function(CarDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CarDetailProvider._internal(
        (ref) => create(ref as CarDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<CarDetailModel> createElement() {
    return _CarDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CarDetailRef on FutureProviderRef<CarDetailModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CarDetailProviderElement extends FutureProviderElement<CarDetailModel>
    with CarDetailRef {
  _CarDetailProviderElement(super.provider);

  @override
  String get id => (origin as CarDetailProvider).id;
}

String _$asyncCarDetailHash() => r'4607b98aa4fbb4840cda8990dd6fa19babf31581';

abstract class _$AsyncCarDetail
    extends BuildlessAutoDisposeAsyncNotifier<CarDetailModel> {
  late final String id;

  FutureOr<CarDetailModel> build(
    String id,
  );
}

/// See also [AsyncCarDetail].
@ProviderFor(AsyncCarDetail)
const asyncCarDetailProvider = AsyncCarDetailFamily();

/// See also [AsyncCarDetail].
class AsyncCarDetailFamily extends Family<AsyncValue<CarDetailModel>> {
  /// See also [AsyncCarDetail].
  const AsyncCarDetailFamily();

  /// See also [AsyncCarDetail].
  AsyncCarDetailProvider call(
    String id,
  ) {
    return AsyncCarDetailProvider(
      id,
    );
  }

  @override
  AsyncCarDetailProvider getProviderOverride(
    covariant AsyncCarDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'asyncCarDetailProvider';
}

/// See also [AsyncCarDetail].
class AsyncCarDetailProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AsyncCarDetail, CarDetailModel> {
  /// See also [AsyncCarDetail].
  AsyncCarDetailProvider(
    String id,
  ) : this._internal(
          () => AsyncCarDetail()..id = id,
          from: asyncCarDetailProvider,
          name: r'asyncCarDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$asyncCarDetailHash,
          dependencies: AsyncCarDetailFamily._dependencies,
          allTransitiveDependencies:
              AsyncCarDetailFamily._allTransitiveDependencies,
          id: id,
        );

  AsyncCarDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<CarDetailModel> runNotifierBuild(
    covariant AsyncCarDetail notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AsyncCarDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: AsyncCarDetailProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AsyncCarDetail, CarDetailModel>
      createElement() {
    return _AsyncCarDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AsyncCarDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AsyncCarDetailRef on AutoDisposeAsyncNotifierProviderRef<CarDetailModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AsyncCarDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AsyncCarDetail,
        CarDetailModel> with AsyncCarDetailRef {
  _AsyncCarDetailProviderElement(super.provider);

  @override
  String get id => (origin as AsyncCarDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
