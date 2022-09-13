import 'package:flutter/material.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
 import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class SplachScreen extends StatelessWidget {
  navigateFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Provider.of<RecipesProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    navigateFun(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 475,
              width: 633.95,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.white60, BlendMode.dstATop),
                    image: AssetImage('assets/images/Image.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage("assets/images/SLogo.png"),
              height: 200,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
