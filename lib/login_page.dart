import 'package:blackcoffer/sign_up_page.dart';
import 'package:blackcoffer/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';
import 'firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController =TextEditingController();
  TextEditingController _passwordController =TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.blue,
        title: Center(child: Text("login Page")),
      ),
          body: Center(
        child: Padding( 
          padding: const EdgeInsets.all(22.0),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Login",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),

              SizedBox(height: 30,),

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
                onTap: _signIp,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: _isSigning? CircularProgressIndicator(color: Colors.white,):Text(
                      "Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account ?"),
                  SizedBox(width: 5,),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                            (Route<dynamic> route) => false, // This predicate will remove all routes
                      );

                    },
                    child: Text("Sign up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                  )
                ],
              )



            ],

    ),
        ),
    ),
    );
  }
  void _signIp() async {

    setState(() {
      _isSigning= true;

    });
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        setState(() {
          _isSigning = false;
        });

        print("User is successfully SignIn");
        Navigator.pushNamed(context, "/home");
      } else {
        print("Some error happened");
      }
    } catch (e) {
      print("Error occurred during sign In: $e");
    }
  }

  
}
