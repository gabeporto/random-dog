import 'package:dog_flutter_application/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Random Dog App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

