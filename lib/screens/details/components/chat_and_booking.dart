

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ChatAndBooking extends StatelessWidget {
  const ChatAndBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Color(0xFFFCBF1E),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget> [
          FlatButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/chat.svg', height: 18,),
              label: Text('Chat', style: TextStyle(color: Colors.white),
              )),
          Spacer(),
          FlatButton.icon(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/shopping-bag.svg', height: 18,),
              label: Text('Book a meeting', style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}