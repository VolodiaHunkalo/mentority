

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/mentors.dart';
import 'chat_and_booking.dart';
import 'mentor_image.dart';

class MainBody extends StatelessWidget {
  final Mentor mentor;
  const MainBody({Key? key,

    required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // all width and height
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget> [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
          ),
          child: Column(
            children: <Widget> [
              MentorPoster(size: size, image: mentor.image),
              Text(mentor.title, style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 10),
              Text(mentor.description),
              SizedBox(height: kDefaultPadding + 20)
            ],
          ),
        ),
        ChatAndBooking()
      ],
    );
  }
}