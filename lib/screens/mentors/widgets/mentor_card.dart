

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/mentors.dart';

class MentorCard extends StatelessWidget {
  const MentorCard({
    Key? key,
    required this.itemIndex,
    required this.mentor,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Mentor mentor;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 160,
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2),
      // color: Colors.blueAccent,
      child: InkWell(
        onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: itemIndex.isEven? kBlueColor : kSecondaryColor,
                boxShadow: [kDefaultShadow],
              ),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration:
                BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child:
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  width: 200,
                  child: Image.asset(mentor.image,
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: SizedBox(
                  height: 136,
                  //out image takes 200, so we need to minus 200 in our width
                  width: size.width -200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Text(mentor.title,
                            style: Theme.of(context).textTheme.button),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 1.5,
                          vertical: kDefaultPadding/4,
                        ),
                        decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            )
                        ),
                        child: Text('\$${mentor.price}',
                            style: Theme.of(context).textTheme.button),
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}