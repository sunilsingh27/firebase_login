import 'package:blackcoffer/firebase_auth_services.dart';
import 'package:blackcoffer/login_page.dart';
import 'package:blackcoffer/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'global/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage ({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSigningUp = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _usernameController =TextEditingController();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();


@override
  void dispose() {
  _usernameController.dispose();
  _emailController.dispose();
  _passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue,
        title: Center(child: Text("Sign up Page")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),

              SizedBox(height: 30,),

              FormContainerWidget(
                controller: _usernameController,
                hintText: "User Name",
                isPasswordField: false,

              ),
              SizedBox(height:10,),

              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,

              ),
              SizedBox(height:10,),

              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),

              SizedBox(height: 30,),

              GestureDetector(
                onTap: _signUp,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                ),
              ),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  SizedBox(width: 5,),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                            (Route<dynamic> route) => false, // This predicate will remove all routes
                      );
                    },
                    child: isSigningUp ? CircularProgressIndicator(color: Colors.white,): Text("Login "
                        ,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                  )
                ],
              )
              







            ],

          ),
        ),
      ),
    );
  }
  void _signUp() async {
  setState(() {
    isSigningUp=true;


  });

    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);
      setState(() {
        isSigningUp=false;
      });
      if (user != null) {
        showToast(message: "User is successfully created");
        Navigator.pushNamed(context, "/login");
      } else {
        print("Some error happened");
      }
    } catch (e) {
      showToast(message: "Error occurred during sign up: $e");
    }
  }


}
