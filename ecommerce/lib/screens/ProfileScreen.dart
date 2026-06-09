import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Profile Screen"),
      ),
    );
  }
}
