import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_app/HOMEF.dart';
import 'package:rest_app/home.dart';
import 'package:rest_app/home2.dart';
import 'package:rest_app/home_sample.dart';
import 'package:rest_app/model/my_model.dart';
import 'package:rest_app/no_model.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home_sample(),
    );
  }
}
