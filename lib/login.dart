import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/signupscreen.dart';
import 'auth.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth=Authservice();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText=true;
String? _error;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _password,
                obscureText: _obscureText,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(),
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }, icon: Icon(_obscureText? CupertinoIcons.eye_slash:CupertinoIcons.eye))
                ),
              ),
            ),
          ),
          OutlinedButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          }, child: Text('Login')),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signupscreen()));
              },
              child: Text(
                "Signup",
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
_login()async{
    final user=await _auth.loginUserWithEmailPAssword(_email.text, _password.text);
    if(user!=null){
      log('user logged in');
    }
}
}
