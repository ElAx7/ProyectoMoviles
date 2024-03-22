import 'package:flutter/material.dart';
import 'package:proyeto_moviles/main.dart';

class calendario_screen extends StatefulWidget {
  @override
  calendario_state createState() => calendario_state();
}

class calendario_state extends State<calendario_screen> {
  DateTime _selectedDay =
      DateTime.now(); // Inicialmente seleccionado el día de hoy

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Cambio aquí
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Cambio aquí
              children: <Widget>[
                Text(
                  'Ve los días límites de entrega de tus tareas',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Selecciona un día para ver los eventos:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: Center(
                  child: Text(
                    'Contenido para el día ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
