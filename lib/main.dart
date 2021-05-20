import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFDFDFD),
        primarySwatch: Colors.grey,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.copyWith(),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
