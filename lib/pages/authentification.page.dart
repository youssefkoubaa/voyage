import 'dart:ffi';
import 'dart:ui' as ui; // Add 'as ui' here

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class authentificationPage extends StatelessWidget {
  @override
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_psw = TextEditingController();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Page authentification'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                    controller: txt_login,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Utilisateur",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1)))),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                    obscureText: true,
                    controller: txt_psw,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(width: 1)))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: ui.Size.fromHeight(50)), // Use 'ui.Size'
                    onPressed:(){
                      _onIdentifier(context);
                    }, child: Text('Login',
                  style:TextStyle(fontSize: 22),)),
              ),
              TextButton(onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');
              }, child:
              Text("je n'ai pas un compte",
                  style:TextStyle(fontSize: 22))
              )
            ],
          )),
    );
  }

  Future<void> _onIdentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String? storedLogin = prefs.getString("Login") ; // Retrieve stored login
    String? storedPassword = prefs.getString("password"); // Retrieve stored password

    if (!txt_login.text.isEmpty && !txt_psw.text.isEmpty) {
      if (txt_login.text == storedLogin && txt_psw.text == storedPassword) {
        prefs.setBool("connecte", true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');

      } else {
        const snackBar = SnackBar(content: Text("Identifiants incorrects"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(content: Text("Id ou mdp vide"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}