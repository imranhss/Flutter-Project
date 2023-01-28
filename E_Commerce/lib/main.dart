import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),

      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
        // primarySwatch: Colors.red,
      ),

      initialRoute: "/login",
      routes:{
          "/":(context)=>HomePage(),
          "/login":(context)=>LoginPage(),

      } ,
    );
  }
}
