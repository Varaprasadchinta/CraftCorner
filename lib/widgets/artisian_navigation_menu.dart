import 'package:craft_corner/screens/artisians/addProducts/add_products.dart';
import 'package:craft_corner/screens/artisians/home/home_screen.dart';
// import 'package:craft_corner/screens/artisians/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ArtisianNavigationBarApp extends StatefulWidget {
  const ArtisianNavigationBarApp({super.key,});

  @override
  State<ArtisianNavigationBarApp> createState() => _ArtisianNavigationBarApp();
}

class _ArtisianNavigationBarApp extends State<ArtisianNavigationBarApp> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      // WishListScreen(),
      const AddProductScreen(),
      // ProfileScreen(),
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
            icon: Icon(Iconsax.add),
            label: 'Add',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Iconsax.user),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}