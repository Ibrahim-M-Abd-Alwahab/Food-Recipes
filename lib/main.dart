import 'package:flutter/material.dart';
import 'package:food_recipes/Router/router.dart';
import 'package:food_recipes/data/SharedPrefer_Helper.dart';
import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/splach/splachScreen.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecipesProvider>(
          create: (context) {
            return RecipesProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navKey,
        home: SplachScreen(),
      ),
    );
  }
}
