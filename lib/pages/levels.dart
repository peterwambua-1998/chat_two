import 'package:flutter/material.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Levels'),
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Levels',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(55, 65, 81, 1),
                  fontSize: 18.0),
            ),
            const Text(
              'Click tabs below to view discussions on each level',
              style: TextStyle(
                fontSize: 12.0,
                color: Color.fromRGBO(107, 114, 128, 1),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Groups'),
                subtitle: const Text('view groups'),
                contentPadding: const EdgeInsets.all(15.0),
                leading: const Icon(
                  Icons.wechat,
                  size: 50.0,
                  color: Color.fromARGB(255, 99, 141, 102),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Colors.green),
                  borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                ),
                tileColor: const Color.fromARGB(255, 204, 215, 200),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Levels()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Groups'),
                subtitle: const Text('view groups'),
                contentPadding: const EdgeInsets.all(15.0),
                leading: const Icon(
                  Icons.wechat,
                  size: 50.0,
                  color: Color.fromARGB(255, 234, 178, 8),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color.fromARGB(255, 234, 178, 8)),
                  borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                ),
                tileColor: Color.fromARGB(73, 234, 178, 8),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Levels()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Groups'),
                subtitle: const Text('view groups'),
                contentPadding: const EdgeInsets.all(15.0),
                leading: const Icon(
                  Icons.wechat,
                  size: 50.0,
                  color: Color.fromARGB(255, 8, 61, 234),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color.fromARGB(255, 8, 61, 234)),
                  borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                ),
                tileColor: Color.fromARGB(68, 8, 61, 234),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Levels()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 80,
              child: ListTile(
                visualDensity: const VisualDensity(vertical: -4),
                title: const Text('Groups'),
                subtitle: const Text('view groups'),
                contentPadding: const EdgeInsets.all(15.0),
                leading: const Icon(
                  Icons.wechat,
                  size: 50.0,
                  color: Color.fromARGB(255, 234, 8, 8),
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color.fromARGB(255, 234, 8, 8)),
                  borderRadius: BorderRadius.circular(10), //<-- SEE HERE
                ),
                tileColor: Color.fromARGB(72, 234, 8, 8),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Levels()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
