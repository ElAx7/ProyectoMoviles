import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:proyeto_moviles/providers/bloc/auth_bloc.dart';
import 'package:proyeto_moviles/firebase_options.dart';
import 'package:proyeto_moviles/providers/notes/notes_provider.dart';
import 'package:proyeto_moviles/screens/auth/login_page.dart';
import 'package:proyeto_moviles/screens/home/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(VerifyAuthEvent()),
        ),
        ChangeNotifierProvider(create: (context) => NotesProvider()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override  
  Widget build(BuildContext context) {    
    return MaterialApp(
      home: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            print("Error al autenticar");
          }
        },        
        builder: (context, state) {
           if(state is AuthSuccessState){
            return HomePage();
          } else if(state is UnAuthState || state is SignOutSuccessState){
            return LoginPage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
