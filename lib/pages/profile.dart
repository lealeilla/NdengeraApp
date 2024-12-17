import 'package:flutter/material.dart';

import 'home_page.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA7C7A9), // Light green background
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo and Profile Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png', // Replace with your logo path
                    width: 150,
                    height: 80,
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.person, size: 60, color: Colors.black),
                ],
              ),
              const SizedBox(height: 10),

              // Account Profile Title
              _buildTitle('Account Profile'),
              const SizedBox(height: 10),

              // Form Fields Container
              Container(
                width: 300,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Telephone and Names Input Fields
                    _buildInputField('Telephone Number'),
                    const SizedBox(height: 10),
                    _buildInputField('Names'),
                    const SizedBox(height: 20),

                    // Change Password Title (Center-Aligned)
                    const Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),

                    // Password Fields (Center-Aligned)
                    _buildInputField('Password', isPassword: true),
                    const SizedBox(height: 10),
                    _buildInputField('Re-type Password', isPassword: true),
                    const SizedBox(height: 20),

                    // Save Changes Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text(
                          'Save Changes',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                                (Route<dynamic> route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD5BA99), // Brown button
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text(
                          'Home',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Footer
              const Text(
                '(C) Mpuza Inc',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for Input Fields
  Widget _buildInputField(String hintText, {bool isPassword = false}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[300],
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Helper method for titles
  Widget _buildTitle(String title, {double fontSize = 20}) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFD7C196), // Beige background
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
