import 'package:flutter/material.dart';
import 'package:banger/login/login.dart';
//import 'package:banger/shared/shared.dart';
import 'package:banger/topics/topics.dart';
import 'package:banger/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        } else if (snapshot.hasError) {
          return const Text("Error logging in!");
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
