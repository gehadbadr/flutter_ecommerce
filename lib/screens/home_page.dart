import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controllers/home_controller.dart';
import 'package:ecommerce/screens/cart_screen/cart_screen.dart';
import 'package:ecommerce/screens/category_screen/category_screen.dart';
import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody =[
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body:  Column(
          children: [
            Obx(() => Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
          ],
        ),
      bottomNavigationBar: Obx(()=>
          BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          type: BottomNavigationBarType.fixed,
          items: navbarItem,
          backgroundColor: whiteColor,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          onTap:(value){controller.currentNavIndex.value = value;} ,

        ),
      ),
    );
  }
}
