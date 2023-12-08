// when logged in user clicks another users this page will be shown
import 'package:flutter/material.dart';

class OtherUserProfile extends StatefulWidget {
  const OtherUserProfile({super.key});

  @override
  State<OtherUserProfile> createState() => _OtherUserProfileState();
}

class _OtherUserProfileState extends State<OtherUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        elevation: 0.0,
        title: Text('User Profile'),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 80),
            child: const TopCover()
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Peter Wambua',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
                ),
              ),
              Text(
                '@pwambuch',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),

              Text(
                'Moderator',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
              
            ]
          ),

          const SizedBox(height: 20,),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Badges',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          const SizedBox(height: 8,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: const  Column(
                        children: [
                           Image(image: AssetImage('assets/elephant.jpg'), width: 80, height: 80,)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                      child:  Text('Top Contributor', textAlign: TextAlign.center,),
                    )
                  ]
                ),
                const SizedBox(width: 40,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: const Column(
                        children: [
                          Image(image: AssetImage('assets/elephant.jpg'), width: 80, height: 80,)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 80,
                      child: Text('Top Contributor', textAlign: TextAlign.center,),
                    )
                  ]
                ),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
          //   child: 
          // ),
          const SizedBox(height: 20,),
        Padding(
            padding:const EdgeInsets.fromLTRB(30, 10, 30, 0),
            child: Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Phone',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            '+254715100539',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
            ),
          ), 
           
          
          // Padding(
          //   padding:const EdgeInsets.fromLTRB(30, 10, 30, 0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         child: Container(
          //           height: 100,
          //           color: Colors.white,
          //           child: const Column(
          //             children: [
          //               Text('Phone')
          //             ],
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 48),
          //   child: const Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text('about'),
          //       Text('my name is peter wambua i love to program computers and eat food'),
          //     ],
          //   ),
          // )
        ]
      ),
    );
  }
}

class TopCover extends StatelessWidget {
  const TopCover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.purple[800],
          height: 120,
        ),
        Positioned(
          top: 120 - 80,
          child: CircleAvatar(
            radius: 150 / 2,
            backgroundColor: Colors.grey[800],
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        )
      ],
    );
  }
}