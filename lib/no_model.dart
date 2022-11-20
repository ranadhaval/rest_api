import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_app/model/model_2.dart';
import 'package:http/http.dart' as http;

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  State<Home3> createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  var data;

  Future<void> fetch() async {
    final resp =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (resp.statusCode == 200) {
      data = jsonDecode(resp.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Expanded(
          child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Text("Loading....",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)));
          }
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 2,
                    child: Column(
                      children: [
                        fram(Adress: "${data[index]['name']}", name: "name"),
                        fram(
                            Adress: "${data[index]['address']['city']}",
                            name: "Adress"),
                      ],
                    ));
              });
        },
        future: fetch(),
      )),
    );
  }
}

class fram extends StatelessWidget {
  String name, Adress;
  fram({super.key, required this.Adress, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$name"),
          Text("${Adress}"),
        ],
      ),
    );
  }
}
