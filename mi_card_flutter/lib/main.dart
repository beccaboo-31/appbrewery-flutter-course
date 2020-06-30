import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/becca.jpeg'),
              ),
              Text(
                'Rebecca Biju',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster',
                  color: Colors.white,
                ),
              ),
              Text(
                'WEB DEVELOPER',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    color: Colors.blue[100],
                    fontSize: 20,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(color: Colors.blue[100],)
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.phone,
                        color: Colors.blue,
                      ),
                    title: Text(
                      '+91 9890087912',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SourceSansPro',
                        color: Colors.blue[900],
                      ),
                    ),
                  )
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                        Icons.email,
                        color: Colors.blue,
                    ),
                    title: Text(
                      'rebecca@email.com',
                      style: TextStyle(
                        fontFamily: 'SourceSanPro',
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
