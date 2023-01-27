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
                Container(
                  color: Colors.amber,
                  height: 140,
                  width: 140,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  color: Colors.amber,
                  height: 140,
                  width: 140,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.amber,
                  height: 140,
                  width: 140,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  color: Colors.amber,
                  height: 140,
                  width: 140,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
