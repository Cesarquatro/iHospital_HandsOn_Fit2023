import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'cloud.dart';
import 'menu.dart';
import 'package:mqtt_client/mqtt_client.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'cloud.dart';
import 'menu.dart';
import 'package:mqtt_client/mqtt_client.dart';

String valor = '';

class pedidos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Icon(
              Icons.dvr,
              color: Colors.white,
            ),
            Text("Pedidos"),
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
            Padding(padding: EdgeInsets.all(10)),
            mqttOn(),
            Padding(padding: EdgeInsets.all(45)),
          ],
        ),
      ),
    );
  }
}

//Pedir
