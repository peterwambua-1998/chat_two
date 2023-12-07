import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/pages/edit_profile.dart';
import 'package:flutter_firebase_chat/pages/feedback.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(147, 51, 234, 1),
        elevation: 0.0,
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage('assets/profile.jpg'),
                      radius: 48,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Peter Wambua',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'pwambua25@gmail.com',
                    ),
                    TextButton(
                        onPressed: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditProfile()));
                        },
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            visualDensity: VisualDensity(vertical: -4)),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.purple,
                              decoration: TextDecoration.underline),
                        ))
                  ],
                ),
              ],
            ),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(203, 213, 225, 1),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.purple[800],
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Events:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Calender',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.link,
                    color: Colors.purple[800],
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Link:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'Child Class',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserFeedBack()
                  )
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.report,
                    color: Colors.purple[800],
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Feedback:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'For Improvement',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    color: Colors.purple[800],
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Share:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'with others',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Divider(
              thickness: 2,
              color: Color.fromRGBO(203, 213, 225, 1),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.purple[800],
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.purple[800],
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'User Manual',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: Colors.purple[900],
                  size: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
