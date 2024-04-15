import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  String? labelText,
  IconData? prefixIcon,
}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    filled: true,
    fillColor: Colors.grey[200],
    prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
    suffixIcon: IconButton(
      icon: Icon(Icons.clear),
      onPressed: () {
        // Lógica para limpiar el contenido del TextField
      },
    ),
  );
}
