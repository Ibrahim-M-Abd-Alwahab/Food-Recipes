// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:food_recipes/Router/router.dart';
// import 'package:food_recipes/data/SharedPrefer_Helper.dart';
// import 'package:food_recipes/models/categories_response.dart';
// import 'package:food_recipes/views/all_Recipes/All_Recipes_screen.dart';

// class CategoryWidget extends StatelessWidget {
//   Categories categories;
//   // ignore: use_key_in_widget_constructors
//   CategoryWidget(this.categories);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         int currentId = categories.id!;
//         SpHelper.spHelper.saveId(currentId);
//         AppRouter.NavigateToWidget(RecipesScreen());
//       },
//       child: Container(
//         height: 340,
//         margin: const EdgeInsets.only(bottom: 20, left: 40, right: 55, top: 20),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: SizedBox(
//                 height: 219,
//                 child: Image(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(categories.image ?? ""),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 10, left: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     categories.name.toString(),
//                     style: const TextStyle(
//                       fontFamily: 'Nunito-SemiBold',
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xff030f09),
//                       height: 1.7777777777777777,
//                     ),
//                   ),
//                   const Text(
//                     "Apparently we had reached a great height in the atmosphere, for the sky was …",
//                     style: TextStyle(
//                       fontFamily: 'Nunito-Regular',
//                       fontSize: 14,
//                       color: Color(0xffa8a8a8),
//                       height: 1.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
