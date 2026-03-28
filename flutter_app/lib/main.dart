import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolAttendanceApp());
}

class SchoolAttendanceApp extends StatelessWidget {
  const SchoolAttendanceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Attendance Management',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Teacher';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal[400]!, Colors.teal[700]!] ,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // School Logo
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Title
                  const Text(
                    'School Attendance\nManagement',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Role Selection
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      value: _selectedRole,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ['Teacher', 'Parent', 'Admin']
                          .map((role) => DropdownMenuItem(
                                value: role,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(role),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Email Input
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password Input
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Login Button
                  ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Sign Up Link
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign up page')),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Social Login
                  const Text(
                    'Or login with',
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(Icons.facebook, Colors.blue),
                      const SizedBox(width: 16),
                      _socialButton(Icons.camera_alt, Colors.pink),
                      const SizedBox(width: 16),
                      _socialButton(Icons.link, Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

  Widget _socialButton(IconData icon, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  void _handleLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in as $_selectedRole')),
    );
    _navigateToDashboard();
  }

  void _navigateToDashboard() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Navigation to dashboard')),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}