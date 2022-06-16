import 'package:flutter/cupertino.dart';

class LoginBottomNavyBar extends StatelessWidget {
  const LoginBottomNavyBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Do not have an account?', style: TextStyle(fontSize: 16)),
            CupertinoButton(
              onPressed: () {},
              child: Text('Sign Up', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
