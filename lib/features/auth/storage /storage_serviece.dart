import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageServiece {
  static FlutterSecureStorage storage = FlutterSecureStorage();

  static Future<void> saveToken(String token)async{
    await storage.write(key: 'access_token', value: token);
  }

  static Future getToken()async{
     return await storage.read(key:'access_token');
  }

  static Future<void> removeToken()async{
    await storage.delete(key: 'access_token');
  }
}