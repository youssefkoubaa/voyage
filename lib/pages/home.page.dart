import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/drawer.widget.dart';
class homePage extends StatelessWidget {
  @override
  late SharedPreferences prefs;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Page home'),backgroundColor:Colors.green,),
      drawer: MyDrawer(),
      body: Center(
        child: Wrap(
        children: [
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/meteo.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/meteo');
            },
          ),
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/contact.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/gallerie.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/gallerie');
            },
          ),
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/deconnexion.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/authentification');
            },
          ),
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/pays.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pays');
            },
          ),
          InkWell(
            child: Ink.image(
              height: 180,
              width: 180,
              image: AssetImage('images/parametres.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/parametres');
            },
          ),

        ],
      ),
    ),
    );
  }
  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", true);
    Navigator.of(context).pushNamedAndRemoveUntil('/authentification',
            (Route<dynamic> route) => false);

  }
}
