import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';

class IngrediantWidget extends StatelessWidget {
  Recipes recipes;
  IngrediantWidget(this.recipes);

  List list = [];
  List textPartOne = [];
  List textPartTwo = [];

  List<dynamic>? getContent(String ingredients) {
    List<String> spiltingText = ingredients.split(',');
    for (var element in spiltingText) {
      list = element.split("=>");
      textPartTwo.add(list[0]);
      textPartOne.add(list[1]);
    }
    return textPartOne;
  }

  @override
  Widget build(BuildContext context) {
    getContent(recipes.ingredients!);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: textPartOne.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
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
