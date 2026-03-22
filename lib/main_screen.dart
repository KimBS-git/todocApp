import 'package:flutter/material.dart';
import 'package:todoc/home.dart';
import 'package:todoc/my_pet.dart';
import 'package:todoc/search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [Home(), Search(), MyPet()];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        selectedItemColor: Color(0xff1d4ed8),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "홈"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: "병원검색",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt, size: 30),
            label: "예약내역",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets, size: 30),
            label: "마이펫",
          ),
        ],
      ),
    );
  }
}
