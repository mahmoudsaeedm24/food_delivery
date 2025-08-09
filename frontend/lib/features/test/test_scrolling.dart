import 'dart:developer';

import 'package:flutter/material.dart';

class TestScrolling extends StatefulWidget {
  const TestScrolling({super.key});

  @override
  State<TestScrolling> createState() => _TestScrollingState();
}

class _TestScrollingState extends State<TestScrolling> {
  final List<String> _items = List.generate(20, (index) => 'Item $index');
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        setState(() {
          log("get more data");
          _items.addAll(List.generate(20, (index) => 'Item $index'));
        });
      }

      
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      controller: controller,
      itemBuilder: (context, index) {
        return ListTile(title: Text(_items[index]));
      },
    );
  }
}
