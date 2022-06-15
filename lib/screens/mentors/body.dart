

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentority/screens/mentors/widgets/categories_list.dart';
import 'package:mentority/screens/mentors/widgets/mentor_card.dart';
import 'package:mentority/screens/mentors/widgets/search_box.dart';

import '../../constants.dart';
import '../../models/mentors.dart';
import '../details/details_screen.dart';

class MentorsBody extends StatelessWidget {
  const MentorsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBox(onChanged: (value) {},),
        CategoryList(),
        SizedBox(height: kDefaultPadding/2),
        Expanded(child: Stack(
          children: <Widget>[
            //our background
            Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              margin: EdgeInsets.only(top: 70),
            ),
            ListView.builder(
                itemCount: mentors.length,
                itemBuilder: (context, index) => MentorCard(
                  itemIndex: index,
                  mentor: mentors[index],
                  press: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder:
                            (context) => DetailsScreen(mentor: mentors[index],)
                    )
                    );
                  },
                )
            )
          ],
        )
        )
      ],
    );
  }
}