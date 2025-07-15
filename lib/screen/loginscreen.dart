import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/home.dart';

import '../model/api.dart';
import 'package:http/http.dart'as http;

import 'categoryscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  Future<loginmodel?>userlogin(String email,String password)async{
    final response=await http.get(Uri.parse("https://physiotherapycenter.mdidminfoway.com/darsita/bagsellingApi/ClientLogin.php"));
    if(response.statusCode==200){
      loginmodel loginModel=loginmodel.fromJson(jsonDecode(response.body));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Categoryscreen()));
    }else{
      throw Exception('Failed login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'email',suffixIcon: Icon(Icons.email)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password',suffixIcon: Icon(Icons.password)
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            userlogin(email.text.toString(), password.text.toString());
          }, child:Text('login'))
        ],
      ),
    );
  }
}
