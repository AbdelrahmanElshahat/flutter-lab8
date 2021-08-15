import 'package:flutter/material.dart';
import 'package:lab7/Widget/Card.dart';
import 'package:lab7/models/users.dart';

import '../utilties.dart';

class UserDetails extends StatefulWidget {
  Users user;
  UserDetails(this.user);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            card(
              content: "${widget.user.name}",
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                LaunchURL("Mail to:${widget.user.email}");
              },
              child: Text("E-mail : ${widget.user.email}")
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                LaunchURL("tel to:${widget.user.phone}");
              },
              child: Text("phone : ${widget.user.phone}")
            ),
            SizedBox(
              height: 12,
            ),
            Divider(),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                LaunchURL("https://${widget.user.website}");
              },
              child: Text("web: https://${widget.user.website}")
            ),
          ],
        ));
  }
}
