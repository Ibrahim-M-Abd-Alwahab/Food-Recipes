// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<RecipesProvider>(builder: (
        context,
        provider,
        x,
      ) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // it need AuthenticationProvider
                  // log(provider.allUsers.length.toString());
                  // log(" allUsers =========> ${provider.allUsers}");
                  // log(provider.allUsers.toString());
                },
                child: const Text("get User"),
              ),
              ElevatedButton(
                onPressed: () {
                  // ignore: prefer_interpolation_to_compose_strings
                  // provider.getRecipes();
                  // log(provider.allRecipes.toString());
                  // log(provider.allRecipes.length.toString());
                },
                child: const Text("Get Recipes"),
              ),
              ElevatedButton(
                onPressed: () {
                  // ignore: prefer_interpolation_to_compose_strings
                  // log(provider.allCategories.length.toString());
                  // log(provider.allCategories.toString());
 
                },
                child: const Text("Get Categories"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
