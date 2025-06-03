import 'package:flutter/material.dart';
import 'package:hometest/injection.dart';
import 'package:hometest/ui/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter get_it Login Example',
      home: LoginScreen(),
    );
  }
}
