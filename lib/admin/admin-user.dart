import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/widget/add_user_dialog.dart';
import 'package:pilketos/widget/edit_user.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({Key? key}) : super(key: key);

  @override
  _AdminUserState createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'User',
          style: TextStyle(color: Colors.white, fontSize: 19),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: getBody(),
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
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            color: Colors.white,
            child: ListTile(
              title: Text(
                "NIS",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "namamuu",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
              trailing: Text("level"),
            ),
          ),
        ),
        actions: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: IconSlideAction(
              color: Colors.green,
              icon: Icons.edit,
              caption: 'Edit',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EditUser()),
                );
              },
            ),
          ),
        ],
        secondaryActions: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: IconSlideAction(
              color: Colors.red,
              icon: Icons.delete,
              caption: 'Hapus',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
