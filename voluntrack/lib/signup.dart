import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'causespage.dart'; // Import your next screen

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emergencyContactNumberController =
      TextEditingController();
  final TextEditingController _emergencyContactRelationController =
      TextEditingController();
  final TextEditingController _skillsController =
      TextEditingController(); // Comma-separated skills
  final TextEditingController _passwordController = TextEditingController();

  DateTime? selectedDate;

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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                fillColor: const Color.fromARGB(255, 220, 114, 246),
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
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Contact Number
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Contact Number',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Date of Birth
            TextField(
              controller: _dobController,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                labelText: 'Date Of Birth',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onTap: () => _selectDate(context), // Call date picker
            ),
            const SizedBox(height: 10),
            // Address
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.home),
                labelText: 'Address',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Emergency Contact Number
            TextField(
              controller: _emergencyContactNumberController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText: 'Emergency Contact Number',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Emergency Contact Relation
            TextField(
              controller: _emergencyContactRelationController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.group),
                labelText: 'Emergency Contact Relation',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Skills
            TextField(
              controller: _skillsController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.star),
                labelText: 'Skills (comma-separated)',
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 114, 246),
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
                fillColor: const Color.fromARGB(255, 220, 114, 246),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _signUp(); // Call sign-up function
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 220, 114, 246),
                ),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 18, color: Colors.black),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _signUp() async {
    // Input validation
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _contactController.text.isEmpty ||
        _dobController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _emergencyContactNumberController.text.isEmpty ||
        _emergencyContactRelationController.text.isEmpty ||
        _skillsController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields.")),
      );
      return; // Exit the method if validation fails
    }

    try {
      // Add user data to Firestore
      await FirebaseFirestore.instance.collection('Volunteer').add({
        'fullName': _fullNameController.text,
        'email': _emailController.text,
        'contact': _contactController.text,
        'dateOfBirth': _dobController.text,
        'address': _addressController.text,
        'emergencyContactNumber': _emergencyContactNumberController.text,
        'emergencyContactRelation': _emergencyContactRelationController.text,
        'skills': _skillsController.text
            .split(',')
            .map((skill) => skill.trim())
            .toList(),
        'password': _passwordController
            .text, // Ensure to encrypt the password in a real application
      });

      // Navigate to the next page on successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CausesPage()), // Replace with your next screen
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error signing up: $e")),
      );
    }
  }
}
