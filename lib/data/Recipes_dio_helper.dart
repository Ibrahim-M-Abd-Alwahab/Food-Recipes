import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_recipes/models/user_response.dart';

class RecipesHelper {
  RecipesHelper._();
  static RecipesHelper recipesHelper = RecipesHelper._();
  Dio dio = Dio();
  // ♥
  Future<List<Recipes>> getRecipes() async {
    String url = "http://192.168.0.165:8000/api/recipes";
    Response response = await dio.get(url);
    Map<String, dynamic> responseMap = response.data;

    List recipesResponse = responseMap['data'];
    List<Recipes> recipes = recipesResponse.map((e) {
      Recipes recipe = Recipes.fromJson(e);
      return recipe;
    }).toList();
    log("getRecipes: => length: ${recipes.length} $recipes");
    return recipes;
  }

  // ♥
  Future<List<Users>> getUsers() async {
    String url = "http://192.168.0.165:8000/api/users";
    Response response = await dio.get(url);
    Map<String, dynamic> responseMap = response.data;
    List usersResponse = responseMap['data'];
    List<Users> users = usersResponse.map((e) {
      Users user = Users.fromJson(e);
      return user;
    }).toList();
    log("getUser: => length: ${users.length} $users");
    return users;
  }

  Future<List<Users>> getSingleUsers() async {
    String url = "http://192.168.0.165:8000/api/users";
    Response response = await dio.get(url);
    Map<String, dynamic> responseMap = response.data;
    List usersResponse = responseMap['data'];
    List<Users> user_response = usersResponse.map((e) {
      Users userResponse = Users.fromJson(e);
      return userResponse;
    }).toList();
    return user_response;
  }

  Future<List<Categories>> getCategories() async {
    List<Categories> allCategories = [];
    List<Categories> categoryResponse = [];
    String url = "http://192.168.0.165:8000/api/users";
    Response response = await dio.get(url);
    Map<String, dynamic> responseMap = response.data;
    List usersResponse = responseMap['data'];
    List<Users> users = usersResponse.map((e) {
      return Users.fromJson(e);
    }).toList();

    for (var element in users) {
      categoryResponse = element.categories!;
      allCategories.addAll(categoryResponse);
    }
    return allCategories;
  }

  Future<List<Categories>> getRecipesInsideCategories() async {
    List<Categories> allCategories = [];
    List<Categories> categoryResponse = [];
    String url = "http://192.168.0.165:8000/api/users";
    Response response = await dio.get(url);
    Map<String, dynamic> responseMap = response.data;
    List usersResponse = responseMap['data'];
    List<Users> users = usersResponse.map((e) {
      return Users.fromJson(e);
    }).toList();

    for (var element in users) {
      categoryResponse = element.categories!;
      allCategories.addAll(categoryResponse);
    }
    return allCategories;
  }

  // Future<List<Categories>> getRecipesOfCatforCureentUser() async {
  //   List<Categories> allCategories = [];
  //   List<Categories> categories = [];
  //   String Url = "http://192.168.0.165:8000/api/users";
  //   Response response = await dio.get(Url);
  //   Map<String, dynamic> responseMap = response.data;
  //   List usersResponse = responseMap['data'];
  //   List<Users> users = usersResponse.map((e) {
  //     return Users.fromJson(e);
  //   }).toList();
  //   for (var element in users) {
  //     List<Categories>? categoryResponse = element.categories;
  //     for (var element in categoryResponse!) {
  //       allCategories.add(element);
  //     }
  //   }
  //   log("recipes:" + allCategories.toString());
  //   return allCategories;
  // }

  // getCurrentUserId() async {
  //   String Url = "http://192.168.0.165:8000/api/users";
  //   Response response = await dio.get(Url);
  //   Map<String, dynamic> responseMap = response.data;
  //   List usersResponse = responseMap['data'];
  //   users = usersResponse.map((e) {
  //     Users user = Users.fromJson(e);
  //     return user;
  //   }).toList();
  //   print(users.toString());
  //   return users;
  // }

  // Future<RecipesResponse> getRecipesList() async {
  //   String Url = "http://192.168.0.165:8000/api/recipes";
  //   Response response = await dio.get(Url);
  //   RecipesResponse recipesResponse = RecipesResponse.fromJson(response.data);
  //   return recipesResponse;
  // }

  // Future<CategoriesResponse> getCategories() async {
  //   String Url = "http://192.168.0.165:8000/api/categories";
  //   Response response = await dio.get(Url);
  //   CategoriesResponse categoriesResponse =
  //       CategoriesResponse.fromJson(response.data);
  //   log(categoriesResponse.msg.toString());
  //   return categoriesResponse;
  // }
}
