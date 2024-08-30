import 'package:flutter/material.dart';
import 'package:ChatBot_ImageGen/chat_Bot/view/splash_screen.dart';
import 'package:ChatBot_ImageGen/image_generator/screens/home_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Image Generation'),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen())),
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('ChatBot'),
            onTap: () => {
              Navigator.pop(context),
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashScreen())),
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
