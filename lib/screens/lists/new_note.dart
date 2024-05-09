import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:proyeto_moviles/providers/notes/notes_provider.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? selectedColor;
  DateTime? selectedDate;
  String? imagePath;

  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nueva nota"),
      ),
      body: Consumer<NotesProvider>(
        builder: (context, notesProvider, child) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                SizedBox(height: 24),
                imagePath != null ? Image.file(File(imagePath!)) : Container(),
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: "Titulo",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Descripcion",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24),
                DropdownButtonFormField<String>(
                  value: selectedColor,
                  hint: Text("Color"),
                  onChanged: (value) {
                    setState(() {
                      selectedColor = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      value: "Red",
                      child: Text("Red"),
                    ),
                    DropdownMenuItem(
                      value: "Blue",
                      child: Text("Blue"),
                    ),
                    DropdownMenuItem(
                      value: "Green",
                      child: Text("Green"),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                TextButton(
                  onPressed: _takePicture,
                  child: Text("Tomar foto"),
                ),
                MaterialButton(
                  child: Text("Guardar"),
                  onPressed: () async {
                    Map<String, dynamic> noteContent = {
                      "color": selectedColor,
                      "createdAt": Timestamp.fromDate(DateTime.now()),
                      "userId": FirebaseAuth.instance.currentUser!.uid,
                      "dueDate": selectedDate != null ? Timestamp.fromDate(selectedDate!) : null,
                      "data": {
                        "audios": [], // Aquí puedes manejar la grabación de audio
                        "images": [imagePath], // Aquí puedes manejar múltiples imágenes
                        "description": _descriptionController.text,
                        "title": _titleController.text,
                      }
                    };

                    notesProvider.createNewNote(noteContent).then((success) {
                      if (success) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("Guardado con éxito!!"),
                            ),
                          );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content: Text("No se pudo guardar!!"),
                            ),
                          );
                      }
                    });
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
