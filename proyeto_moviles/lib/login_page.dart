import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  bool _rememberMe = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Bienvenido",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: "Correo",
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Contraseña",
            ),
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            obscureText: true,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value!;
                  });
                },
              ),
              Text("Recuérdame"),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Aquí podrías implementar la lógica de inicio de sesión
              // utilizando los valores de _email, _password y _rememberMe
            },
            child: Text("Iniciar Sesión"),
          ),
        ],
      ),
    );
  }
}
