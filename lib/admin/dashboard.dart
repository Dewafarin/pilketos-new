import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

import '../welcome-pilketos.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Pilketos Grafika',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.manage_accounts_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Profil"),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text("Keluar"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                print("Profil belum dibuat");
              } else if (value == 1) {
                onPressed:
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Welcome()),
                  );
                };
              }
              ;
            },
          ),
        ],
      ),
    );
  }
}
