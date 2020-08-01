import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override

  Widget build(BuildContext context){
    return Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: const Colors.grey[900]),
        border: Border.all(
          color: Colors.blue[100],
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
    );
  }
}