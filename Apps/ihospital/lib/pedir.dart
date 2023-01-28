import 'package:flutter/material.dart';
import 'menu.dart';

class pedir extends StatelessWidget {
  String pedido = "";
  List<String> room = <String>[
    'room_1',
    'room_2',
    'room_3',
    'room_4',
    'room_',
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
            //DropDownMenu
            Padding(padding: EdgeInsets.all(10)),
            TextField(
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
            Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }
}
