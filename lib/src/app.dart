import 'package:flutter/material.dart';
import 'package:flutter_api/src/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Beer List App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.black
    ),
    home: HomePage(),
  );
}