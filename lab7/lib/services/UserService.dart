import 'package:dio/dio.dart';
import 'package:lab7/models/users.dart';

class UserService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String users = "users";
  Future<List<Users>> getusers() async {
    List<Users> usersList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl" + "$users");
    var data = response.data;
    data.forEach((element) {
      usersList.add(Users.fromJson(element));
    });
    return usersList;
  }
}