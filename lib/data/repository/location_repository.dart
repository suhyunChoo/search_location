import 'package:dio/dio.dart';
import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:html/parser.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (statue) => true,
  ));

  //지역명 검색
  Future<List<Location>> searchLocation(String query) async {
    try {
      final response =
          await _client.get('https://openapi.naver.com/v1/search/local.json?',
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

  //vworld 현재 위치로 장소명 가져오기
  Future<List<String>> findByLatlng(double lat, double lng) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': 'D50FFAC5-D1B2-3086-B203-48C2AAE9CB79',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT(${lng} ${lat})',
          'geometry': false,
          'size': 100,
        },
      );
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features = response.data['response']['result']['featureCollection']['features'];
        final featuresList = List.from(features);
        final iterable = featuresList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }




}
