import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'menu.dart';
import 'dart:math';

void main() {
  runApp(
    meuapp(),
  );
}

class meuapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: pagina1(),
      //home: pagina2(),
      //home: login(),
      routes: {
        "/": (context) => login(), //rota inicial
        "home": (context) => home(),
        //"pagina2": (context) => pagina2(),
        //"pagina3": (context) => pagina3(),
      },
    );
  }
}
