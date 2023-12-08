import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/pages/other_user_profile.dart';

class GroupInformation extends StatefulWidget {
  GroupInformation({super.key, required this.groupName});

  String groupName;

  @override
  State<GroupInformation> createState() => _GroupInformationState();
}

class _GroupInformationState extends State<GroupInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[700],
        title: Text(widget.groupName),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Text(
              'Topic:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Discussion Topic',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Discussion Topic description',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            Divider(
              height: 50,
              color: Colors.purple,
              thickness: 1,
            ),
            Text(
              'Members',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                UserInformation(),
                UserInformation(),
                UserInformation(),
                UserInformation(),
                UserInformation(),
                UserInformation(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                OtherUserProfile()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundImage: const AssetImage('assets/profile.jpg'),
              radius: 48,
            ),
          ),
          Card(
            elevation: 0.0,
            color: Colors.purple[50],
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12, top: 10),
                  child: Text(
                    'Peter Wambua',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 12, top: 2, bottom: 12, right: 12),
                  child: Text('Moderator'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
