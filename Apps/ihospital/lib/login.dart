import 'package:flutter/material.dart';
import 'dart:math';

class login extends StatelessWidget {
  String usuario = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(228, 48, 42, 100),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.local_hospital,
                size: 160,
                color: Color.fromARGB(226, 140, 133, 216),
              ),
              TextField(
                onChanged: (value) {
                  usuario = value;
                  print("$usuario");
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextField(
                onChanged: (value) {
                  senha = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              TextButton(
                onPressed: () {
                  if (usuario == "Cesarquatro" && senha == "handson1234") {
                    print("Login Autorizado");
                    Navigator.popAndPushNamed(context, "home");
                  } else {
                    print("Usuário ou senha incorreto");
                  }
                },
                child: Text("Login"),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.blueAccent, //cor do fundo

                  onSurface: Colors.grey,
                  padding: const EdgeInsets.all(25), //margem no botão ou
                  //fixedSize: const Size(100, 100), //tamanho fixo da margem
                  shape: RoundedRectangleBorder(
                    //side: BorderSide(color: Colors.green, width: 5), // borda do botão
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
