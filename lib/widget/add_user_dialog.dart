import 'package:flutter/material.dart';

import 'user_form_widget.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({Key? key}) : super(key: key);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final _formKey = GlobalKey<FormState>();
  String nama = '';
  String nis = '';
  String password = '';
  String level = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
          content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tambah User",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          UserFormWidget(
              onChangedNama: (nama) => setState(() => this.nama = nama),
              onChangedNIS: (nis) => setState(() => this.nis = nis),
              onChangedPassword: (password) =>
                  setState(() => this.password = password),
              onChangedLevel: (level) => setState(() => this.level = level),
              onSavedUser: () {})
        ],
      ));
}
