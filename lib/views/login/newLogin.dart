import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_recipes/models/user_response.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesProvider>(builder: (context, provider, x) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 331,
                  color: Colors.white,
                  child: const SizedBox(
                    child: Image(
                      image: AssetImage("assets/images/bgimage.png"),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 60,
                    left: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Image(
                        image: AssetImage("assets/images/Login_Logo.png"),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff030f09),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 25,
                left: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please login to continue.',
                    style: TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff606060),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: provider.loginKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 335,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: provider.validateName,
                                  controller: provider.nameController,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070)),
                                    ),
                                    border: UnderlineInputBorder(),
                                    contentPadding: EdgeInsets.only(bottom: -5),
                                    label: Text("Enter your username"),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Nunito-Regular',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffa8a8a8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 335,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: provider.validateEmail,
                                  controller: provider.emailController,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFF707070)),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.redAccent,
                                        width: 1.0,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: -5),
                                    label: Text("Email address"),
                                    labelStyle: TextStyle(
                                      fontFamily: 'Nunito-Regular',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffa8a8a8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  InkWell(
                    onTap: () async {
                      if (provider.loginKey.currentState!.validate()) {
                        List<Users> users = provider.allUsers;
                        for (var element in users) {
                          provider.login(element);
                        }
                      } else {
                        log("You Must to login");
                      }
                    },
                    child: Container(
                      width: 335,
                      height: 50,
                      padding: const EdgeInsets.only(top: 13, left: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xff30BE76),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Nunito-Bold',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff),
                          height: 1.3125,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  SizedBox(
                    width: 325,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          'New to Scratch?',
                          style: TextStyle(
                            fontFamily: 'Nunito-Regular',
                            fontSize: 14,
                            color: Color(0xffa8a8a8),
                            height: 1.5714285714285714,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Create Account Here',
                          style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontSize: 16,
                            color: Color(0xff30BE76),
                            letterSpacing: 0.32,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
