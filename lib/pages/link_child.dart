import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class LinkChild extends StatefulWidget {
  const LinkChild({super.key});

  @override
  State<LinkChild> createState() => _LinkChildState();
}

class _LinkChildState extends State<LinkChild> {
  int numOfChildren = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        elevation: 0.0,
        title: const Text('Link Child'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        children: <Widget>[
          const Text(
            'Current Links',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),

          const Text(
            'Link 1: Child One',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          const Text(
            'Link 2: Child One',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
         
          Divider(
            height: 50,
            thickness: 1,
            color: Colors.purple[100],
          ),

          const Text(
            'Save then add more links',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10,),
          const Text(
            'Child name (not displayed in group)',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                setState(() => numOfChildren = int.parse(val));
              },
              decoration: const InputDecoration(
                  hintText: 'Child name',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'School',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                setState(() => numOfChildren = int.parse(val));
              },
              decoration: const InputDecoration(
                  hintText: 'School',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Class',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                setState(() => numOfChildren = int.parse(val));
              },
              decoration: const InputDecoration(
                  hintText: 'Class',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Stream',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 50,
            child: TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                setState(() => numOfChildren = int.parse(val));
              },
              decoration: const InputDecoration(
                  hintText: 'Stream',
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: TextButton(
                onPressed: () async {
                  // if (_formKey.currentState!.validate()) {
                  //   var result = await context
                  //       .read<AuthService>()
                  //       .signInWithEmail(email, password);
                  //   if (result == null) {
                  //     setState(() {
                  //       error = 'Wrong credentials';
                  //     });
                  //   }
                  // }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple[400],
                ),
                child: const Text(
                  'Save Link',
                  style: TextStyle(color: Colors.white),
                )),
          ),

          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class Links extends StatelessWidget {
  const Links({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 50,
      thickness: 1,
      color: Colors.purple[100],
    );
  }
}
