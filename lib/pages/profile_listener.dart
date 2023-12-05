import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/database_service.dart';
// [START listen_to_realtime_updates_listen_for_updates2]
class ChatBubble extends StatefulWidget {
  const ChatBubble({super.key, required this.id});

  final dynamic id;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('user_profile')
        .snapshots();
  @override

  Widget build(BuildContext context) {
    


    return StreamBuilder(
        stream: _usersStream,
        builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {

            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {

            return const Text("Loading");
          }

          print('profile change == ${snapshot.data}');

          return Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/elephant.jpg'),
                      radius: 40.0,
                    ),
                  ),
                  Divider(
                    height: 90.0,
                    color: Colors.grey[800],
                  ),
                  Text(
                    'NAME',
                    style:
                        TextStyle(color: Colors.grey[800], letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peter Wambua',
                    style: TextStyle(
                        color: Colors.indigo[900],
                        letterSpacing: 2.0,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'CURRENT NINJA ID',
                    style:
                        TextStyle(color: Colors.grey[800], letterSpacing: 2.0),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.id,
                    style: TextStyle(
                        color: Colors.indigo[900],
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.purple[400],
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        'pwambua25@gmail.com',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16.0,
                            letterSpacing: 1.0),
                      )
                    ],
                  ),
                  TextButton(onPressed: () async {
                      await Database().updateProfile(widget.id);

                  }, child: Text('update profile'))
                ]),
          );
        });
  }
}
