import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int tmp = 0;
  List tabs = [
    Text("Home", style: TextStyle(fontSize: 25)),
    Text("Notify", style: TextStyle(fontSize: 25)),
    Text("Map", style: TextStyle(fontSize: 25)),
    Text("Profile", style: TextStyle(fontSize: 25)),
    Text("Setup", style: TextStyle(fontSize: 25))
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Home", style: TextStyle(fontWeight: FontWeight.bold),)),
          automaticallyImplyLeading: false,
        ),

        body: Center(
          child: tabs[tmp],
        ),

        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).accentColor,
          ),
          child: BottomNavigationBar(
            currentIndex: tmp,
            onTap: (int i) {
              setState(() {
                tmp = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  title: Text(""), icon: Icon(Icons.view_quilt)),
              BottomNavigationBarItem(
                  title: Text(""), icon: Icon(Icons.notifications)),
              BottomNavigationBarItem(
                  title: Text(""), icon: Icon(Icons.explore)),
              BottomNavigationBarItem(
                  title: Text(""), icon: Icon(Icons.person)),
              BottomNavigationBarItem(
                  title: Text(""), icon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
