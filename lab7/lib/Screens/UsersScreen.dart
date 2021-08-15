import 'package:flutter/material.dart';
import 'package:lab7/Screens/Userdetails.dart';
import 'package:lab7/Widget/Card.dart';
import 'package:lab7/models/users.dart';
import 'package:lab7/services/UserService.dart';
import 'package:lab7/utilties.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreen createState() => _UsersScreen();
}


class _UsersScreen extends State<UsersScreen> {
  bool loading = true;
  List<Users> user = [];
  getusersList() async {
    user = await UserService().getusers();
    loading = false;
    setState(() {});
  }

  void initState() {
    super.initState();
    getusersList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Screen "),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: user.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:InkWell(
                    onTap: (){
                      pushPage(context, UserDetails(user[index]));
                    },
                  
                      child: card(content: "${user[index].name}")),
                );
              },
            ),
    );
  }
}
