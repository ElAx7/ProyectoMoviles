import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white, // Fondo blanco en el AppBar
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF8CCAB4), // Fondo del Drawer con el color deseado
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
                      leading: Icon(Icons.home, color: Colors.black),
                      title:
                          Text('Inicio', style: TextStyle(color: Colors.black)),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.view_column_sharp, color: Colors.black),
                      title:
                          Text('Mi dia', style: TextStyle(color: Colors.black)),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.list, color: Colors.black),
                      title: Text('Nueva lista',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month, color: Colors.black),
                      title: Text('Calendario',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info, color: Colors.black),
                      title: Text('Mi lista 1',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
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
