import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/settings_page.dart';
import 'package:flutter_application_1/pages/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  final List _pages = [
    //menu
    MenuPage(),
    
    //cart
    CartPage(),

    //profile
    ProfilePage(),

    //settings
    SettingsPage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        appBar: AppBar(
          //title: const Text("Pizzario"),
          elevation: 0,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: const Color.fromARGB(255, 43, 41, 41),
          unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 14),
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white, //<-- add this
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood, color: Colors.white,),
              label: "Menu",
            ),
            
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              label: 'Cart',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white,),
              label: 'Profile',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white,),
              label: 'Settings',
            ),
          ],
        ),
    );
  }
}
