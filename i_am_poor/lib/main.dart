import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text('Poor Me!'),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: Center(
          child: Image(image: AssetImage('images/poor.jpg')),
        ),
      ),
    ),
  );
}
