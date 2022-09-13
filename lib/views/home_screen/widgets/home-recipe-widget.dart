// ignore: must_be_immutable
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';

import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/recipes_details/recipes_details.dart';
import 'package:provider/provider.dart';

class HomeRecipeWidget extends StatelessWidget {
  Recipes recipes;
  // ignore: use_key_in_widget_constructors
  HomeRecipeWidget(this.recipes);
  List<String> array = [];
  List<String> arrayTwo = [];
  // function
  int splitText(String ingredients) {
    List<String> spiltingText = ingredients.split(',');
    for (var element in spiltingText) {
      array = element.split("=>");
      arrayTwo.add(array[1]);
    }

    return arrayTwo.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 295,
        height: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1a0d3320),
              offset: Offset(0, 6),
              spreadRadius: 5,
              blurRadius: 5,
            )
          ],
        ),
        margin: const EdgeInsets.only(bottom: 80, right: 10, left: 10, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  InkWell(
                    onTap: () {
                      log(recipes.userId.toString());

                      AppRouter.NavigateToWidget(RecipesDetails(recipes));
                    },
                    child: Container(
                      width: 295.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recipes.image ?? ""),
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(
                          //   Colors.black.withOpacity(0.5),
                          //   BlendMode.dstIn,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child:
                    Consumer<RecipesProvider>(builder: (context, provider, x) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 45,
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          recipes.name.toString(),
                          style: const TextStyle(
                            wordSpacing: -1.5,
                            fontFamily: 'Nunito-SemiBold',
                            fontSize: 18,
                            color: Color(0xff030f09),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        maxLines: 3,
                        recipes.description.toString(),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'Nunito-Regular',
                          fontSize: 14,
                          color: Color(0xffa8a8a8),
                          height: 1.5714285714285714,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "± ${recipes.totalTime}",
                              style: const TextStyle(
                                fontFamily: 'Nunito-Regular',
                                fontSize: 14,
                                color: Color(0xff606060),
                              ),
                            ),
                            Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              splitText(recipes.ingredients!).toString() +
                                  " ingredients",
                              style: const TextStyle(
                                fontFamily: 'Nunito-Regular',
                                fontSize: 14,
                                color: Color(0xff606060),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 26,
                                width: 73,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: const Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(4.0),
                                  border: Border.all(
                                      width: 1.0,
                                      color: const Color(0xff30be76)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "+",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff30be76),
                                        letterSpacing: 0.3999999961853027,
                                        height: 0.9,
                                      ),
                                    ),
                                    Text(
                                      "Save",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff30be76),
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.3999999961853027,
                                        height: 1.2857142857142858,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
