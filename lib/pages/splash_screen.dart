import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/pages/sign_in.dart';
import 'package:flutter_firebase_chat/pages/wrapper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String assetName = 'assets/login.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    assetName,
                    semanticsLabel: 'Acme Logo',
                    width: 200.0,
                    height: 200.0,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),

                const Text(
                  'School Chat App',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                ),

                
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                    'Lorem ipsum dolor sit amet consectetur. amet consectetur',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(30, 30, 30, 1),
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2.0,
                      letterSpacing: 0.7
                    ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Wrapper()));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.purple[300],
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
