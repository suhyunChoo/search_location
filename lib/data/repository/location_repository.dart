import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (statue) => true,
  ));

  

  Future<List<Location>> searchLocation(String query) async {
    try {
      final response =
          await _client.get('https://openapi.naver.com/v1/search/local.json?',
              ///query=검색할지역이름&display=5'
              queryParameters: {
            'query': query,
            'display': 10,
          },
          options: Options(
          headers: {
            'X-Naver-Client-Id': 'PeUCqtSlGxppKSxZTGLp',  
            'X-Naver-Client-Secret': 'ob9KOj_LSt',  
          },
        ),);
      if (response.statusCode == 200) {
        final content = response.data['items'];
        return List.from(content).map((e) {
          // title에서 HTML 태그 제거
          final title = parse(e['title']).documentElement?.text ?? ''; // HTML 태그 제거
          final address = parse(e['address']).documentElement?.text ?? '';
          final category = parse(e['category']).documentElement?.text ?? '';
          final link =  parse(e['link']).documentElement?.text ?? '';// 주소에서 HTML 태그 제거

          // Location 객체로 변환
          return Location.fromJson({
            ...e,
            'title': title,
            'address': address,
            'category':category,
            'link':link,
          });
        }).toList();
      }else{
        print(response.statusCode);
        return [];
      }

    } catch (e) {
      print('error: $e');
      return [];
    }
  }
}
