import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:flutter_search_location_app/ui/pages/home/model/home_view_model.dart';

Widget searchResultWidget(Location location){

  return Consumer(
    builder: (context,ref,child) {
      return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: Colors.grey, width: 1)),
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
    }
  );
  }
