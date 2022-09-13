import 'package:food_recipes/provider/RecipesProvider.dart';
import 'package:food_recipes/views/Profile/ProfileScreen.dart';
import 'package:food_recipes/views/home_screen/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Widget> pages = [
    HomeScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  static get index => null;

  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 130,
        elevation: 5.0,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xffFFFFFF),
        leading: Container(
          margin: const EdgeInsets.only(left: 25, bottom: 10),
          child: const Image(
            fit: BoxFit.contain,
            image: AssetImage("assets/images/home_logo.png"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<RecipesProvider>(context, listen: false).logOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Color(0xFF363837),
            ),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        // currentIndex: 0,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w300,
        ),
        selectedItemColor: const Color(0xff30BE76),
        showSelectedLabels: true,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            activeIcon: ImageIcon(
              AssetImage("assets/images/Icon3.png"),
              color: Color(0xff30BE76),
            ),
            icon: ImageIcon(
              AssetImage("assets/images/Icon3.png"),
              color: Color(0xFF9E9E9E),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
