import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/data/SharedPrefer_Helper.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/all_Recipes/widget/recipe_widget.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: const Color(0xffFFFFFF),
          title: const Align(
            alignment: Alignment(-1.2, 0),
            child: Text(
              "Back to Home Page",
              style: TextStyle(
                fontFamily: 'Nunito-Regular',
                fontSize: 12,
                color: Color(0xff767676),
                letterSpacing: 0.4,
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey.withOpacity(0.2),
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            provider.getLengthOfRecipesInSideCategoryUser() == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount:
                          provider.getLengthOfRecipesInSideCategoryUser(),
                      itemBuilder: (BuildContext context, int index) {
                        List<Recipes>? recipesInsideCateUser =
                            provider.getRecipesInSideCategoryUser();
                        return RecipeWidget(recipesInsideCateUser![index]);
                        // return RecipeWidget(provider.allRecipesintoCategory[index]);

                      },
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
