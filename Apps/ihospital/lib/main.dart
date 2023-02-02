import 'package:flutter/material.dart';
import 'package:ihospital/pedidos.dart';
import 'home.dart';
import 'login.dart';
import 'menu.dart';
import 'dart:math';
import 'pedir.dart';

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
        "pedir": (context) => pedir(),
        "pedidos": (context) => pedidos(),
      },
    );
  }
}
