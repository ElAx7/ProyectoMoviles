import 'package:flutter/material.dart';
import 'package:proyeto_moviles/screens/lists/calendario_screen.dart';
import 'package:proyeto_moviles/screens/lists/new_list.dart';
import 'package:proyeto_moviles/screens/lists/my_day.dart';
import 'package:proyeto_moviles/screens/lists/my_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: 'Menú',
            );
          },
        ),
        title: Text('Hola {NombreUsuario}'),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF8CCAB4),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color(0xFF8CCAB4),
                      ),
                      child: Text(
                        'Menú principal',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.view_column_sharp, color: Colors.black),
                      title:
                          Text('Mi dia', style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => my_day(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list, color: Colors.black),
                      title: Text('Nueva lista',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new_list(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month, color: Colors.black),
                      title: Text('Calendario',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calendario_screen(),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info, color: Colors.black),
                      title: Text('Mi lista 1',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => my_list(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '{NombreUsuario}',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '{CorreoUsuario}@example.com',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_travel,
                    size: 48.0,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Sobre Nosotros',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Somos una empresa dedicada a brindar soluciones innovadoras en tecnología. Nuestro equipo de expertos trabaja incansablemente para satisfacer las necesidades de nuestros clientes.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF8CCAB4)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
