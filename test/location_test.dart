import 'dart:convert';

import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //
  String jsonString = """
{
  "title":"살라댕템플",
  "link": "https://app.catchtable.co.kr/ct/shop/saladaengtemple",
  "category": "음식점&gt;양식",
  "address" : "서울특별시 성동구 성수동2가 269-202",
  "roadAddress" : "서울특별시 성동구 성수이로16길 32",
  "mapx" : "1270600097",
  "mapy" : "375401298",
  "description": " ",
  "telephone":" "
  }
""";

  test(
    'Location model convert test',
    () {
      Map<String, dynamic> map = jsonDecode(jsonString);
      Location location = Location.fromJson(map);

      expect(location.title, "살라댕템플");
    },
  );
}
