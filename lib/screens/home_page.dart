import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tabs/home_tab.dart';
import 'package:loja_virtual/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fireBase = Firebase.initializeApp();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        FutureBuilder(
          future: _fireBase,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Você tem um erro ${snapshot.error.toString()}");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              return Scaffold(
                body: HomeTab(),
                drawer: CustomDrawer(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }
}
