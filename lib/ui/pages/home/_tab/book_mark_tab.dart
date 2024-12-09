import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/ui/pages/home/model/home_view_model.dart';

class BookMarkTap extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('즐겨찾기'),
      ),
      body: Consumer(
      builder: (context,ref,child) {
        final favoriteLocations = ref.watch(homeViewModel).where((location) => location.favorite).toList();

        return ListView.builder(
          itemCount: favoriteLocations.length,
          itemBuilder: (context, index) {
            final location = favoriteLocations[index];
            return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                    location.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        ref.read(homeViewModel.notifier).toggleFavorite(location.title);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Icon(
                        location.favorite ? Icons.favorite : Icons.favorite_border,
                        color: location.favorite ? Colors.red : null,
                        size: 20,),
                      ),
                    ),
                  ]
                ),
                Text(
                  location.category,
                  style: TextStyle(fontSize: 16),
                ),
                Text(location.roadAddress,
                    style: TextStyle(fontSize: 16)),
              ],     
            ),     
                    );
          },
          
        );
      }
        ),
    );
  }
}