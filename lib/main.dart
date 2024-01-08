import 'package:mavis/home_page.dart';
import 'package:mavis/pallete.dart';
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
      title: 'Mavis',
      
      theme: ThemeData.dark(useMaterial3: true),
      // theme: ThemeData.dark(useMaterial3: true).copyWith(
      //   scaffoldBackgroundColor: Pallete.blackColor,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Pallete.blackColor
      //     ),
      // ),
      home: const HomePage(),
    );
  }
}
