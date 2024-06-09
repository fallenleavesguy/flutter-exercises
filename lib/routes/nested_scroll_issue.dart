// 演示滚动视图嵌套问题, 滑动到底再滑动容易有问题

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NestedScrollIssue extends StatelessWidget {
  const NestedScrollIssue({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(), // TRY THIS: Change to NeverScrollableScrollPhysics() and see what happens
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('SliverAppBar'),
            // pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/2.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('哈哈 $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
