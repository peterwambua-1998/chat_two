import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/pages/discussions/school_level.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Levels'),
          backgroundColor: Colors.purple[700],
          bottom: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.purple[200],
              tabs: const [
                Tab(
                  text: 'School Level',
                ),
                Tab(
                  text: 'Class Level',
                ),
                Tab(
                  text: 'Stream Level',
                ),
                Tab(
                  text: 'One on One',
                ),
              ]),
        ),
        body: TabBarView(children: [
          MyTabViewContent(
            heading: 'School Level',
            description: 'Below are the discussions',
          ),
          Text('2'),
          Text('3'),
          Text('4'),
        ]),
      ),
    );
  }
}

class MyTabViewContent extends StatelessWidget {
  MyTabViewContent({
    super.key,
    required this.heading,
    required this.description,
  });

  String heading;
  String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text(
            heading,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            description,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Mycard(
            title: 'Discussion One',
            subTitle: 'Discussions under level one.',
            color: Colors.red,
            level: 'School level',
          ),
          Mycard(
            title: 'Discussion two',
            subTitle: 'Discussions under level two.',
            level: 'School level',

          ),
          Mycard(
            title: 'Discussion three',
            subTitle: 'Discussions under level three.',
            color: Colors.blue,
            level: 'School level',

          ),
        ],
      ),
    );
  }
}

class Mycard extends StatelessWidget {
  Mycard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.level,
    this.color = Colors.teal,
  });

  String title;
  String subTitle;
  Color? color;
  String level;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SchoolLevelChat(
                      level: level,
                    )));
      },
      child: Card(
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.wechat,
                    size: 30.0,
                    color: color,
                  ),
                  title: Text(
                    title,
                    style: TextStyle(color: color),
                  ),
                  subtitle: Text(subTitle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
