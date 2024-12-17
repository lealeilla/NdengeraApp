import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA7C7A9), // Background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/logo.png', // Ensure the path is correct
                width: 150,
                height: 60,
              ),
              const SizedBox(height: 20),

              // "Sign In To Continue" Text
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFD7C196), // Beige background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Sign In To Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Form Container with fixed size
              SizedBox(
                width: 300,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Telephone Number',
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Input
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Colors.grey[300],
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Forgot Password Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Add Forgot Password screen navigation here
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context,'/home_page');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD5BA99),
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      // Sign Up Button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to SignUpScreen
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(150, 40),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),

              // Footer
              const Text(
                '(C) Mpuza Inc',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
