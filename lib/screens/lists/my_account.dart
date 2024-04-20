import 'package:flutter/material.dart';
import 'package:proyeto_moviles/screens/auth/login_page.dart';

class my_account extends StatefulWidget {
  @override
  account_state createState() => account_state();
}

class account_state extends State<my_account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi cuenta'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Datos del Usuario',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('{Nombre de Usuario}'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('{Correo Usuario}'),
            ),
            Divider(),
            Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración de la Cuenta'),
            ),
            Divider(),
            Container(
              alignment: Alignment.center, //
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                    0xFF8CCAB4,
                  ),
                ),
                child: Text(
                  'Salir de la Cuenta',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
