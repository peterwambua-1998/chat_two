import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './pages/splash_screen.dart';
import './services/auth_service.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
   Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthService>(
      create: (context) => AuthService().myUser(),
      // value: AuthService().myUser, 
      // create: (context) => AuthService().myUser(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        home: SplashScreen(),
      ), 
      
    );
  }
}
