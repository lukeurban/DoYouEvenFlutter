import 'package:DoYouEvenFlutter/ep1_scroll_to_element/scroll_to_element.dart';
import 'package:DoYouEvenFlutter/ep1_scroll_to_element/scroll_to_element_with_controller.dart';
import 'package:DoYouEvenFlutter/ep2_api_enum_mapping/api_enum_mapping.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.route: (context) => HomeScreen(),
    ScrollToElement.route: (context) => ScrollToElement(),
    ScrollToElementWithController.route: (context) => ScrollToElementWithController(),
    ApiEnumMapping.route: (context) => ApiEnumMapping(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.route,
      routes: routes,
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const route = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('DoYouEvenFlutter')),
      ),
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: MyApp.routes.keys.where((route) => route != HomeScreen.route).map((route) {
              return ListTile(
                onTap: () => Navigator.of(context).pushNamed(route),
                title: Text(route),
              );
            }).toList(),
          ),
        )),
      ),
    );
  }
}
