import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences? sharedPreferencess;

  initSp() async {
    sharedPreferencess = await SharedPreferences.getInstance();
  }

  saveId(int id) async {
    sharedPreferencess?.setInt("id", id);
  }

  int? getId() {
    return sharedPreferencess?.getInt("id");
  }

  /* **********  user-id ************** */

  saveUserId(int id) async {
    sharedPreferencess?.setInt("userId", id);
  }

  int? getUserId() {
    return sharedPreferencess?.getInt("userId");
  }

  removeId() {
    return sharedPreferencess?.remove("userId");
  }
  /* **********  Category-id ************** */

  saveCategoryid(int categoryId) async {
    sharedPreferencess?.setInt("categoryId", categoryId);
  }

  int? getCategoryid() {
    return sharedPreferencess?.getInt("categoryId");
  }

  removegetCategoryid() {
    return sharedPreferencess?.remove("categoryId");
  }

  /* **********  Recipes-id ************** */
  saveRecipesid(int recipesId) async {
    sharedPreferencess?.setInt("recipesId", recipesId);
  }

  int? getRecipesid() {
    return sharedPreferencess?.getInt("recipesId");
  }

  removegetRecipesid() {
    return sharedPreferencess?.remove("recipesId");
  }
}
