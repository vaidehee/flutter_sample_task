import 'package:flutter/material.dart';
import 'package:flutter_sample_app/screens/profile.dart';
import 'package:flutter_sample_app/screens/see_all_screen.dart';
import 'dummy_screen.dart';
import 'home_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getScreen(selectedPosition),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home,
                    color: selectedPosition == 0 ? Color(0xFF2E4CB9) : Colors.black),
                onPressed: () {
                  setState(() {
                    selectedPosition = 0;
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.list,
                    color: selectedPosition == 1 ?Color(0xFF2E4CB9) : Colors.black),
                onPressed: () {
                  setState(() {
                    selectedPosition = 1;
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.favorite_border,
                    color: selectedPosition == 2 ?Color(0xFF2E4CB9) : Colors.black),
                onPressed: () {
                  setState(() {
                    selectedPosition = 2;
                  });
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0, right: 28.0),
                icon: Icon(Icons.people,
                    color: selectedPosition == 3 ? Color(0xFF2E4CB9): Colors.black),
                onPressed: () {
                  setState(() {
                    selectedPosition = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getScreen(int selectedPosition) {
    switch (selectedPosition) {
      case 0:
        return HomeScreen();
      case 1:
        return SeeAllPracticeSCreen();
      case 2:
        return DummyScreen();
      case 3:
        return ProfileScreen();
        break;
    }
  }
}
