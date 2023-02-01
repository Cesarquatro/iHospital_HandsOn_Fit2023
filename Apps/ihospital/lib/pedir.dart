import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'menu.dart';
import 'package:mqtt_client/mqtt_client.dart';

String valor = '';

class pedir extends StatelessWidget {
  String? pedido;
  final dropValue = ValueNotifier('');
  final roomOptions = <String>[
    'room_1',
    'room_2',
    'room_3',
    'room_4',
    'room_5',
    'room_6',
    'room_7',
    'room_8',
    'room_9',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Icon(
              Icons.medical_services,
              color: Colors.white,
            ),
            Text("Pedir"),
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
            //Adiconar DropDownMenu
            ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return SizedBox(
                  width: 300,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    icon: Icon(
                      Icons.meeting_room,
                      color: Colors.black,
                    ),
                    hint: Text(
                      "Selecione seu quarto.",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      label: Text('Quarto'),
                      border: OutlineInputBorder(),
                    ),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) =>
                        dropValue.value = escolha.toString(),
                    items: roomOptions
                        .map(
                          (opcao) => DropdownMenuItem(
                            value: opcao,
                            child: Text(opcao),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: TextField(
                onChanged: (value) {
                  pedido = value;
                  print("$pedido");
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Pedido",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            GestureDetector(
              onTap: () {
                print("Botão fazer pedido");
              },
              child: Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                  color: Color.fromARGB(225, 41, 37, 86),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Text(
                      "Realizar pedido",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(45)),
                    Icon(
                      Icons.send,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(45)),
            mqttOn(),
          ],
        ),
      ),
    );
  }
}
