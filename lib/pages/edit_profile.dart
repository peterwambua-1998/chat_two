import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String userName = '';
  String fullName = '';
  String phoneNumber = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(147, 51, 234, 1),
        elevation: 0.0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Center(
                child: Stack(alignment: Alignment.bottomRight, children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                      'assets/profile.jpg'), // Replace with your image asset
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.purple[600], shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {
                      // Handle edit button press
                      // This is where you can add functionality to open an image picker or navigate to an edit screen, etc.
                    },
                  ),
                ),
              ),
            ])),
            const SizedBox(height: 20),
            const Divider(
              thickness: 2,
              color: Color.fromRGBO(203, 213, 225, 1),
            ),
            const SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Enter username' : null,
                        onChanged: (val) {
                          setState(() => userName = val);
                        },
                        decoration: const InputDecoration(
                            hintText: 'Username',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        validator: (val) => val!.isEmpty ? 'Enter Name' : null,
                        onChanged: (val) {
                          setState(() => userName = val);
                        },
                        decoration: const InputDecoration(
                            hintText: 'Full name',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Enter email address' : null,
                        onChanged: (val) {
                          setState(() => email = val);
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
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'Enter phone number' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            hintText: 'Phone number',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // var result = await context
                              //     .read<AuthService>()
                              //     .signInWithEmail(email, password);
                              // if (result == null) {
                              //   setState(() {
                              //     error = 'Wrong credentials';
                              //   });
                              // }
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.purple[400],
                            //maximumSize: const Size(10.0, 10.0)
                          ),
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
