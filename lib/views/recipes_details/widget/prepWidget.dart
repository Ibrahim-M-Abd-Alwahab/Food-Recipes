import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';

class PrepWidget extends StatelessWidget {
  Recipes recipes;
  PrepWidget(this.recipes);
  List list = [];
  List<int>? number = [];

  getCurrentIndex(List steps) {
    for (int i = 0; i < (steps.length - 1); i++) {
      number!.add(i + 1);
    }
    return number;
  }

  List<dynamic>? getContent(String steps) {
    List<String> spiltingText = steps.split('*');
    for (var element in spiltingText) {
      list.add(element.trim());
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    getContent(recipes.steps!);

    return Container(
      color: Colors.white,
      width: 400,
      height: 415,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length - 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: const BorderRadius.all(
                      Radius.elliptical(9999.0, 9999.0),
                    ),
                    border: Border.all(
                      width: 2,
                      color: const Color(0xff30be76),
                    ),
                  ),
                  child: Transform.translate(
                    offset: const Offset(9.0, 9.0),
                    child: Text(
                      getCurrentIndex(list)[index].toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff30be76),
                        height: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 300,
                  child: Text(
                    list[index],
                    style: const TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 14,
                      color: Color(0xff030f09),
                      height: 1.5714285714285714,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
