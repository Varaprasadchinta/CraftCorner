import 'package:craft_corner/screens/home/home.dart';
import 'package:craft_corner/screens/products/product_list_screen.dart';
import 'package:craft_corner/screens/profile/profile_screen.dart';
import 'package:craft_corner/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key,});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomePage(),
      WishListScreen(),
      const ProductListScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shop),
            label: 'Stores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


// class NavigationController extends GetxController{
//   final Rx<int> selectedIndex = 0.obs;
//   final screens = [HomePage(),Container(color: Colors.blue,),const StoresScreen(),ProfileScreen()];
// }