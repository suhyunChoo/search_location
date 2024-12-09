import 'package:flutter/material.dart';
import 'package:flutter_search_location_app/ui/pages/home/home_bottom_navigation_bar.dart';
import 'package:flutter_search_location_app/ui/pages/home/home_indexed_stack.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeIndexedStack(),
      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}