import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_provider.g.dart';

@riverpod
FlutterSecureStorage SecureStorageState(ref) {
  final storage = FlutterSecureStorage();
  return storage;
}
