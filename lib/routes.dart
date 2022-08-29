import 'package:banger/about/about.dart';
import 'package:banger/home/home.dart';
import 'package:banger/login/login.dart';
import 'package:banger/profile/profile.dart';
import 'package:banger/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/about': (context) => const AboutScreen(),
};
