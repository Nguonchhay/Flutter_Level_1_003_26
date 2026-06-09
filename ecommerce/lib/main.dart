import 'package:ecommerce/screens/HomeScreen.dart';
import 'package:ecommerce/screens/LoginScreen.dart';
import 'package:ecommerce/screens/ProfileScreen.dart';
import 'package:ecommerce/screens/SignUp.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
      },
    );
  }
}
