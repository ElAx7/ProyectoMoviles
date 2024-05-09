import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  Stream<String> getUserName(bool completeName) {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        String nombreCompleto = user.displayName ?? 'Nombre vacío';
        List<String> nombre = nombreCompleto.split(" ");

        String firstName = nombre.isNotEmpty ? nombre[0] : '';
        String firstLastName;
        if (nombre.length >= 3) {
            firstLastName = nombre.length == 3 ? nombre[1] : nombre[2];
        } else {
            firstLastName = nombre.isNotEmpty ? nombre[1] : '';
        }
        
        if (completeName) {
          String formattedName = nombreCompleto.isNotEmpty
              ? "${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()}" + " " +
                "${firstLastName[0].toUpperCase()}${firstLastName.substring(1).toLowerCase()}"
              : '';
          return formattedName;
        } else {          
          String formattedName = firstName.isNotEmpty
              ? "${firstName[0].toUpperCase()}${firstName.substring(1).toLowerCase()}"
              : '';
          return formattedName;
        }
      } else {
        return 'Nombre vacío';
      }
    });
  }

  Stream<String> getUserEmail() {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        return user.email ?? '';
      } else {
        return '';
      }
    });
  }

  // Metodo que me regresa la imagen del usuario
  Stream<String> getUserImage() {
    return _auth.authStateChanges().map((user) {
      if (user != null) {
        return user.photoURL ?? '';
      } else {
        return '';
      }
    });
  }

  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  Future<void> signOutGoogleUser() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _auth.signInWithCredential(credential);
  }
}
