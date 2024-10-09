import 'package:flutter/material.dart';
import 'carepage.dart'; // Import the CausesPage

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Full Name
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Full Name',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Mobile Number
            TextField(
              controller: _mobileNumberController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Mobile Number',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Date of Birth
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                labelText: 'Date Of Birth',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Password
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Confirm Password
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.pinkAccent.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to CausesPage on Sign Up
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CausesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: Colors.purpleAccent,
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // OR Divider
            const Center(child: Text('Or')),
            const SizedBox(height: 10),
            // Google Sign In Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Handle Google Sign In
                },
                icon: const Icon(Icons.login, color: Colors.purpleAccent),
                label: const Text(
                  'Sign In with Google',
                  style: TextStyle(color: Colors.purpleAccent),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.purpleAccent),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Login Link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    // Navigate to Login Page
                    Navigator.pop(context);
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
