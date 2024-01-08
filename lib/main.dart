import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/start_page.dart';

// main method is the Entry point of the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trivia Quiz',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.pink,
      ),
      home: const StartScreen(),
    );
  }
}
