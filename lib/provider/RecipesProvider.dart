import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';
import 'package:food_recipes/data/Recipes_dio_helper.dart';
import 'package:food_recipes/data/SharedPrefer_Helper.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/views/home_screen/firstScreen.dart';
import 'package:food_recipes/views/login/newLogin.dart';

class RecipesProvider extends ChangeNotifier {
  RecipesProvider() {
    getUsers();
    getRecipes();
    getCategories();
    getSingleUsers();
  }

  List<Recipes> allRecipes = [];
  List<Categories> allCategories = [];
  List<Recipes> allRecipesintoCategory = [];
  List<Users> allUsersRecponse = [];
  // List<Recipes> recipesOCurrentfUser = [];
  // List<Categories> categoriesOCurrentfUser = [];
  // List<String> ingredients = [];
  List<Users> allUsers = [];
  List<String> listOfIngredients = [];
  List array = [];
  List newArray = [];
  List newArrayArray = [];
  List textPartOne = [];
  List textPartTwo = [];

  Future<List<Users>> getUsers() async {
    List<Users> users = await RecipesHelper.recipesHelper.getUsers();
    allUsers.addAll(users);
    log(allUsers.toString());
    notifyListeners();
    return users;
  }

/////////////// edit
  // Future<List<Categories>> getCategoryOfUser() async {
  //   List<Categories> currentCate = [];

  //   List<Categories> returnCategory = [];
  //   List<Categories> categories =
  //       await RecipesHelper.recipesHelper.getCategories();
  //   for (var element in categories) {
  //     returnCategory.add(element);
  //   }
  //   int? id = SpHelper.spHelper.getUserId();

  //   for (var element in returnCategory) {
  //     if (id == element.userId) {
  //       currentCate.add(element);
  //     }
  //   }
  //   return currentCate;
  // }

  List<Users> userList = [];

  getSingleUsers() async {
    List<Users> user = await RecipesHelper.recipesHelper.getSingleUsers();
    allUsersRecponse.addAll(user);
    notifyListeners();
  }

  getRecipes() async {
    List<Recipes> recipes = await RecipesHelper.recipesHelper.getRecipes();
    allRecipes.addAll(recipes);
    notifyListeners();
    return recipes;
  }

  getCategories() async {
    List<Categories> categories =
        await RecipesHelper.recipesHelper.getCategories();
    allCategories.addAll(categories);
    notifyListeners();
    return categories;
  }

  int getLengthRecipeOfUser() {
    List<Recipes> recipesOCurrentfUser = [];
    int? id = SpHelper.spHelper.getUserId();
    for (var element in allRecipes) {
      log(element.toString());
      if (id == element.userId) {
        recipesOCurrentfUser.add(element);
      }
    }
    notifyListeners();
    return recipesOCurrentfUser.length;
  }

  int getLengthCategoryOfUser() {
    List<Categories> categoryOfCurrentUser = [];
    int? id = SpHelper.spHelper.getUserId();
    for (var element in allCategories) {
      if (id == element.userId) {
        categoryOfCurrentUser.add(element);
      }
    }
    notifyListeners();

    return categoryOfCurrentUser.length;
  }

  int? getLengthOfRecipesInSideCategoryUser() {
    int? recipesId = SpHelper.spHelper.getRecipesid();

    List<Recipes> recipesOCurrentfUser = [];
    for (var element in allRecipes) {
      if (recipesId == element.categoryId) {
        recipesOCurrentfUser.add(element);
      }
    }
    allRecipesintoCategory.addAll(recipesOCurrentfUser);
    log(recipesOCurrentfUser.length.toString());
    return recipesOCurrentfUser.length;
  }

  List<Recipes>? getRecipesInSideCategoryUser() {
    int? recipesId = SpHelper.spHelper.getRecipesid();
    List<Recipes> recipesOCurrentfUser = [];
    for (var element in allRecipes) {
      if (recipesId == element.categoryId) {
        recipesOCurrentfUser.add(element);
      }
    }
    allRecipesintoCategory.addAll(recipesOCurrentfUser);
    log(recipesOCurrentfUser.length.toString());
    return recipesOCurrentfUser;
  }

  // getRecipesOfCatforUser() async {
  //   List<Categories> categories =
  //       await RecipesHelper.recipesHelper.getRecipesOfCatforCureentUser();
  //   categoriesOCurrentfUser.addAll(categories);
  //   notifyListeners();
  // }

  // /***************************/

  // List<Recipes?> getRecipesInCat() {
  //   List<Recipes?> RecipesInCat = [];
  //   int? id = SpHelper.spHelper.getUserId();

  //   for (var element in allRecipes) {
  //     if (element.userId == ) {
  //       RecipesInCat.add(element);
  //     }
  //   }
  //   return RecipesInCat;
  // }

  // Future<List<String>> getIngrediants() async {
  //   RecipesResponse recipesResponse =
  //       await RecipesHelper.recipesHelper.getRecipesList();
  //   for (var element in recipesResponse.recipe!) {
  //     ingredients.add(element.ingredients!);
  //   }
  //   notifyListeners();
  //   return ingredients;
  // }

  List list = [];

  List<dynamic>? getContent(List<String> ingredients) {
    for (var element in ingredients) {
      List<String> spiltingText = element.split(',');
      for (var element in spiltingText) {
        list = element.split("=>");
        textPartOne.add(list[0]);
        textPartTwo.add(list[1]);
      }
      return textPartOne;
    }
  }

  List<dynamic>? getContentTwo(String ingredients) {
    List<String> spiltingText = ingredients.split(',');
    for (var element in spiltingText) {
      list = element.split("=>");
      textPartTwo.add(list[1]);
    }
    print(textPartTwo);
    return textPartTwo;
  }

  // =========================  Authintication

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  String? validateName(String? value) {
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (value?.isEmpty ?? true) {
      return "Name is required";
    } else if (!regExp.hasMatch(value ?? '')) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  int? userId = SpHelper.spHelper.getUserId();

  // ******************** 2 *************************** //
  login(Users user) async {
    if (user.name == nameController.text &&
        user.email == emailController.text) {
      log("${user.name} ID =>  ${user.id} ");
      log("${user.name} userRecupesUser-Id => ${user.recipes!.first.id!} ");
      log("${user.name} userCategoryUser-id => ${user.categories!.first.id} ");
      SpHelper.spHelper.saveUserId(user.id!);
      SpHelper.spHelper.saveCategoryid(user.categories!.first.id!);
      SpHelper.spHelper
          .saveRecipesid(user.categories!.first.recipes!.first.categoryId!);

      AppRouter.NavigateWithReplacemtnToWidget(FirstScreen());
    }
  }

  checkUser() async {
    if (userId != null) {
      log("Check User Done : login Success");
      AppRouter.NavigateWithReplacemtnToWidget(FirstScreen());
    } else {
      AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
      log("Check User Done : You must to login");
    }
  }

  logOut() async {
    await SpHelper.spHelper.removeId();
    await SpHelper.spHelper.removegetCategoryid();
    await SpHelper.spHelper.removegetRecipesid();
    log("log out successfully");
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  }
}
