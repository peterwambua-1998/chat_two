import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/profile_listener.dart';
import '../services/database_service.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.id});

  final dynamic id;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text('Ninja ID Card'),
        backgroundColor: Colors.purple[800],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ChatBubble(id: widget.id),
      // body: Padding(
      //   padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
      //   child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         const Center(
      //           child: CircleAvatar(
      //             backgroundImage: AssetImage('assets/elephant.jpg'),
      //             radius: 40.0,
      //           ),
      //         ),
      //         Divider(
      //           height: 90.0,
      //           color: Colors.grey[800],
      //         ),
      //         Text(
      //           'NAME',
      //           style: TextStyle(color: Colors.grey[800], letterSpacing: 2.0),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           'Peter Wambua',
      //           style: TextStyle(
      //               color: Colors.indigo[900],
      //               letterSpacing: 2.0,
      //               fontSize: 24.0,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           'CURRENT NINJA ID',
      //           style: TextStyle(color: Colors.grey[800], letterSpacing: 2.0),
      //         ),
      //         const SizedBox(height: 10),
      //         Text(
      //           widget.id,
      //           style: TextStyle(
      //               color: Colors.indigo[900],
      //               letterSpacing: 2.0,
      //               fontSize: 28.0,
      //               fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(height: 30),
      //         Row(
      //           children: [
      //             Icon(
      //               Icons.email,
      //               color: Colors.purple[400],
      //             ),
      //             const SizedBox(width: 10.0),
      //             Text(
      //               'pwambua25@gmail.com',
      //               style: TextStyle(
      //                   color: Colors.grey[800],
      //                   fontSize: 16.0,
      //                   letterSpacing: 1.0),
      //             )
      //           ],
      //         )
      //       ]),
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple[400],
          child: const Icon(Icons.add)),
    );
  }
}
