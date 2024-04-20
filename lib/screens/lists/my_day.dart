import 'package:flutter/material.dart';
import 'package:proyeto_moviles/screens/home/home_page.dart';

void main() {
  runApp(my_day());
}

class my_day extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyDayScreen(),
    );
  }
}

class MyDayScreen extends StatefulWidget {
  @override
  _MyDayScreenState createState() => _MyDayScreenState();
}

class _MyDayScreenState extends State<MyDayScreen> {
  final List<String> _items = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Mi día')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Agrega tus tareas del día',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textFieldController,
                        decoration: InputDecoration(
                          hintText: 'Ingresa una tarea',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          _items.add(_textFieldController.text);
                          _textFieldController.clear();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: ListView(
                  children: _getItems(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodoItem(String title) {
    return ListTile(
      title: Text(title),
    );
  }

  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    for (String title in _items) {
      _todoWidgets.add(_buildTodoItem(title));
    }
    return _todoWidgets;
  }
}
