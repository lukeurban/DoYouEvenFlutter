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
      'name': 'This is Success message',
      'status': 'SUCCESS',
    },
    {
      'id': 1,
      'name': 'This is Error message',
      'status': 'ERROR',
    },
    {
      'id': 1,
      'name': 'This is Warnring message',
      'status': 'WARNRING',
    }
  ];

  Widget buildModelV1View() {
    List<ApiModel> modelV1 = responseMock.map((jsonData) => ApiModel.fromJson(jsonData)).toList();

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
    List<ApiModel2> modelV2 = responseMock.map((jsonData) => ApiModel2.fromJson(jsonData)).toList();
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

  Color modelV2BgColor(ApiModel2 model) {
    Color color;
    switch (model.status) {
      case 'SUCCESS':
        color = Colors.green;
        break;
      case 'ERROR':
        color = Colors.red;
        break;
      case 'WARNRING':
        color = Colors.orange;
        break;
      default:
        color = Colors.transparent;
    }
    return color;
  }

  Color modelV1BgColor(ApiModel model) {
    Color color;
    switch (model.status) {
      case ApiModelStatus.Success:
        color = Colors.green;
        break;
      case ApiModelStatus.Error:
        color = Colors.red;
        break;
      case ApiModelStatus.Warnring:
        color = Colors.orange;
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
