import 'package:flutter/material.dart';
import 'package:projectone/home_page.dart';
import 'package:projectone/my_page.dart';
import 'bae_item_page.dart';
import 'search_page.dart';
class MainPage  extends StatefulWidget {
  const MainPage({Key? key }) :super(key: key);

  @override
  _MainPageState  createState() => _MainPageState();


}




class _MainPageState extends State<MainPage>{
  List pages=[
    HomePageone(),
    BarItemPage(),
    SearchPage(),
    MyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex= index;


    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:pages[currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           unselectedFontSize: 0,
           selectedFontSize: 0,
           type:BottomNavigationBarType.fixed,
          backgroundColor:Colors.white,
          onTap: onTap,
           currentIndex: currentIndex,
selectedItemColor: Colors.black,
           unselectedItemColor: Colors.grey.withOpacity(0.5),
           showUnselectedLabels: false,
           showSelectedLabels: false,
           elevation: 0,
           items:[
           BottomNavigationBarItem(
           label: "Home",
           icon: Icon(Icons.apps),
         ),
             BottomNavigationBarItem(
               label: "Bar",
               icon: Icon(Icons.bar_chart_sharp),
             ),
             BottomNavigationBarItem(
               label: "Search",
               icon: Icon(Icons.search),
             ),
             BottomNavigationBarItem(
               label: "My",
               icon: Icon(Icons.person),
             ),
           ]
         ),
    );
  }
}
