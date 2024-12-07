import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_search_location_app/ui/pages/detail/detail_page.dart';
import 'package:flutter_search_location_app/ui/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
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
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.grey, width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              location.title,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              location.category,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(location.roadAddress,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
