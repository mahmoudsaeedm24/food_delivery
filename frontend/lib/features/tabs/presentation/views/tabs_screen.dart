import 'package:flutter/material.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/features/cart/presentation/view/screens/cart_screen.dart';
import 'package:frontend/features/home/presentation/views/screens/home_screen.dart';
import 'package:frontend/features/personal_data/presentation/views/personal_data_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  Widget _currentPage(int currentIndex) {
    List<Widget> pages = [
      HomeScreen(),
      CartScreen(),
      PersonalDataScreen(key: ValueKey('screen 3')),
      // PersonalDataScreen(key: ValueKey('screen 4'),),
    ];
    return pages[currentIndex];
  }

  void _onItemTapped(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
            backgroundColor: MyColors.primaryColor,
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_bag),
            // backgroundColor: Colors.red,
          ),
          // BottomNavigationBarItem(
          //   label: "Messages",
          //   icon: Icon(Icons.message_rounded),
          //   backgroundColor: MyColors.primaryColor,

          //   // backgroundColor: Colors.green,
          // ),
          BottomNavigationBarItem(
            label: "Info",
            icon: Icon(Icons.person),
            backgroundColor: MyColors.primaryColor,

            // backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: _currentPage(currentIndex),
    );
  }
}
