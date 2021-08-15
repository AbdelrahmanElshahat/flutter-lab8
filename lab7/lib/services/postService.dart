import 'package:lab7/models/posts.dart';
import 'package:dio/dio.dart';

class PostService {
  String baseUrl = "https://jsonplaceholder.typicode.com/";
  String posts = "posts";
  Future<List<Posts>> getposts() async {
    List<Posts> postsList = [];
    Dio dio = new Dio();
    Response response = await dio.get("$baseUrl" + "$posts");
    var data = response.data;
    data.forEach((element) {
      postsList.add(Posts.fromJson(element));
    });
    return postsList;
  }
}
