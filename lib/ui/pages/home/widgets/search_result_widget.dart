import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:flutter_search_location_app/ui/pages/home/model/home_view_model.dart';

Widget searchResultWidget(Location location){

//검색 결과 리스트 뷰 내에 반환해주는 위젯
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
                  //검색 타이틀
                  Text(
                  location.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                //즐겨찾기 버튼
                GestureDetector(
                    //버튼 누를 경우
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
              //카테고리 표시
              Text(
                location.category,
                style: TextStyle(fontSize: 16),
              ),
              //주소 표시
              Text(location.roadAddress,
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        );
    }
  );
  }
