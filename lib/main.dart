import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black45,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
