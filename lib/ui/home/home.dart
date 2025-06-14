import 'package:flutter/material.dart';
import 'package:hometest/data/models/user.dart';
import 'package:hometest/ui/login/login.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Job Title: ${user.jobTitle}'),
            ElevatedButton(
              onPressed: () {
                // Handle logout logic here
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
