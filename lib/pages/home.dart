import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/modals/user_modal.dart';
import 'package:flutter_firebase_chat/pages/groups/index.dart';
import 'package:flutter_firebase_chat/pages/profile.dart';
import 'package:flutter_firebase_chat/services/auth_service.dart';
import '../services/database_service.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.user});

  final UserModal user;

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBars(),
      ),
      body: Column(children: <Widget>[
        // Card(
        //   color: Colors.brown[200],
        //   child: Row(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.fromLTRB(20, 35, 20, 35),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: const [
        //             Text(
        //               'Your Bookings',
        //               style: TextStyle(fontSize: 20),
        //             ),
        //             SizedBox(height: 10),
        //             Text(
        //               'Your Bookings',
        //               style: TextStyle(fontSize: 16),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Expanded(
        //         child: Column(
        //           children: const [
        //             Icon(
        //               Icons.calendar_month,
        //               color: Colors.white,
        //               size: 60.0,
        //               shadows: <Shadow>[
        //                 Shadow(
        //                     color: Color.fromARGB(134, 61, 61, 61),
        //                     blurRadius: 10.0,
        //                     offset: Offset(3, 3))
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: const Text('Groups'),
            subtitle: const Text('view groups'),
            contentPadding: const EdgeInsets.all(15.0),
            leading: const Icon(
              Icons.wechat,
              size: 50.0,
              color: Color.fromARGB(255, 99, 141, 102),
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.green),
              borderRadius: BorderRadius.circular(10), //<-- SEE HERE
            ),
            tileColor: const Color.fromARGB(255, 204, 215, 200),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupIndex(user: widget.user)));
            },
          ),
        ),

        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: const Text('Profile'),
            subtitle: const Text('Update profile'),
            contentPadding: const EdgeInsets.all(15.0),
            leading: Icon(
              Icons.person_2_rounded,
              size: 50.0,
              color: Colors.brown[400],
            ),
            tileColor: Colors.brown[100],
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.brown),
              borderRadius: BorderRadius.circular(10), //<-- SEE HERE
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(id: widget.user!.id)));
              // Navigator.pushNamed(context, '/profile', arguments: {
              //   'id' : data['id'],
              //   'name' : data['name'],
              //   'email' : data['email'],
              // });
            },
          ),
        )
      ]),
    );
  }
}

class AppBars extends StatelessWidget {
  const AppBars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple[800],
      elevation: 0.0,
      leading: const Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/user.jpg'),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () async {
              await context.read<AuthService>().signOut();
            },
            child: const Text('logout'))
      ],
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Welcome back',
                style: TextStyle(color: Colors.grey[300], fontSize: 14.0)),
            const SizedBox(height: 5),
            const Text('Peter Wambua',
                style: TextStyle(color: Colors.black, fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
