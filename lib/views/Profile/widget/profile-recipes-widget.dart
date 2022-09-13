import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/views/recipes_details/recipes_details.dart';

class ProfileRecipesWidget extends StatelessWidget {
  Recipes recipe;
  ProfileRecipesWidget(this.recipe);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      AppRouter.NavigateToWidget(RecipesDetails(recipe));

      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: EdgeInsets.all(2),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
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
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(recipe.image ?? ""),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    recipe.name.toString(),
                    style: const TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 16,
                      color: Color(0xff030f09),
                      height: 1.375,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
