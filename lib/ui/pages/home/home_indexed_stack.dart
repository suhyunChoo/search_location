import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/ui/pages/home/_tab/book_mark_tab.dart';
import 'package:flutter_search_location_app/ui/pages/home/_tab/home_tab.dart';
import 'package:flutter_search_location_app/ui/pages/home/home_bottom_model.dart';

class HomeIndexedStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final currentIndex = ref.watch(homeBottomModel);
        return IndexedStack(
          index: currentIndex,
          children: [
            HomeTab(),
            BookMarkTap(),
          ],
        );
      },
    );
  }
}