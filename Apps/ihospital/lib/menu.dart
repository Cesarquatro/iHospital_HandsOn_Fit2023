import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlutterLogo(
          size: 100,
        ),
        Text("Desenvolvido por:"),
        Text("Cesar, Luiz e Lucas"),
        Icon(
          Icons.copyright,
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "home");
          },
          child: Text("Home"),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, "/");
          },
          child: Text("Logout"),
        ),
      ],
    );
  }
}
