import 'package:ecommerce/screens/ProfileScreen.dart';
import 'package:ecommerce/screens/bottom_navs/CartContent.dart';
import 'package:ecommerce/screens/bottom_navs/HomeContent.dart';
import 'package:ecommerce/screens/bottom_navs/ShopContent.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomeContent(),
    ShopContent(),
    CartContent(),
    ProfileScreen(),
  ];
  static const List<String> _titles = <String>[
    'Home',
    'Shops',
    'Cart',
    'Profile',
  ];

  void _onTab(int index) {
    if (index == 3) {
      Navigator.pushNamed(context, ProfileScreen.routeName);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onCartPress() {
    _onTab(2);
  }

  Widget _buildContent() {
    return _pages[_selectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          if (_selectedIndex != 2)
            IconButton(
              onPressed: _onCartPress,
              icon: Icon(Icons.shopping_cart),
            ),
        ],
      ),
      body: _buildContent(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shops'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
