import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/Profile/widget/profile-recipes-widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<RecipesProvider>(builder: (context, provider, x) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "My Kitchen",
                    style: TextStyle(
                      fontFamily: 'Nunito-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff030f09),
                      height: 1.3333333333333333,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 82,
                    width: 82,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/Oval.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.elliptical(9999.0, 9999.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        provider.allUsers.first.name.toString(),
                        style: const TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff030f09),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        provider.allUsers.first.bio.toString(),
                        style: const TextStyle(
                          fontFamily: 'Nunito-Regular',
                          fontSize: 14,
                          color: Color(0xff606060),
                          height: 1.5714285714285714,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            provider.allUsers.first.followers.toString() +
                                'k followers',
                            style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontSize: 14,
                              color: Color(0xff606060),
                              height: 1.5714285714285714,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 4,
                            width: 4,
                            decoration: const BoxDecoration(
                              color: Color(0xff979797),
                              borderRadius: BorderRadius.all(
                                  Radius.elliptical(9999.0, 9999.0)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            provider.allUsers.first.likes.toString() +
                                "k likes",
                            style: const TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontSize: 14,
                              color: Color(0xff606060),
                              height: 1.5714285714285714,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: 370,
                height: 1,
                decoration: BoxDecoration(
                  color: const Color(0xFF707070).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(0.5),
                ),
              ),
              const SizedBox(height: 25),
              DefaultTabController(
                length: 3,
                child: Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: const Color(0xff30BE76),
                          tabs: [
                            RichText(
                              text: const TextSpan(
                                text: '   20\n',
                                style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff030f09),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Recipes',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Nunito-Regular',
                                      color: Color(0xff030f09),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: '  75 \n',
                                style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 20,
                                  color: Color(0x66030f09),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Saved',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Nunito-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: provider.allUsers.first.following
                                        .toString() +
                                    '\n',
                                style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 20,
                                  color: Color(0x66030f09),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Following',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Nunito-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Consumer<RecipesProvider>(
                            builder: (context, provider, x) {
                          return Expanded(
                            child: TabBarView(
                              children: [
                                GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 4,
                                    childAspectRatio: 0.7,
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: provider.allRecipes.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProfileRecipesWidget(
                                        provider.allRecipes[index]);
                                  },
                                ),
                                Container(
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                Container(
                                  color:  Colors.blue.withOpacity(0.2),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
