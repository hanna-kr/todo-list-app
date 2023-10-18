import 'package:exercise_ui/home_screen.dart';
import 'package:exercise_ui/todo_screen.dart';
import 'package:exercise_ui/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedPage = 0;

  final _pageOptions = [
    const HomeScreen(),
    const ToDoScreen(),
    const SearchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_bullet), label: 'ToDos'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'),
          ],
          activeColor: Colors.teal,
          backgroundColor: Colors.white,
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ),
      );
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, size: 30), label: 'ToDos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), label: 'Search'),
          ],
          selectedItemColor: Colors.teal,
          elevation: 5.0,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ),
      );
    } else {
      return const Text('error');
    }
  }
}
