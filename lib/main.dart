import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tcc/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'dart:html';

import 'package:image_picker/image_picker.dart';
import 'package:tcc/widgets/loginpage.dart';
import 'package:tcc/widgets/registerpage.dart';
import 'package:tcc/widgets/adoptionpage.dart';
import 'package:tcc/widgets/searchpage.dart';
import 'package:tcc/widgets/chatpage.dart';
import 'package:tcc/widgets/vetpage.dart';
import 'package:tcc/widgets/profilepage.dart';
import 'package:tcc/widgets/button/button.dart';
import 'package:tcc/widgets/welcome.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      title: 'DetectPet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue),
      home: WelcomePage(),
    ));
  }
}
