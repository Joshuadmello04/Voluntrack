import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart'; // Correct import for Firebase

// Firebase configuration
// const firebaseConfig = {
//   "apiKey": "AIzaSyAnFnIdsPGxhdKW1LnMOtfJGthyonBCNZ4",
//   "authDomain": "volunteerauth-3fb81.firebaseapp.com",
//   "projectId": "volunteerauth-3fb81",
//   "storageBucket": "volunteerauth-3fb81.appspot.com",
//   "messagingSenderId": "161312071916",
//   "appId": "1:161312071916:web:2cef47f0f0d72a3e4b05c9"
// };

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures binding before Firebase initialization
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAnFnIdsPGxhdKW1LnMOtfJGthyonBCNZ4",
        authDomain: "volunteerauth-3fb81.firebaseapp.com",
        projectId: "volunteerauth-3fb81",
        storageBucket: "volunteerauth-3fb81.appspot.com",
        messagingSenderId: "161312071916",
        appId: "1:161312071916:web:2cef47f0f0d72a3e4b05c9"),
  ); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Sign-Up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            '../assets/hands.jpg', // Corrected path to the image
            fit: BoxFit.cover,
          ),
          // Content overlay
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Colors.black
                .withOpacity(0.3), // Add a semi-transparent black overlay
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Alone we can do so little.\nTogether we can do so much.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: Colors.purpleAccent,
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text(
                    'Already a member? Log in',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
