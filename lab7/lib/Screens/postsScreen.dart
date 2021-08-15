import 'package:flutter/material.dart';
import 'package:lab7/models/posts.dart';
import 'package:lab7/services/postService.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  bool loading = true;
  List<Posts> post = [];
  getpostsList() async {
    post = await PostService().getposts();
    loading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getpostsList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts Screen "),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: post.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text("${post[index].title}")),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
