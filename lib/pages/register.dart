import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/pages/sign_in.dart';
import 'package:flutter_firebase_chat/services/auth_service.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  // _formkey will be used to identify our form
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(children: <Widget>[
          const Text(
            'Welcome on board',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create a free account or ',
                style: TextStyle(fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.purple[400],
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid
                    )
                  )
              )
            ],
          ),
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Name';
                      } else {
                        // if its not empty return null
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Email';
                      } else {
                        // if its not empty return null
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 6) {
                        return 'Enter a password 6+ long';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 6) {
                        return 'Enter a password 6+ long';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.length < 6) {
                        return 'Enter a password 6+ long';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var result = await context
                              .read<AuthService>()
                              .signInWithEmail(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'Wrong credentials';
                            });
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.purple[400],
                        //maximumSize: const Size(10.0, 10.0)
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0))
                ],
              ))
        ]),
      ),
    );
  }
}
