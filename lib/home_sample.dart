import 'dart:convert';
// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:rest_app/sample_model.dart';
import 'package:http/http.dart' as http;
import 'package:rest_app/sample_model.dart';
// import 'package:rest_app/sample_model.dart';

class home_sample extends StatefulWidget {
  const home_sample({super.key});

  @override
  State<home_sample> createState() => _home_sampleState();
}

class _home_sampleState extends State<home_sample> {
  List<MyModel> lisdt1 = [];
  Future<List<MyModel>> fetch() async {
    final resp = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(resp.body.toString());

    if (resp.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        lisdt1.add(MyModel.fromJson(i));
      }
      return lisdt1;
    } else {
      return lisdt1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<MyModel>> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: Text(
            "Loading",
            style: TextStyle(decoration: TextDecoration.none),
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (context, index) {
          return Text("${snapshot.data![index].title}",
          );
        },
        itemCount: lisdt1.length,
      );
    }));
  }
}
