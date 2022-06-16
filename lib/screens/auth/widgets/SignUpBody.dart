import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  decoration: InputDecoration(
                      labelText: 'Email Adress'
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password'
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Confirm Password'
                  ),
                ),
                SizedBox(height: 40),
                CupertinoButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text('Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
