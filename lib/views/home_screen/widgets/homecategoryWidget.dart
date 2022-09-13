import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/views/all_Recipes/All_Recipes_screen.dart';

class homeCategoryWidget extends StatelessWidget {
  Categories categories;
  // ignore: use_key_in_widget_constructors
  homeCategoryWidget(this.categories);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await AppRouter.NavigateToWidget(RecipesScreen());
      },
      child: Container(
        transform: Matrix4.translationValues(0.0, -40.0, 0.0),
        height: 340,
        width: 219,
        margin: const EdgeInsets.only(bottom: 20, left: 25, right: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 219,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(categories.image ?? ""),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categories.name.toString(),
                    style: const TextStyle(
                      fontFamily: 'Nunito-SemiBold',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff030f09),
                      height: 1.7777777777777777,
                    ),
                  ),
                  const Text(
                    "Apparently we had reached a great height in the atmosphere, for the sky was …",
                    style: TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 14,
                      color: Color(0xffa8a8a8),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
