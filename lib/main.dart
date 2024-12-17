import 'package:chatbot/pages/home_page.dart';
import 'package:chatbot/pages/profile.dart';
import 'package:chatbot/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'pages/sign_in.dart';



void main() {
  runApp(NdengeraApp());
}

class NdengeraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        '/sign_in': (context) => SignInScreen(),
        '/sign_up': (context) => SignUpScreen(),
        '/home_page':(context) => HomePage(),
        '/Profile': (context) => Profile(),
      },
    );
  }

}

class WelcomeScreen  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA7C7A9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Image.asset(
                  'assets/logo.png',
                  height: 100,
                  width: 200,
                ),
                Text('NDENGERA',style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/sign_in');
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD5BA99),
                      minimumSize: Size(200, 50),
                    ) ,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                ),
                SizedBox(height: 15),
                Text(
                  'or',
                  style: TextStyle(fontSize: 16,color:Colors.black),
                ),
                SizedBox(height: 15),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/sign_up');
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: Size(200, 50),
                  ) ,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 190),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '(C) Mpuza Inc',
                style: TextStyle(fontSize: 14,color:Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

