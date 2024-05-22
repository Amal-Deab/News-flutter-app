import 'package:flutter/material.dart';
import 'package:newsapp/pages/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(titleTextStyle: TextStyle(color: Colors.green,fontSize: 20,fontWeight:FontWeight.w700 ),
        iconTheme: IconThemeData(color: Colors.green)
        )
      ),
      home:WelcomePage(),
    );
  }
}