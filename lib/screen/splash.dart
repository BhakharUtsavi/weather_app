import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(
              Icons.cloud,
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Weather App',
              style: GoogleFonts.roboto(color: Colors.white, fontSize:20),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: Center(
    //     child: CircleAvatar(
    //         radius: 60,
    //         backgroundImage: NetworkImage(
    //             "https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096")),
    //   ),
    // );
  }
}
