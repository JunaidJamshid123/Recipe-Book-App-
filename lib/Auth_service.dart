import 'Http_service.dart';
import 'User.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();
  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  User? _user;

  User? get user => _user;

  Future<bool> login(String username, String password) async {
    try {
      var response = await HttpService().post('/auth/login', {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200 && response.data != null) {
        _user = User.fromJson(response.data);
        print(_user!.token);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
