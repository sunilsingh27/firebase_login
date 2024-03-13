import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("HOME PAGE"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("welcome to  Home ")),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context,'/login');
            },
            child: Container(
              height: 45,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text("Sign out",style: TextStyle(color: Colors.white),)),
            ),
          )
        ],
      ),
    );
  }
}
