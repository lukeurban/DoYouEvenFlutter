import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class ScrollToElement extends StatefulWidget {
  static const route = '/scroll_to_element';

  ScrollToElement({Key key}) : super(key: key);

  @override
  _ScrollToElementState createState() => _ScrollToElementState();
}

class _ScrollToElementState extends State<ScrollToElement> {
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
      ListItem item = list.elementAt(70);
      Scrollable.ensureVisible(item.itemKey.currentContext);
    });
  }

  @override
  void dispose() {
    super.dispose();
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
            child: Column(
              children: list
                  .map((element) => Container(
                        key: element.itemKey,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        height: new Random().nextInt(80) + 20.0,
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
          ListItem item = list.elementAt(randomNumber);
          Scrollable.ensureVisible(item.itemKey.currentContext);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListItem {
  final GlobalKey itemKey = GlobalKey();
  final int index;
  ListItem({
    this.index,
  });
}
