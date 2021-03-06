import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentority/screens/auth/widgets/LoginBottomNavyBar.dart';
import 'package:mentority/screens/mentors/mentors_screen.dart';

import '../../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkValues () {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email == '' || password == '') {
      print('Please, fill all the fields!');
    }
    else {
      logIn(email, password);
    }
  }

  void logIn(String email, String password) async{
    UserCredential? credential;

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch(ex) {
      print(ex.message.toString());
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users').doc(uid).get();

      UserModel userModel = UserModel
          .fromMap(userData.data() as Map<String, dynamic>);

      print('LogIn Successful!');

      Navigator.push(context, MaterialPageRoute(builder: (context) =>
      MentorsScreen(firebaseUser: credential.user!)
      ));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('Mentority', style:
                  TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 50),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email Adress'
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                  ),
                  SizedBox(height: 40),
                  CupertinoButton(
                    onPressed: () {
                      checkValues();
                    },
                    color: Colors.blue,
                    child: Text('Log in'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: LoginBottomNavyBar(),
    );
  }
}



