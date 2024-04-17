import 'package:flutter/material.dart';
import 'package:voyage/pages/authentification.page.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() =>
  runApp( MyApp());


class MyApp extends StatelessWidget {
  final routes={
    '/inscription':(context)=>inscriptionPage(),
    '/authentification':(context)=>authentificationPage(),
    '/home':(context)=>homePage(),
    '/meteo':(context)=>MeteoPage(),
    '/gallerie':(context)=>GalleriePage(),
    '/pays':(context)=>PaysPage(),
    '/contact':(context)=>ContactPage(),
    '/parametres':(context)=>ParametresPage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        home: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot)
            {if(snapshot.connectionState==ConnectionState.done){
              bool conn = snapshot.data!.getBool('connecte') ?? false;
              if(conn)
                return homePage();
            }
            return authentificationPage();

            })
    );
  }
}


