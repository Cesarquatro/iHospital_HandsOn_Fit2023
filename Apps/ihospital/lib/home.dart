import 'package:flutter/material.dart';
import 'dart:math';
import 'menu.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.home,
            ),
            Text("Home"),
          ],
        ),
      ),
      drawer: Drawer(
        child: menu(),
      ),
      body: Container(
        color: Color.fromARGB(228, 48, 42, 100),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, "pedir");
                    print("Botão Pedir");
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 41, 37, 86),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medical_services,
                          size: 50,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Pedir",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, "pedidos");
                    print("Botão Pedidos");
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 41, 37, 86),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dvr,
                          size: 50,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Pedidos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    //Navigator.popAndPushNamed(context, "pedir");
                    print("Botão Ajuda");
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 41, 37, 86),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.emergency,
                          size: 50,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Solicitar ajuda!",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                  onTap: () {
                    //Navigator.popAndPushNamed(context, "pedir");
                    print("Botão Pedidos");
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(225, 41, 37, 86),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.white,
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "Conta",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
