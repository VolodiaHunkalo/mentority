

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List categories = ['Entrepreneur', 'Finance', 'Sports', 'Investments'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              setState((){
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: kDefaultPadding),
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:
                  index == selectedIndex
                      ? Colors.white.withOpacity(0.4)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(categories[index],
                style: TextStyle(
                    color: Colors.white
                ),
              ),

            ),
          )
      ),

    );
  }
}