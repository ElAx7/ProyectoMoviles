import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyeto_moviles/providers/bloc/auth_bloc.dart';
import 'package:proyeto_moviles/providers/bloc/user_auth_repository.dart';
import 'package:proyeto_moviles/screens/auth/login_page.dart';

class my_account extends StatefulWidget {
  @override
  account_state createState() => account_state();
}

class account_state extends State<my_account> {
  final UserAuthRepository _authRepository = UserAuthRepository();

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
              title: StreamBuilder<String>(
                stream: _authRepository.getUserName(true),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else {
                    return Text('Nombre vacío');
                  }
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: StreamBuilder<String>(
                stream: _authRepository.getUserEmail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  } else {
                    return Text('Correo vacío');
                  }
                },
              ),
            ),            
            Divider(),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 205, 48, 23),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Text(
                    'Salir de la Cuenta',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
