import 'package:flutter/material.dart';

class NestedScrollViewExample extends StatelessWidget {
  const NestedScrollViewExample({super.key});

  SliverList buildSliverList(int count) {
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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // 返回一个 Sliver 数组给外部可滚动组件。
          return <Widget>[
            SliverAppBar(
              title: const Text('嵌套ListView'),
              // pinned: true, // 固定在顶部
              floating: true, // 向下滚动时，是否隐藏标题
              snap: true, // 与 floating 结合使用`
              forceElevated: innerBoxIsScrolled,
            ),
            buildSliverList(5), //构建一个 sliverList
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: const ClampingScrollPhysics(), //重要
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
