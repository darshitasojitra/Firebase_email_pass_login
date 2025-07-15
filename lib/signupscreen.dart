import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled2/auth.dart';
import 'package:untitled2/login.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _auth=Authservice();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('signup'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.person),
                hintText: 'name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.email),
                  hintText: 'email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.password),
                  hintText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed:_signup, child: Text("Signup")),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login()));
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.red,fontSize: 25),
              )),
        ],
      ),
    );
  }
  _signup()async{
    final user=await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if(user!=null){
      log("user created successfully");

    }
  }
}
