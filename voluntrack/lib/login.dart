import 'package:flutter/material.dart';
import 'landingpage.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  // Mock function to handle login (for demonstration purposes)
  void _login(BuildContext context) {
    String inputEmail = _emailController.text.trim();
    String inputPassword = _passwordController.text.trim();

    // For demonstration, you can use hardcoded credentials
    if (inputEmail == "test@example.com" && inputPassword == "password") {
      // Navigate to LandingPage if credentials are correct
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    } else {
      setState(() {
        _errorMessage = 'Invalid email or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              _header(),
              const SizedBox(height: 30),
              _inputField(
                  "Email", Icons.email_outlined, false, _emailController),
              const SizedBox(height: 20),
              _inputField(
                  "Password", Icons.lock_outline, true, _passwordController),
              const SizedBox(height: 10),
              _errorMessage.isNotEmpty
                  ? Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox.shrink(),
              const SizedBox(height: 30),
              _loginButton(context),
              const SizedBox(height: 20),
              _googleLoginButton(context),
              const SizedBox(height: 20),
              _signupLink(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      children: [
        Text(
          "Welcome Back!",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        SizedBox(height: 10),
        Text(
          "Login using your credentials",
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _inputField(String hintText, IconData icon, bool isObscure,
      TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          fillColor: Colors.purple.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icon, color: Colors.purple),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        ),
        obscureText: isObscure,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _login(context); // Call mock login function
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        backgroundColor: Colors.purple,
      ),
      child: const Text(
        "Sign in",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _googleLoginButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // Handle Google sign-in logic here
      },
      icon: const Icon(Icons.login, color: Colors.purple),
      label: const Text("Sign in with Google"),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        side: const BorderSide(color: Colors.purple),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        textStyle: const TextStyle(fontSize: 18, color: Colors.purple),
      ),
    );
  }

  Widget _signupLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpPage()),
            );
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ],
    );
  }
}
