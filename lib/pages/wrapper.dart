import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/modals/user_modal.dart';
import 'package:flutter_firebase_chat/pages/home.dart';
import 'package:flutter_firebase_chat/pages/register.dart';
import 'package:flutter_firebase_chat/services/auth_service.dart';
import './sign_in.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showSignIn = true;

  void toggleView () {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<AuthService?>(context)!.userProp;
    UserModal? user = context.watch<AuthService>().myUserProp;

    if (user == null) {
      if (showSignIn) {
        return SignIn(toggleView: toggleView);
      } else {
        return Register(toggleView: toggleView);
      }
    } else {
      return Home(user: user);
    }
  }
}
