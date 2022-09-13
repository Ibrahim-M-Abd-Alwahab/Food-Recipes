import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/data/SharedPrefer_Helper.dart';
import 'package:food_recipes/models/user_response.dart';

import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/home_screen/widgets/home-recipe-widget.dart';
import 'package:food_recipes/views/home_screen/widgets/homecategoryWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RecipesProvider>(
        builder: (context, provider, x) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ignore: unnecessary_null_comparison
                  provider.getLengthRecipeOfUser() == null
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          height: 700,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.getLengthRecipeOfUser(),
                            itemBuilder: (BuildContext context, int index) {
                              List<Recipes> getRecipeOfUser() {
                                List<Recipes> recipesOCurrentfUser = [];
                                int? id = SpHelper.spHelper.getUserId();
                                for (var element in provider.allRecipes) {
                                  log(element.toString());
                                  if (id == element.userId) {
                                    recipesOCurrentfUser.add(element);
                                  }
                                }
                                log(recipesOCurrentfUser.length.toString());
                                return recipesOCurrentfUser;
                              }

                              List<Recipes> recipesOfUser = getRecipeOfUser();
                              return HomeRecipeWidget(recipesOfUser[index]);
                            },
                          ),
                        ),
                  provider.getLengthCategoryOfUser() == null
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.getLengthCategoryOfUser(),
                            itemBuilder: (BuildContext context, int index) {
                              List<Categories> getCategoryOfUser() {
                                List<Categories> categoryOfCurrentUser = [];
                                int? id = SpHelper.spHelper.getUserId();
                                for (var element in provider.allCategories) {
                                  if (id == element.userId) {
                                    categoryOfCurrentUser.add(element);
                                  }
                                }
                                log(categoryOfCurrentUser.length.toString());
                                return categoryOfCurrentUser;
                              }

                              List<Categories> categoryOfUser =
                                  getCategoryOfUser();
                              return homeCategoryWidget(categoryOfUser[index]);
                            },
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
