import 'package:flutter/material.dart';
import 'package:proyeto_moviles/screens/lists/next.dart';

class my_list extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<my_list> {
  List<bool> taskStates = [false, false, false, false];
  List<String> tasks = ['Tarea 1', 'Tarea 2', 'Tarea 3', 'Tarea 4'];
  final TextEditingController _newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Mi Lista 1')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Cierra la pantalla actual
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Descripcion de la lista',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            ...tasks.asMap().entries.map((entry) {
              int index = entry.key;
              String task = entry.value;
              return Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(labelText: task),
                    ),
                  ),
                  IconButton(
                    icon: Icon(taskStates[index]
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
                    onPressed: () {
                      setState(() {
                        taskStates[index] = !taskStates[index];
                      });
                    },
                  ),
                ],
              );
            }).toList(),
            Expanded(child: Container()),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Agregar Tarea',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      content: TextField(
                        controller: _newTaskController,
                        decoration: InputDecoration(
                            hintText: 'Ingresa una nueva tarea'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tasks.add(_newTaskController.text);
                              taskStates.add(false);
                              _newTaskController.clear();
                            });
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF8CCAB4),
                          ),
                          child: Text(
                            'Agregar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8CCAB4),
              ),
              child: Text(
                'Agregar Tarea >',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
