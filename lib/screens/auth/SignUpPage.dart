import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentority/models/user.dart';
import 'package:mentority/screens/auth/widgets/SignUpBottomNavyBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void checkValues () {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if(email == '' || password == '' || cPassword == ''){
      print('Please, fill all the fields!');
    }
    else if(password != cPassword){
      print('Passwords do not match');
    }
    else {
      signUp(email, password);
    }
  }

  void signUp(String email, String password) async {
    UserCredential? credential;

    try{
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);

    } on FirebaseAuthException catch(ex) {
      print(ex.code.toString());
    }
    if(credential != 0) {
      String uid = credential!.user!.uid;
      UserModel newUser = UserModel(
        uid: uid,
        email: email,
        fullname: '',
        profilepic: '',
      );
      await FirebaseFirestore.instance.collection('users').doc(uid)
          .set(newUser.toMap()).then((value) {
            print('New User Created!');
      });
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
                 SizedBox(height: 20),
                 TextField(
                   controller: cPasswordController,
                   obscureText: true,
                   decoration: InputDecoration(
                       labelText: 'Confirm Password'
                   ),
                 ),
                 SizedBox(height: 40),
                 CupertinoButton(
                   onPressed: () {
                     checkValues();
                   },
                   color: Colors.blue,
                   child: Text('Sign Up'),
                 )
               ],
             ),
           ),
         ),
       ),
     ),
      bottomNavigationBar: SignUpBottomNavyBar(),
    );
  }
}
