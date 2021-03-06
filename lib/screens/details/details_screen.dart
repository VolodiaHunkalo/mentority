

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import '../../models/mentors.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Mentor mentor;
  const DetailsScreen({Key? key,
    required this.mentor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: buildAppBar(context),
      body: MainBody(mentor: mentor,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/back.svg'),
          onPressed: () {
            Navigator.pop(context);
          }),
      centerTitle: false,
      title: Text('Back'.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText2,
      ),
      actions: <Widget>[
        IconButton(onPressed: () {},
            icon: SvgPicture.asset('assets/icons/cart_with_item.svg')
        )
      ],
    );
  }
}