import 'package:flutter/material.dart';
//import 'chatbot_screen.dart';
import 'chatbot_screen2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        backgroundColor: const Color(0xFFBEEFC3), // Light green
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu),
            Image.asset(
              'assets/logo.png', // Replace with your logo
              height: 50,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle, size: 28, color: Colors.black),
                  onPressed: () {
                    Navigator.pushNamed(context,'/Profile');
                  },
                ),
                const Text(
                  'Vicky',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    body: Container(
    color: const Color(0xFFA7C7A9), // Light green background color
    child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center( // Center horizontally
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            const Center(
              child: Text(
                'Chat With:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8, // Adjust width (80% of screen width)
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10), // Adjust internal padding
                  children: [
                    _buildChatCard(
                      context,
                      'Muhoza',
                      'Child Protection',
                      'assets/muhoza.png',
                      "Hello, Vicky! I'm Muhoza, your friend here to help you learn about your rights as a child. You can talk to me anytime!",
                    ),
                    _buildChatCard(
                      context,
                      'Mukunzi',
                      'Family Support',
                      'assets/mukunzi.png',
                      "Hello, Vicky! I'm Mukunzi, a chatbot specialized in family support. I'm here to listen and help with anything that's on your mind. What would you like to talk about today?",
                    ),
                    _buildChatCard(
                      context,
                      'Nshuti',
                      'Gender Equality',
                      'assets/nshuti.png',
                      "Hi, Vicky! I'm Nshuti, here to discuss gender equality topics and empower you to understand this better. Let's get started!",
                    ),
                    _buildChatCard(
                      context,
                      'Mukiza',
                      'General Guider',
                      'assets/mukiza.png',
                      "Hello, Vicky! I'm Mukiza, your general guide for all kinds of questions. Feel free to ask me anything!",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // Limit the width to 80% of the screen
            decoration: BoxDecoration(
              color:Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height to fit content
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 4,),
                const Text(
                  'Recent Chats',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                ListTile(
                  title: const Text('I need to know Child rights?'),
                  trailing: _buildTrailingBadge('Muhoza'),
                  leading: const Icon(Icons.message, color: Colors.green),
                ),
                ListTile(
                  leading: const Icon(Icons.message, color: Colors.green),
                  title: const Text('What is GBV?'),
                  trailing: _buildTrailingBadge('Nshuti'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,'/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                '(c) Mpuza Inc',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
       ),
      ),
    );
  }

  Widget _buildChatCard(BuildContext context, String name, String role,
      String imagePath, String message) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatBot(
                  name: name,
                  role: role,
                  message: message,
                  imagePath: imagePath,
                ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        color: Color(0xFFF1E3D1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 50, // Set height for image size
                width: 50,  // Set width for image size
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                role,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTrailingBadge(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.green.shade300,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 12,
        color: Colors.white,
      ),
    ),
  );
}