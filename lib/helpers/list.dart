import 'package:flutter/material.dart';

Widget buildSliverList(int count) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('SliverList Item $index')),
          );
        },
        childCount: count,
      ),
    );
  }
