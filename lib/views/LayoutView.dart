import 'package:flutter/material.dart';
import '../components/UserCompoent.dart';
import './HomeView.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LayoutView();
  }
}

class _LayoutView extends State<LayoutView> {
  final pages = [HomeView(), UserCompoent()];
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  _onItemTag(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child:  Scaffold(
      backgroundColor: Color.fromRGBO(234, 230, 255, 1),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize:20,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的")
        ],
        onTap: _onItemTag,
      ),
    ));
  }
}
