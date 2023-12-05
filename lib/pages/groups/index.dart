// Shows all groups ie: School level, Class level, Stream level
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/modals/user_modal.dart';
import '../../services/database_service.dart';

class GroupIndex extends StatefulWidget {
  const GroupIndex({super.key, required this.user});

  final UserModal user;

  @override
  State<GroupIndex> createState() => _GroupIndexState();
}

class _GroupIndexState extends State<GroupIndex> {
  String load = 'loading';
  List userGroups = [];
  List groups = [];

  Future getGroups() async {
    var gs = await Database().getGroupsAndChats(widget.user);

    if (gs != null) {
      gs = gs.map((doc) => doc.data()).toList();
      for (var element in gs) {
        var data = await Database().getGroups(element['group_id']);
        print('peter');
        groups.add(data);
      }

      setState(() {
        userGroups = gs;
        groups = groups;
        load = 'done';
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGroups();
  }

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      print(groups);
      return Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          backgroundColor: Colors.purple[800],
          title: const Text('Groups'),
        ),
        body: Column(
          children: const <Widget>[
            Card(
              color: Colors.grey,
              elevation: 0.0,
              child: Text('loading'),
            )
          ],
        ),
      );
    } else {
      print(groups);
      return Scaffold(
          backgroundColor: Colors.purple[50],
          appBar: AppBar(
            backgroundColor: Colors.purple[800],
            title: const Text('SignUp Up'),
          ),
          body: Column(
            children: groups.map((e) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  clipBehavior: Clip.antiAlias,
                  child: Column(children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(e['discussion']),
                      subtitle: Text(
                        'Level ${e['level']}',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      onTap: () {},
                    ),
                  ]),
                ),
              );
            }).toList(),
          ));
    }
  }
}
