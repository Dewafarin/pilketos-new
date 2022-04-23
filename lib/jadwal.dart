import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class JadwalPilketos extends StatefulWidget {
  const JadwalPilketos({Key? key}) : super(key: key);

  @override
  _JadwalPilketosState createState() => _JadwalPilketosState();
}

class _JadwalPilketosState extends State<JadwalPilketos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          'Jadwal Pilketos',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: getBody(),
      backgroundColor: Color(0xFFF7F7F7),
    );
  }

  Widget getBody() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: cardItem(),
          );
        });
  }

  Widget cardItem() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          color: Colors.white,
          child: ListTile(
            title: Text(
              "RPL dan TKJ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "26 Maret 2022",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            trailing: Text("15.00 - 18.00"),
          ),
        ),
      ),
    );
  }
}
