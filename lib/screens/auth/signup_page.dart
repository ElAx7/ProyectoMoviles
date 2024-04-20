import 'package:flutter/material.dart';
import 'package:proyeto_moviles/screens/auth/login_page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de usuario'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.person), // Icono de persona
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.email), // Icono de correo
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon: Icon(Icons.lock), // Icono de candado
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirmar contraseña',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  prefixIcon:
                      Icon(Icons.lock_outline), // Icono de candado vacío
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8CCAB4),
                ),
                child: Text('Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
