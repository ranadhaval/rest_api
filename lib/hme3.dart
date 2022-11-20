// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:rest_app/model/own_model.dart';
// import 'package:http/http.dart' as http;

// class home3 extends StatefulWidget {
//   const home3({super.key});

//   @override
//   State<home3> createState() => _home3State();
// }

// class _home3State extends State<home3> {
//   Future<MyModel4> fetch() async {
//     final res = await http.get(Uri.parse(""));
//     var data1 = jsonDecode(res.body.toString());
//     if (res.statusCode == 200) {
//       return MyModel4.fromJson(data1);
//     } else {
//       return MyModel4.fromJson(data1);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text("REST-APP")),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Expanded(
//             child: FutureBuilder<MyModel4>(
//                 future: fetch(),
//                 builder: (context, snapshot) {
//                   return ListView.builder(
//                       // itemCount: snapshot.data!.name.length,
//                       itemBuilder: (context, index) {
//                     return Column(
//                       children: [
//                         Text(
//                           "$index",
//                           style: TextStyle(
//                               decoration: TextDecoration.none,
//                               color: Colors.black,
//                               fontSize: 20),
//                         )
//                       ],
//                     );
//                   });
//                 })),
//       ),
//     );
//   }
// }
