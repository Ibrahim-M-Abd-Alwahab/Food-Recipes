import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/recipes_details/widget/ingrediantsWidget.dart';
import 'package:food_recipes/views/recipes_details/widget/nutritionWidget.dart';
import 'package:food_recipes/views/recipes_details/widget/prepWidget.dart';
import 'package:provider/provider.dart';

class RecipesDetails extends StatelessWidget {
  Recipes recipes;
  RecipesDetails(this.recipes);

  @override
  Widget build(BuildContext context) {
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff767676),
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer<RecipesProvider>(builder: (context, provider, x) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    recipes.image ?? "",
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 380,
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  recipes.name ?? " ",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontFamily: 'Nunito-Bold',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff030f09),
                  ),
                ),
              ),
              Container(
                height: 250,
                width: 380,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1a0d3320),
                      offset: Offset(0, 6),
                      spreadRadius: 5,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff030f09),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          // *********************************** Test
                          return IngrediantWidget(recipes);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 500,
                width: 380,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1a0d3320),
                      offset: Offset(0, 6),
                      spreadRadius: 5,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'How to cook',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff030f09),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SizedBox(
                        width: 400,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return PrepWidget(recipes);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 343,
                width: 380,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1a0d3320),
                      offset: Offset(0, 6),
                      spreadRadius: 5,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Additional Info',
                      style: TextStyle(
                        fontFamily: 'Nunito-Bold',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff030f09),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Serving Time",
                                style: TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xffa8a8a8),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                recipes.totalTime.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xff030f09),
                                  height: 1.5714285714285714,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "preparing Time",
                                style: TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xffa8a8a8),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                recipes.prepTime.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xff030f09),
                                  height: 1.5714285714285714,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Cook Time",
                                style: TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xffa8a8a8),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                recipes.cookTime.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 14,
                                  color: Color(0xff030f09),
                                  height: 1.5714285714285714,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 245,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Nutrition Facts",
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontSize: 14,
                              color: Color(0xffa8a8a8),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 130,
                            height: 180,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return NutritionWidget(recipes);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      }),
    );
  }
}
