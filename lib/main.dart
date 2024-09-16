import 'package:flutter/material.dart';
import 'package:meuapp/view/login_screen.dart';
import 'package:meuapp/view/home_screen.dart';
import 'package:meuapp/view/holiday_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) =>  HomeScreen(),
        '/holidays': (context) => HolidayScreen(),
      },
    );
  }
}
