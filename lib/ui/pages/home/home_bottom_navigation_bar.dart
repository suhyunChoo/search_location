import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/ui/pages/home/home_bottom_model.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ref,child) {
      final currentIndex = ref.watch(homeBottomModel);
      final viewModel = ref.read(homeBottomModel.notifier);
        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: viewModel.onIndexChanged,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_outlined),
            label: '검색',
            tooltip: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            activeIcon: Icon(CupertinoIcons.star_fill),
            label: '즐겨찾기',
            tooltip: '즐겨찾기',
          ),
        ]);
      }
    );
  }
}
