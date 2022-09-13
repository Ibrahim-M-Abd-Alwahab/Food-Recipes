import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';
import 'package:food_recipes/data/SharedPrefer_Helper.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/views/recipes_details/recipes_details.dart';

class RecipeWidget extends StatelessWidget {
  Recipes recipes;
  // ignore: use_key_in_widget_constructors
  RecipeWidget(this.recipes);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log(recipes.categoryId.toString());
        AppRouter.NavigateToWidget(RecipesDetails(recipes));
      },
      child: Container(
        height: 576,
        margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  recipes.image == null
                      ? SizedBox(
                          height: 396,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : SizedBox(
                          height: 396,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                recipes.image ?? "",
                              )),
                        ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 62,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff).withOpacity(0.99),
                    ),
                    child: Row(
                      children: const [
                        Image(
                          image:
                              AssetImage("assets/images/User-Avatar-Image.png"),
                        ),
                        SizedBox(width: 10),
                        Text("Profile Name"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipes.name.toString(),
                      style: const TextStyle(
                        fontFamily: 'Nunito-SemiBold',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff030f09),
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Text(
                        recipes.description.toString(),
                        style: const TextStyle(
                          fontFamily: 'Nunito-Regular',
                          fontSize: 14,
                          color: Color(0xffa8a8a8),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
