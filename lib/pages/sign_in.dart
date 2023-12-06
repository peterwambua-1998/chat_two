import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/services/auth_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

//pamela@gmail.com
class SignIn extends StatefulWidget {
  const SignIn({super.key, required this.toggleView});

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService? user = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  // svg
  final String assetName = 'assets/login.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: SvgPicture.asset(
                  assetName,
                  semanticsLabel: 'Acme Logo',
                  width: 200.0,
                  height: 150.0,
                ),
              ),
              const SizedBox(height: 30),
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
                    style: TextStyle(fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () {
                        widget.toggleView();
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.purple[400],
                          fontSize: 20.0,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.solid
                        )
                      )
                  )
                ],
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30.0),
                      Padding(
                        padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
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
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        validator: (val) => val!.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          )
                        ),
                      ),
                      SizedBox(height: 30.0),
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
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          )
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // Text(error,
              //     style: const TextStyle(color: Colors.red, fontSize: 14.0))
            ],
          ),
        ),
      ),
    );
  }
}
