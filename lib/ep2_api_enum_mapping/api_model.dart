class Car {
  final int id;
  final String name;
  final CarBrand brand;
  Car({
    this.id,
    this.name,
    this.brand,
  });

  Car.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        brand = ResponseCarBrandMap[json['brand']];
}

class Car2 {
  final int id;
  final String name;
  final String brand;
  Car2({
    this.id,
    this.name,
    this.brand,
  });

  Car2.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        brand = json['brand'];
}

enum CarBrand {
  Volvo,
  Mercedes,
  BMW,
  Tesla,
  Ford,
  VW,
}

const Map<String, CarBrand> ResponseCarBrandMap = {
  'VOLVO': CarBrand.Volvo,
  'MERCEDES': CarBrand.Mercedes,
  'BMW': CarBrand.BMW,
  'TESLA': CarBrand.Tesla,
  'FORD': CarBrand.Ford,
  'VW': CarBrand.VW,
};

const Map<CarBrand, String> RequestCarBrandMap = {
  CarBrand.Volvo: 'VOLVO',
  CarBrand.Mercedes: 'MERCEDES',
  CarBrand.BMW: 'BMW',
  CarBrand.Tesla: 'TESLA',
  CarBrand.Ford: 'FORD',
  CarBrand.VW: 'VW',
};
