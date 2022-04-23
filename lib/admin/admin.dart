import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/widget/add_user_dialog.dart';

import '../welcome-pilketos.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(
        child: Text("Ini Kandidat"),
      ),
      Container(
        child: Text("Ini Jadwal"),
      ),
      Container(
        child: Text("Ini User"),
      )
    ];
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_tree,
              ),
              label: 'Kandidat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.date_range,
              ),
              label: 'Jadwal'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box,
              ),
              label: 'User'),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: primaryColor,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddUserDialog(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
