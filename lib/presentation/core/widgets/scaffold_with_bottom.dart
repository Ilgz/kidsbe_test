import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:times_wire/presentation/article/article_bookmark_overview_page.dart';
import 'package:times_wire/presentation/article/article_overview_page.dart';
import 'package:times_wire/presentation/core/widgets/custom_icon.dart';
import 'package:times_wire/presentation/profile/profile_page.dart';
import 'package:times_wire/presentation/topic/topic_overview_page.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key}) : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _currentIndex = 0;
  final _mainContents = [
    ArticleOverviewPage(),
    TopicOverviewPage(),
    ArticleBookmarkOverviewPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _mainContents,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey,width: 0.4)
          ),
          height: 70, // Set the desired height
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey[400],
              currentIndex: _currentIndex,
              unselectedLabelStyle: TextStyle(fontSize: 0),
              unselectedIconTheme: IconThemeData(size: 20),
              selectedIconTheme: IconThemeData(size: 20),
              selectedLabelStyle: TextStyle(fontSize: 0),
              selectedItemColor: Color(0xff475ad7),
              items: [
                BottomNavigationBarItem(
                  icon:  CustomIcon(iconName: "estate",color: _currentIndex==0?Color(0xff475ad7):Colors.grey[400]!),
                  label: 'fads',
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(iconName: "apps",color: _currentIndex==1?Color(0xff475ad7):Colors.grey[400]!),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(iconName: "bookmark",color: _currentIndex==2?Color(0xff475ad7):Colors.grey[400]!),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CustomIcon(iconName: "user",color: _currentIndex==3?Color(0xff475ad7):Colors.grey[400]!),
                  label: '',
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }
}
