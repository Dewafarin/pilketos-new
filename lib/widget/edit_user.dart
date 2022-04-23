import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit User',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: getBody(),
      backgroundColor: Color(0xFFF7F7F7),
    );
  }

  Widget getBody() {
    return ListView(
      padding: EdgeInsets.all(30),
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Nama',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'NIS',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Password',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Level',
          ),
        ),

        SizedBox(
          height: 40,
        ),
        // ignore: deprecated_member_use
        FlatButton(
            color: Color(0xFF323232),
            onPressed: () {},
            child: Text(
              "Simpan",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
