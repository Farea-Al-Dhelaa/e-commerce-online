import 'package:flutter/material.dart';
import 'package:shopping/views/profile/profile.dart';
import '../utils/constants.dart';
import '../views/cart/cart_screen.dart';
import '../views/favorite/favorite_screen.dart';
import '../views/home/home_screen.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartPage(),
    const FavoritesPage(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kcontentColor,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: kprimaryColor,
        unselectedItemColor: kbuttonColor,
        backgroundColor: kcontentColor,
      ),
    );
  }

  // Helper function to get the AppBar title based on the selected index
  String _getAppBarTitle(int index) {
    switch (index) {
      case 1:
        return 'Cart';
      case 2:
        return 'Favorites';
      case 3:
        return 'Profile';
      default:
        return 'Home';
    }
  }
}
