import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: 
        Center(
          child: Text("KARIBU MKUU UMELOGIN JRIIT/DICT/220",
          style: TextStyle(fontSize: 12),),
        ),
      ),
    );
  }
}