import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:bibbab/app/data/models/tokens/tokens.dart';
import '../../core/constans.dart';
import '../../routes/app_pages.dart';
import 'storage_service.dart';

class AuthService extends GetxService {
  StorageService storageService = Get.find();
  late Tokens _tokens;
  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  bool isLogin = false;

  String? get accessToken => _tokens.accessToken;
  Future<bool> refresh() async {
    print('try refresh');
    try {
      var res = await client.post(ApiEndpoints.refresh, data: _tokens.toJson());
      print(res);
      var tokens = Tokens.fromJson(res.data);
      await updateTokens(tokens);
      if (res.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    isLogin = false;
    return false;
  }

  void logout() {
    isLogin = false;
    storageService.clear();
    _tokens = Tokens(null, '');
    Get.offNamed(Routes.SIGNIN);
  }

  Future<bool> login(String email, String password) async =>
      _auth(email, password, ApiEndpoints.login);

  Future<bool> registration(String email, String password) async =>
      _auth(email, password, ApiEndpoints.registration);

  Future<bool> _auth(String email, String password, String path) async {
    try {
      var response = await client.post(path, data: {
        "email": email,
        "password": password,
      });
      var tokens = Tokens.fromJson(response.data);
      await updateTokens(tokens);
      if (response.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> updateTokens(Tokens tokens) async {
    _tokens = tokens;
    await storageService.writeRefreshToken(tokens.refreshToken);
  }

  Future<void> tryLogin() async {
    String refreshToken = storageService.getRefreshToken();
    var tokens = Tokens(null, refreshToken);
    await updateTokens(tokens);
    if (tokens.refreshToken.toString().isEmpty) {
      isLogin = false;
      return;
    } else {
      bool refreshResult = await refresh();
      isLogin = refreshResult;
    }
  }

  Future<AuthService> init() async {
    return this;
  }
}