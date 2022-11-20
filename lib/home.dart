import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_app/d.dart';

import 'model/my_model.dart';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<x> k_list = [];
  Future<List<x>> fetch() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    var Data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in Data) {
        x x_l = x(id: i['id'], title: i['title'], url: i['url']);
        k_list.add(x_l);
      }
      return k_list;
    } else {
      return k_list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("REST-APP")),
      ),
      body: Container(
        color: Colors.white,
        child: Expanded(
            child: FutureBuilder(
                future: fetch(),
                builder: (context, AsyncSnapshot<List<x>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: Text("Loading....",
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)));
                  }
                  return ListView.builder(itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "${snapshot.data![index].url}")),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${snapshot.data![index].title}",
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
                })),
      ),
    );
  }
}
