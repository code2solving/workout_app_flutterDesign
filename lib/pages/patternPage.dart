import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workouthelper/pages/home.dart';
import 'package:workouthelper/pages/navigationPage.dart';
import 'package:workouthelper/pages/statPage.dart';
import 'package:workouthelper/pages/userProfilePage.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({super.key});

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  int _selectedIndex=0;
  List<Widget> pages=[
    HomePage(),
    NavigationPage(),
    StatPage(),
    UserProfilePage()
  ];
  void _navigateBar(int index){
    setState((){
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Container(
          color: Colors.white,
          child: pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          type:BottomNavigationBarType.fixed,
          onTap: _navigateBar,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:''),
            BottomNavigationBarItem(icon: Icon(Icons.navigation),label:''),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart),label:''),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:''),
          ],
        )
    );
  }
}
AppBar appBar() {
  return AppBar(
    titleSpacing: 0.0,
    title: Transform(
        transform: Matrix4.translationValues(9.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Jade",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Ready to workout?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )),
    leading: GestureDetector(
      onTap: () {},
      child: Padding(
          padding: const EdgeInsets.all(0),
          child: Image.asset('assets/images/userPhoto.png')),
    ),
    actions: [
      GestureDetector(
          onTap: () {},
          child: Padding(
            padding:
            const EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 10),
            child: SvgPicture.asset('assets/images/notification.svg'),
          )
      ),
    ],
  );
}
