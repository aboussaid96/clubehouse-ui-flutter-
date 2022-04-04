import 'package:clubehouse_ui/Constant.dart';
import 'package:clubehouse_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "ClubeHouse UI",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: kBackgroundColor),
            scaffoldBackgroundColor: kBackgroundColor,
            primaryColor: Colors.white,
            accentColor: kAccentColor,
            iconTheme: IconThemeData(color: Colors.black),
            fontFamily: GoogleFonts.montserrat().fontFamily,
            //textTheme: GoogleFonts.monofettTextTheme()
        ),
        home: homeScreen());
  }
}
