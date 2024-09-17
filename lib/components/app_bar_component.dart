import 'package:flutter/material.dart';

AppBar appBar({bool leading = true, String title = '', List<Widget>? actions}){
  return AppBar(
    leading: leading ? const Icon(Icons.task) : null,
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 108, 76, 122),
    title: Text(title),
    actions: actions,
  );
}