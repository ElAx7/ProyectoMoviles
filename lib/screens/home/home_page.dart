import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proyeto_moviles/content/notes/item_note.dart';
import 'package:proyeto_moviles/providers/bloc/user_auth_repository.dart';
import 'package:proyeto_moviles/screens/lists/calendario_screen.dart';
import 'package:proyeto_moviles/screens/lists/my_account.dart';
import 'package:proyeto_moviles/screens/lists/new_list.dart';
import 'package:proyeto_moviles/screens/lists/my_list.dart';
import 'package:proyeto_moviles/screens/lists/new_note.dart';

class HomePage extends StatelessWidget {
  final UserAuthRepository _authRepository = UserAuthRepository();
  final _fabKey = GlobalKey<ExpandableFabState>();  

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
        title: StreamBuilder<String>(
          stream: _authRepository.getUserName(false),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return Text('Bienvenido ${snapshot.data}');
            } else {
              return Text('Bienvenido');
            }	
          },
        ),
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
                          Icon(Icons.account_circle_sharp, color: Colors.black),
                      title: Text('Mi cuenta',
                          style: TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => my_account(),
                          ),
                        );
                      },
                    ),
                    // ListTile(
                    //   leading:
                    //       Icon(Icons.view_column_sharp, color: Colors.black),
                    //   title:
                    //       Text('Mi dia', style: TextStyle(color: Colors.black)),
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => my_day(),
                    //       ),
                    //     );
                    //   },
                    // ),
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
                    StreamBuilder<String>(
                      stream: _authRepository.getUserImage(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          return CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!),
                            child: Icon(Icons.person),
                          );
                        } else {
                          return CircleAvatar(
                            child: Icon(Icons.person),
                          );
                        }
                      },
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<String>(
                          stream: _authRepository.getUserName(true),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              return Text('${snapshot.data}');
                            } else {
                              return Text('Usuario google');
                            }	
                          },
                        ),
                        StreamBuilder<String>(
                          stream: _authRepository.getUserEmail(),
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              return Text('${snapshot.data}');
                            } else {
                              return Text('user@example.com');
                            }	
                          },
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
      body: FirestoreListView(
        padding: EdgeInsets.symmetric(horizontal: 18),
        pageSize: 15,
        query: FirebaseFirestore.instance
          .collection("tasks")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .orderBy("createdAt", descending: false),
        itemBuilder: (BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> document) {
          String noteId = document.id;
          return ItemNote(
            key: ValueKey(noteId),
            noteId: noteId,
            noteContent: document.data()
          );
        },
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        children: [
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "Nueva nota",
            child: Icon(Icons.file_copy),
            onPressed: () {
              print("Nueva nota button");
              _fabKey.currentState?.toggle();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => NewNote(),
                ),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            tooltip: "Nueva carpeta",
            child: Icon(Icons.folder),
            onPressed: () {
              _fabKey.currentState?.toggle();
            },
          ),
        ],
      ),
    );
  }
}
