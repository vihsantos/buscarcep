import 'package:flutter/material.dart';

AppBar appBar(String text) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(color: Colors.black),
      ),
    ),
  );
}
