import 'package:flutter/material.dart';

import 'data_tables_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int selectedPage = 0;
  final screens = [DataTablesScreen(), DataTablesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedPage],
      bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, blurRadius: 10, spreadRadius: 5)
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              items: itemsBNB(),
              currentIndex: selectedPage,
              onTap: (position) {
                setState(() {
                  selectedPage = position;
                  //selectionTab(position);
                });
              },
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.blueGrey,
              backgroundColor: Colors.green,
            ),
          )),
    );
  }

  List<BottomNavigationBarItem> itemsBNB() {
    List<BottomNavigationBarItem> list = [];
    list.add(const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: "Data Table"));
    list.add(const BottomNavigationBarItem(icon: Icon(Icons.star), label: ""));
    return list;
  }
}
