import 'package:flutter/material.dart';

class UserFeedBack extends StatefulWidget {
  const UserFeedBack({super.key});

  @override
  State<UserFeedBack> createState() => _UserFeedBackState();
}

class _UserFeedBackState extends State<UserFeedBack> {
  String? emailAddress;
  String? comment;
  String rating = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(147, 51, 234, 1),
        elevation: 0.0,
        title: const Text(
          'FeedBack',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Give a feedback',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 30,),
            Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const Text(
                    'Give a feedback',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8,),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() => emailAddress = val);
                      },
                      decoration: const InputDecoration(
                          hintText: 'Email address',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  const Text(
                    'Rate your experience',
                    style: TextStyle(fontSize: 14),
                  ),

                  const Row(
                    children: [
                      Column(
                        children: [
                          Image(image: AssetImage('assets/verysad.png')),
                          Text(
                            'Very Sad',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Image(image: AssetImage('assets/bad.png')),
                          Text(
                            'Bad',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),


                      Column(
                        children: [
                          Image(image: AssetImage('assets/neutral.png')),
                          Text(
                            'Very Sad',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),


                      Column(
                        children: [
                          Image(image: AssetImage('assets/good.png')),
                          Text(
                            'Good',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),


                      Column(
                        children: [
                          Image(image: AssetImage('assets/verygood.png')),
                          Text(
                            'Very Good',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  )
                ]))
          ])),
    );
  }
}
