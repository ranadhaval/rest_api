import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rest_app/model/model_2.dart';
import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  List<MyModel2> list1 = [];

  Future<List<MyModel2>> fetch() async {
    final resp =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(resp.body.toString());

    if (resp.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        list1.add(MyModel2.fromJson(i));
      }
      return list1;
    } else {
      return list1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Expanded(
          child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<MyModel2>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Text("Loading....",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)));
          }
          return ListView.builder(
              itemCount: list1.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                    child: Column(
                  children: [
                    fram(Adress: "${snapshot.data![index].id}", name: "id"),
                    fram(Adress: "${snapshot.data![index].name}", name: "name"),
                    fram(
                        Adress: "${snapshot.data![index].address.geo.lat}",
                        name: "adress"),
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
