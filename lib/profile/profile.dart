import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:banger/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var report = Provider.of<Report>(context);
    var user = AuthService().user;

    if (user != null) {
      // add your UI here
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 1),
              Text(
                user.displayName ?? "Guest",
                style: Theme.of(context).textTheme.headline2,
              ),
              const Spacer(flex: 1),
              Text(
                user.email ?? "",
                style: Theme.of(context).textTheme.headline4,
              ),
              const Spacer(flex: 2),
              Text(
                "Quizzes completed: ${report.total}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(flex: 3),
              ElevatedButton(
                child: Text('Sign Out'),
                onPressed: () async {
                  await AuthService().signOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          body: Center(
            child: Column(
              children: [
                Text("Error loading profile, try again"),
              ],
            ),
          ));
    }
  }
}
