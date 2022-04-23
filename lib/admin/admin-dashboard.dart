import 'package:flutter/material.dart';
import 'package:pilketos/admin/admin-jadwal.dart';
import 'package:pilketos/admin/admin-kandidat.dart';
import 'package:pilketos/admin/admin-user.dart';
import 'package:pilketos/jadwal.dart';
import 'package:pilketos/kandidat.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/welcome-pilketos.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23,
              spreadRadius: -13,
              color: Colors.grey)
        ]);
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .40,
              decoration: BoxDecoration(
                  color: primaryColor,
                  image: DecorationImage(
                    image: AssetImage("assets/images/home-bg.png"),
                    fit: BoxFit.fitWidth,
                  )),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                        icon: Icon(
                          Icons.account_circle_rounded,
                          color: Colors.white,
                          size: 36.0,
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
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Welcome()),
                              );
                            };
                          }
                          ;
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Text("Hai",
                        style: TextStyle(
                          color: whiteColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("namamuuu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    SizedBox(
                      width: size.width * .55,
                      child: Text(
                        "Admin Pemilihan Ketua Osis Grafika",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .08,
                    ),
                    Wrap(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration:
                                BoxDecoration(color: whiteColor, boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 17),
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                  color: Colors.grey)
                            ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AdminKandidat()),
                                  );
                                },
                                radius: 23,
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/voteicon.png"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Kandidat Ketua Osis",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * .015,
                    ),
                    Wrap(
                      children: <Widget>[
                        GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          shrinkWrap: true,
                          primary: false,
                          children: <Widget>[
                            Menu(
                              title: "Jadwal Pilketos",
                              iconSrc: 'assets/images/jadwal.png',
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AdminJadwal()),
                                );
                              },
                            ),
                            Menu(
                              title: "User",
                              iconSrc: 'assets/images/user-admin.png',
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          AdminUser()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  final String iconSrc;
  final String title;
  final Function() press;
  const Menu({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 17,
                spreadRadius: -23,
                color: Colors.black,
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    iconSrc,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
