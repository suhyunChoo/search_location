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


}

final homeViewModel = NotifierProvider.autoDispose<HomeViewModel,List<Location>>(() => HomeViewModel());