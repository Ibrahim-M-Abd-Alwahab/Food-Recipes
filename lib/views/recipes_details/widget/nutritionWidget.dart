import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';

class NutritionWidget extends StatelessWidget {
  Recipes recipes;
  NutritionWidget(this.recipes);

  List list = [];
  List textPartOne = [];
  List textPartTwo = [];

  List<dynamic>? getContent(String nutrition) {
    List<String> spiltingText = nutrition.split(',');
    for (var element in spiltingText) {
      list = element.split("=>");
      textPartTwo.add(list[0]);
      textPartOne.add(list[1]);
    }
    return textPartOne;
  }

  @override
  Widget build(BuildContext context) {
    getContent(recipes.nutrition!);
    return Container(
      height: 300,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: textPartOne.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                textPartOne[index],
                style: const TextStyle(
                  fontFamily: 'Nunito-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff30BE76),
                  height: 1.5714285714285714,
                ),
              ),
              Text(
                textPartTwo[index],
                textAlign: TextAlign.right,
              ),
            ],
          );
        },
      ),
    );
  }
}
