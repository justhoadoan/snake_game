import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBjp8H7C8GsuWQHWrqAVtDB2qiEXOZ5d6s",
      authDomain: "snakegame-1542f.firebaseapp.com",
      projectId: "snakegame-1542f",
      storageBucket: "snakegame-1542f.appspot.com",
      messagingSenderId: "118677879423",
      appId: "1:118677879423:web:47a9136e70bf07e8c3dd4a",
      measurementId: "G-XWKQR155NX" )
    
  );


  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
