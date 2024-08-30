import 'package:flutter/material.dart';
import 'package:ChatBot_ImageGen/Chat_Bot/nav-drawer.dart';
import 'package:ChatBot_ImageGen/Chat_Bot/intro.dart';
import 'Login/screens/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SignInScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('ChatBot & Image Generator'),
      ),
      body: Center(
        child: Text('ChatBot & Image Generator'),
      ),
    );
  }
}
