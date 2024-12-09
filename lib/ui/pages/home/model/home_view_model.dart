import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/data/model/location.dart';
import 'package:flutter_search_location_app/data/repository/location_repository.dart';

class HomeViewModel extends AutoDisposeNotifier<List<Location>>{
  @override
  List<Location> build() {
    return [];
  }

  final locationRepository = LocationRepository();

  Future<void> search(String query)async{
    state = await locationRepository.searchLocation(query);
  }

  Future<void> searchByLocation(double lng, double lat) async {
    try {
      List<String> result = await locationRepository.findByLating(lat, lng);
      if (result.isNotEmpty) {
        state = await locationRepository.searchLocation(result[0]);
      }
    } catch (e) {
      print('Error in searchByLocation: $e');
    }
  }
  void toggleFavorite(String title) {
    state = state.map((location) {
      if (location.title == title) {
        return location.copyWith(favorite: !location.favorite);
      }
      return location;
    }).toList();
  }


}

final homeViewModel = NotifierProvider.autoDispose<HomeViewModel,List<Location>>(() => HomeViewModel());