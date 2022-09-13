import 'package:dio/dio.dart';
import 'package:food_recipes/models/user_response.dart';

class AuthenticationHelper {
  AuthenticationHelper._();
  static AuthenticationHelper authenticationHelper = AuthenticationHelper._();
  Dio dio = Dio();
  List<Users> users = [];

  Future<int?> getCurrentIdOfUser() async {
    String url = "http://192.168.0.165:8000/api/users";
    Response response = await dio.get(url);
    Users user = Users.fromJson(response.data);
    return user.id;
  }
}
