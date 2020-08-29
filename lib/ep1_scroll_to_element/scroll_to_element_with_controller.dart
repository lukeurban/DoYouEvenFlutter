import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ScrollToElementWithController extends StatefulWidget {
  static const route = '/scroll_to_element_with_scroll_controller';

  ScrollToElementWithController({Key key}) : super(key: key);

  @override
  _ScrollToElementWithControllerState createState() => _ScrollToElementWithControllerState();
}

class _ScrollToElementWithControllerState extends State<ScrollToElementWithController> {
  final ScrollController scrollController = ScrollController();
  List<ListItem> list;
  @override
  void initState() {
    super.initState();
    List<int> intList = [];
    for (int i = 0; i < 100; ++i) {
      intList.add(i);
    }
    list = intList.map((element) => ListItem(index: element)).toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(60.0 * 70,
          curve: Curves.linear, duration: Duration(milliseconds: 500));
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('DoYouEvenFlutter'),
            Text('EP.1 - Scroll to Element in list'),
          ],
        )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: list
                  .map((element) => Container(
                        height: 60,
                        child: Center(
                          child: Text(element.index.toString()),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Random random = new Random();
          int randomNumber = random.nextInt(100);
          scrollController.animateTo(
            60.0 * randomNumber,
            curve: Curves.linear,
            duration: Duration(milliseconds: 500),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListItem {
  final int index;
  ListItem({
    this.index,
  });
}
