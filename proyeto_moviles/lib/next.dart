//Este código va a ser la continuación de new_list.dart una vez que presionas el botón
import 'package:flutter/material.dart';

class next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esta es de prueba'),
      ),
      body: Center(
        child: Text(
          '¡CONTINUARA...!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
