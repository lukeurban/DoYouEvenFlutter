import 'package:DoYouEvenFlutter/ep2_api_enum_mapping/api_model.dart';
import 'package:flutter/material.dart';

class ApiEnumMapping extends StatefulWidget {
  static const route = '/api_enum_mapping';

  const ApiEnumMapping({Key key}) : super(key: key);

  @override
  _ApiEnumMappingState createState() => _ApiEnumMappingState();
}

class _ApiEnumMappingState extends State<ApiEnumMapping> {
  List<Map<String, dynamic>> responseMock = [
    {
      'id': 1,
      'name': 'THE BUG',
      'brand': 'VW',
    },
    {
      'id': 2,
      'name': 'A car',
      'brand': 'BMW',
    },
    {
      'id': 3,
      'name': 'Another car',
      'brand': 'MERCEDES',
    },
    {
      'id': 4,
      'name': 'Another car',
      'brand': 'TESLA',
    },
    {
      'id': 5,
      'name': 'Another car',
      'brand': 'FORD',
    }
  ];

  Widget buildModelV1View() {
    List<Car> modelV1 = responseMock.map((jsonData) => Car.fromJson(jsonData)).toList();

    TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 20);
    return Container(
      width: double.infinity,
      child: Column(
        children: modelV1
            .map((model) => Expanded(
                  child: Container(
                    width: double.infinity,
                    color: modelV1BgColor(model),
                    child: Center(
                      child: Text(
                        model.name,
                        style: textStyle,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget buildModelV2View() {
    List<Car2> modelV2 = responseMock.map((jsonData) => Car2.fromJson(jsonData)).toList();
    TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 20);
    return Container(
      width: double.infinity,
      child: Column(
        children: modelV2
            .map((model) => Expanded(
                  child: Container(
                    width: double.infinity,
                    color: modelV2BgColor(model),
                    child: Center(
                      child: Text(
                        model.name,
                        style: textStyle,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Color modelV2BgColor(Car2 model) {
    Color color;
    switch (model.brand) {
      case 'VOLVO':
        color = Colors.green;
        break;
      case 'MERCEDES':
        color = Colors.red;
        break;
      case 'BMW':
        color = Colors.purple;
        break;
      case 'TESLA':
        color = Colors.cyan;
        break;
      case 'FORD':
        color = Colors.orange;
        break;
      case 'VW':
        color = Colors.grey;
        break;
      default:
        color = Colors.transparent;
    }
    return color;
  }

  Color modelV1BgColor(Car model) {
    Color color;
    switch (model.brand) {
      case CarBrand.Volvo:
        color = Colors.green;
        break;
      case CarBrand.Mercedes:
        color = Colors.red;
        break;
      case CarBrand.BMW:
        color = Colors.purple;
        break;
      case CarBrand.Tesla:
        color = Colors.cyan;
        break;
      case CarBrand.Ford:
        color = Colors.orange;
        break;
      case CarBrand.VW:
        color = Colors.grey;
        break;
      default:
        color = Colors.transparent;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.thumb_down)),
              Tab(icon: Icon(Icons.thumb_up)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildModelV2View(),
            buildModelV1View(),
          ],
        ),
      ),
    );
  }
}
