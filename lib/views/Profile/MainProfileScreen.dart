import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';

import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/Profile/widget/userWidget.dart';
import 'package:provider/provider.dart';

class MainProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipesProvider>(builder: (context, provider, x) {
        return provider.allUsersRecponse.length == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SizedBox(
              height: 700,
              child: ListView.builder(
                  itemCount: provider.allUsersRecponse.length,
                  itemBuilder: (BuildContext context, int index) {
                    List<Users> user = provider.allUsersRecponse;
                    return UserWidget(user[index]);
                  },
                ),
            );
      }),
    );
  }
}
