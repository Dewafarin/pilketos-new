import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

import '../welcome-pilketos.dart';

class Yaaa extends StatefulWidget {
  const Yaaa({Key? key}) : super(key: key);

  @override
  _YaaaState createState() => _YaaaState();
}

class _YaaaState extends State<Yaaa> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Pilketos Grafika",
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 34.0,
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
