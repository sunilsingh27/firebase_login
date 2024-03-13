import 'dart:async';

import 'package:blackcoffer/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplaceSceren extends StatefulWidget {
  const SplaceSceren({super.key});

  @override
  State<SplaceSceren> createState() => _SplaceScerenState();
}

class _SplaceScerenState extends State<SplaceSceren> {

  @override

  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=> LoginPage(),
          ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text("Madrocket Technology & media ",style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white
          )),
        ),
      ),
    );
  }
}