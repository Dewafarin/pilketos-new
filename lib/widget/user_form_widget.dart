import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';

class UserFormWidget extends StatelessWidget {
  final String nama;
  final String nis;
  final String password;
  final String level;
  final ValueChanged<String> onChangedNama;
  final ValueChanged<String> onChangedNIS;
  final ValueChanged<String> onChangedPassword;
  final ValueChanged<String> onChangedLevel;
  final VoidCallback onSavedUser;

  const UserFormWidget({
    Key? key,
    this.nama = '',
    this.nis = '',
    this.password = '',
    this.level = '',
    required this.onChangedNama,
    required this.onChangedNIS,
    required this.onChangedPassword,
    required this.onChangedLevel,
    required this.onSavedUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildNama(),
            SizedBox(height: 2),
            buildNIS(),
            SizedBox(height: 2),
            buildPassword(),
            SizedBox(height: 2),
            buildLevel(),
            SizedBox(height: 30),
            buildButton(),
          ],
        ),
      );

  Widget buildNama() => TextFormField(
        maxLines: 1,
        initialValue: nama,
        onChanged: onChangedNama,
        validator: (nama) {
          if (nama!.isEmpty) {
            return 'Nama Kosong!';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nama',
        ),
      );

  Widget buildNIS() => TextFormField(
        maxLines: 1,
        initialValue: nis,
        onChanged: onChangedNIS,
        validator: (nis) {
          if (nis!.isEmpty) {
            return 'NIS Kosong!';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'NIS',
        ),
      );

  Widget buildPassword() => TextFormField(
        maxLines: 1,
        initialValue: nis,
        onChanged: onChangedPassword,
        validator: (password) {
          if (password!.isEmpty) {
            return 'Password Kosong!';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Password',
        ),
      );

  Widget buildLevel() => TextFormField(
        maxLines: 1,
        initialValue: level,
        onChanged: onChangedLevel,
        validator: (level) {
          if (level!.isEmpty) {
            return 'Level Kosong!';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Level',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF323232)),
          ),
          onPressed: onSavedUser,
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
