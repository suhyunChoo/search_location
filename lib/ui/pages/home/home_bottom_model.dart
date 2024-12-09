import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeBottomModel extends AutoDisposeNotifier<int>{
  @override
  int build() {
    return 0;
  }

  void onIndexChanged(int newIndex){
    state = newIndex;
  }
}
final homeBottomModel = NotifierProvider.autoDispose<HomeBottomModel, int>((){
  return HomeBottomModel();
});