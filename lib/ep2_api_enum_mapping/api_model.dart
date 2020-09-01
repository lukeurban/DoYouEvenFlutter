class ApiModel {
  final int id;
  final String name;
  final ApiModelStatus status;
  ApiModel({
    this.id,
    this.name,
    this.status,
  });

  ApiModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = ResponseApiModelStatusMap[json['status']];
}

class ApiModel2 {
  final int id;
  final String name;
  final String status;
  ApiModel2({
    this.id,
    this.name,
    this.status,
  });

  ApiModel2.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'];
}

enum ApiModelStatus {
  Success,
  Error,
  Warnring,
}

const Map<String, ApiModelStatus> ResponseApiModelStatusMap = {
  'SUCCESS': ApiModelStatus.Success,
  'ERROR': ApiModelStatus.Error,
  'WARNRING': ApiModelStatus.Warnring,
};

const Map<ApiModelStatus, String> RequestApiModelStatusMap = {
  ApiModelStatus.Success: 'SUCCESS',
  ApiModelStatus.Error: 'ERROR',
  ApiModelStatus.Warnring: 'WARNRING',
};
