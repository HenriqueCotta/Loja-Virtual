//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MaterialApp(
    home: HomeScreen(),
    title: "Flora Store",
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      primaryColor: Colors.cyan[200],
      secondaryHeaderColor: Colors.red[900]
    ),
    debugShowCheckedModeBanner: false,
  ));
}
