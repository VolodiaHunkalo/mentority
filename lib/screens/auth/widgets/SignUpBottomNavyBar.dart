import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentority/screens/auth/LoginPage.dart';

class SignUpBottomNavyBar extends StatelessWidget {
  const SignUpBottomNavyBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Already have an account?', style: TextStyle(fontSize: 16)),
            CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                LoginPage()));
              },
              child: Text('Log in', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
