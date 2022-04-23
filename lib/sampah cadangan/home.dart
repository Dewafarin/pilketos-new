import 'package:flutter/material.dart';
import 'package:pilketos/admin/admin.dart';
import 'package:pilketos/admin/dashboard.dart';
import 'package:pilketos/sampah%20cadangan/yaaa.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/welcome-pilketos.dart';

import 'kandidat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Stack(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      "Sudah Menentukan Kandidat Ketua Osis Pilihanmu?",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .08,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      SessionCard(
                        sessionNum: 1,
                      ),
                      SessionCard(
                        sessionNum: 2,
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: <Widget>[
                        Jadwal(
                          title: "Kandidat Ketua Osis",
                          iconSrc: 'assets/images/voteicon.png',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Yaaa()),
                            );
                          },
                        ),
                        Jadwal(
                          title: "Jadwal Pilketos",
                          iconSrc: 'assets/images/jadwal.png',
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Admin()),
                            );
                          },
                        ),
                        Jadwal(
                          title: "Hasil Pilketos",
                          iconSrc: 'assets/images/hasil.png',
                          press: () {},
                        ),
                        Jadwal(
                          title: "Info Sekolah",
                          iconSrc: 'assets/images/pilketos.png',
                          press: () {},
                        ),
                        Jadwal(
                          title: "Hasil Pilketos",
                          iconSrc: 'assets/images/hasil.png',
                          press: () {},
                        ),
                        Jadwal(
                          title: "Info Sekolah",
                          iconSrc: 'assets/images/pilketos.png',
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;

  const SessionCard({
    Key? key,
    required this.sessionNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        padding: EdgeInsets.all(8.0),
        width: constraint.maxWidth / 2 - 10,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: Colors.grey)
            ]),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 50,
                width: 50,
                child: Image(
                  image: AssetImage("assets/images/voteicon.png"),
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Text("Kandidat \nKetua Osis"),
          ],
        ),
      );
    });
  }
}

class Jadwal extends StatelessWidget {
  final String iconSrc;
  final String title;
  final Function() press;
  const Jadwal({
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
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  Spacer(),
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
