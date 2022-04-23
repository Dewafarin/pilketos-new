import 'package:flutter/material.dart';
import 'package:pilketos/shared/shared.dart';
import 'package:pilketos/welcome-pilketos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:pilketos/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
        apiKey: "AIzaSyBm9S7oH86SPRzjcoTESbLtaUqKcGdh0iQ",
        appId: "1:270020856507:android:27f65f09d11a397104379e",
        projectId: "pilkeltos-tapwpb",
        messagingSenderId: "270020856507"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pilketos grafika',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: primaryColor,
        canvasColor: Colors.transparent,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const Welcome();
            }
          },
        ),
      );
}
