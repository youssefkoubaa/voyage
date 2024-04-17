import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voyage/pages/GallerieDetailsPage.page.dart';

import 'gallerie-details.page.dart';

class GalleriePage extends StatefulWidget {
  @override
  _GalleriePageState createState() => _GalleriePageState();
}

class _GalleriePageState extends State<GalleriePage> {
  final TextEditingController _textController = TextEditingController();

  // Méthode pour naviguer vers GalleryDetailsPage
  void _navigateToDetailsPage(String key) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GallerieDetailsPage(key),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galerie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Keyword',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Naviguer vers GalleryDetailsPage avec la clé saisie
                String inputText = _textController.text;
                _navigateToDetailsPage(inputText);
              },
              child: Text('Chercher'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GalleriePage(),
  ));
}
