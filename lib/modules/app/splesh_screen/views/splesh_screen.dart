import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatelessWidget {
  const splesh_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splesh.gif"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
