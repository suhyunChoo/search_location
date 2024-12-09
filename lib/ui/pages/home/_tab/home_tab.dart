import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/core/geolocator_helper.dart';
import 'package:flutter_search_location_app/ui/pages/detail/detail_page.dart';
import 'package:flutter_search_location_app/ui/pages/home/model/home_view_model.dart';
import 'package:flutter_search_location_app/ui/pages/home/widgets/search_result_widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Consumer(builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () async {
                    final position = await GeolocatorHelper.getPositon();
                    if (position != null) {
                      print(
                          'lat:${position.latitude} lng:${position.longitude}');
                      final viewModel = ref.read(homeViewModel.notifier);
                      viewModel.searchByLocation(
                          position.longitude, position.latitude);
                    }
                  },
                  child: Icon(Icons.gps_fixed),
                );
              }),
            ),
          ],
          title: Consumer(builder: (context, ref, child) {
            return TextField(
              onSubmitted: (value) {
                if (value.trim().isNotEmpty) {
                  ref.read(homeViewModel.notifier).search(value);
                }
              },
              decoration: InputDecoration(
                hintText: '삼성동',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              ),
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(builder: (context, ref, child) {
            final state = ref.watch(homeViewModel);
            return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final location = state[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        if (location.link != "") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(location.link);
                          }));
                        } else {
                          //링크가 없다고 알려주기
                          showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                    content: Text('연결된 링크가 없습니다.'),
                                    actions: [
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context); //다이얼로그 닫기
                                        },
                                        child: const Text(
                                          '확인',
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                      )
                                    ]);
                              });
                        }
                      },
                      child: searchResultWidget(location),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
