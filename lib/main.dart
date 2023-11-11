import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyBukwzXvYZK57F1KFnBC-P3CqRsry-vfRw",
      authDomain: "snakegame-24477.firebaseapp.com",
      projectId: "snakegame-24477",
      storageBucket: "snakegame-24477.appspot.com",
      messagingSenderId: "558887914113",
      appId: "1:558887914113:web:2b66a682d5ee49439edb80",
      measurementId: "G-6QYERMCM6V" )
    
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
