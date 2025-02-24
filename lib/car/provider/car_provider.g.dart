// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carDashboardStateHash() => r'95d358fadb8bf9b9ce924244aacb9f74906fc8b8';

/// See also [carDashboardState].
@ProviderFor(carDashboardState)
final carDashboardStateProvider =
    AutoDisposeFutureProvider<List<CarDashboardModel>>.internal(
  carDashboardState,
  name: r'carDashboardStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carDashboardStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CarDashboardStateRef
    = AutoDisposeFutureProviderRef<List<CarDashboardModel>>;
String _$carDetailHash() => r'6f164cc31a8d38420f19de26036428cada0cb04b';

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
class CarDetailFamily extends Family<CarParkingModel?> {
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
class CarDetailProvider extends Provider<CarParkingModel?> {
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
    CarParkingModel? Function(CarDetailRef provider) create,
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
  ProviderElement<CarParkingModel?> createElement() {
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
mixin CarDetailRef on ProviderRef<CarParkingModel?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CarDetailProviderElement extends ProviderElement<CarParkingModel?>
    with CarDetailRef {
  _CarDetailProviderElement(super.provider);

  @override
  String get id => (origin as CarDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
