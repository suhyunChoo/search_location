import 'package:flutter_search_location_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final locationRepository = LocationRepository();
  test('locationRepository test', ()async{
    final result = await locationRepository.searchLocation('살라댕템플');
    print(result.first.category);
    expect(result.first.title, '살라댕템플');
  });
}



// import 'package:dio/dio.dart';

// void main() async {
//   final dio = Dio();

//   // 헤더에 인증 정보 추가
//   dio.options.headers = {
//     'X-Naver-Client-Id': 'PeUCqtSlGxppKSxZTGLp',
//     'X-Naver-Client-Secret': 'ob9KOj_LSt',
//   };
//   test('description', ()async{
//     final response = await dio.get(
//       'https://openapi.naver.com/v1/search/local.json',
//       queryParameters: {
//         'query': '살라댕템플',
//         'display': 10,
//         'start': 1,
//         'sort': 'random',
//       },
//     );
//     print('Response: ${response.data}');

//   });
// }

