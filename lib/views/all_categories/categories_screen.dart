// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:food_recipes/provider/RecipesProvider.dart';
// import 'package:food_recipes/views/all_categories/widget/category_widget.dart';
// import 'package:provider/provider.dart';

// class CategoriesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RecipesProvider>(builder: (context, provider, child) {
//       return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//             toolbarHeight: 80,
//             leadingWidth: 200,
//             elevation: 0,
//             backgroundColor: const Color(0xffFFFFFF),
//             title: const Text("My Categories"),
//             leading: Container(
//               margin: const EdgeInsets.only(left: 30, bottom: 10),
//               child: const Image(
//                 image: AssetImage("assets/images/Logo.png"),
//               ),
//             )),
//         body: Column(
//           children: [
//             provider.allCategories.isEmpty
//                 ? const Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : Expanded(
//                     child: ListView.builder(
//                       itemCount: provider.allCategories.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return CategoryWidget(provider.allCategories[index]);
//                       },
//                     ),
//                   ),
//           ],
//         ),
//       );
//     });
//   }
// }
