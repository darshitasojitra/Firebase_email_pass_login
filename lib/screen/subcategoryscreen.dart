import 'package:flutter/material.dart';

class Subcategoryscreen extends StatefulWidget {
  const Subcategoryscreen({super.key});

  @override
  State<Subcategoryscreen> createState() => _SubcategoryscreenState();
}

class _SubcategoryscreenState extends State<Subcategoryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('hello',style: TextStyle(fontSize: 25),)),
    );
  }
}
