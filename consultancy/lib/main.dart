import 'package:consultancy/Screens/home_page.dart';
import 'package:consultancy/Screens/pii.dart';
import 'package:consultancy/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        title: 'Consultancy App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.teal),
          scaffoldBackgroundColor: kScaffoldColor,
          textTheme: TextTheme(
            bodyText1: GoogleFonts.poppins().copyWith(color: Colors.white),

            // bodyText2: GoogleFonts.poppins().copyWith(color: Color(0xffF8ECD1)),
          ),
        ));
  }
}
