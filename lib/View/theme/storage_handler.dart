import 'package:get_storage/get_storage.dart';

class StorageHandler{

  final GetStorage _storage = GetStorage();

  static Future<void> init()async{
    await GetStorage.init();
  }

  static StorageHandler? _instance ;
  StorageHandler._();

  factory StorageHandler() => _instance ??= StorageHandler._();

  Future<void> setToken(String token) => _storage.write('token', token);

  Future<void> removeToken() => _storage.remove('token');

  bool get hasToken => _storage.hasData('token');

  String get token => hasToken ? _storage.read('token') : 'no token';


}