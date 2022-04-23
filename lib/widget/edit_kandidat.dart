// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pilketos/shared/shared.dart';

class EditKandidat extends StatefulWidget {
  const EditKandidat({Key? key}) : super(key: key);

  @override
  _EditKandidatState createState() => _EditKandidatState();
}

class _EditKandidatState extends State<EditKandidat> {
  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Edit Kandidat',
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
        ImageKandidat(),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Nama Lengkap',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          maxLines: 1,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Kelas',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          minLines:
              6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '''Visi''',
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          minLines:
              6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '''Misi''',
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

  Widget ImageKandidat() {
    var imageFile = _imageFile;
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: imageFile == null
              ? AssetImage("assets/images/user.jpg")
              : FileImage(File(_imageFile!.path)) as ImageProvider,
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 26.0,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Pilih Foto Kandidat",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            // ignore: deprecated_member_use
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }
}
