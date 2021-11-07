class AddressModel2 {
  Response? response;

  AddressModel2({this.response});

  AddressModel2.fromJson(Map<String, dynamic> json) {
    this.response =
        json["response"] == null ? null : Response.fromJson(json["response"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) data["response"] = this.response!.toJson();
    return data;
  }
}

class Response {
  String? status;
  Input? input;
  Refined? refined;
  Result? result;

  Response({this.status, this.input, this.refined, this.result});

  Response.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    input = json["input"] == null ? null : Input.fromJson(json["input"]);
    refined =
        json["refined"] == null ? null : Refined.fromJson(json["refined"]);
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (input != null) data["input"] = input!.toJson();
    if (refined != null) data["refined"] = refined!.toJson();
    if (result != null) data["result"] = result!.toJson();
    return data;
  }
}

class Result {
  String? crs;
  Point? point;

  Result({this.crs, this.point});

  Result.fromJson(Map<String, dynamic> json) {
    crs = json["crs"];
    point = json["point"] == null ? null : Point.fromJson(json["point"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["crs"] = crs;
    if (point != null) data["point"] = point!.toJson();
    return data;
  }
}

class Point {
  String? x;
  String? y;

  Point({this.x, this.y});

  Point.fromJson(Map<String, dynamic> json) {
    x = json["x"];
    y = json["y"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["x"] = x;
    data["y"] = y;
    return data;
  }
}

class Refined {
  String? text;
  Structure? structure;

  Refined({this.text, this.structure});

  Refined.fromJson(Map<String, dynamic> json) {
    text = json["text"];
    structure = json["structure"] == null
        ? null
        : Structure.fromJson(json["structure"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["text"] = text;
    if (structure != null) data["structure"] = structure!.toJson();
    return data;
  }
}

class Structure {
  String? level0;
  String? level1;
  String? level2;
  String? level3;
  String? level4L;
  String? level4Lc;
  String? level4A;
  String? level4Ac;
  String? level5;
  String? detail;

  Structure(
      {this.level0,
      this.level1,
      this.level2,
      this.level3,
      this.level4L,
      this.level4Lc,
      this.level4A,
      this.level4Ac,
      this.level5,
      this.detail});

  Structure.fromJson(Map<String, dynamic> json) {
    level0 = json["level0"];
    level1 = json["level1"];
    level2 = json["level2"];
    level3 = json["level3"];
    level4L = json["level4L"];
    level4Lc = json["level4LC"];
    level4A = json["level4A"];
    level4Ac = json["level4AC"];
    level5 = json["level5"];
    detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["level0"] = level0;
    data["level1"] = level1;
    data["level2"] = level2;
    data["level3"] = level3;
    data["level4L"] = level4L;
    data["level4LC"] = level4Lc;
    data["level4A"] = level4A;
    data["level4AC"] = level4Ac;
    data["level5"] = level5;
    data["detail"] = detail;
    return data;
  }
}

class Input {
  String? type;
  String? address;

  Input({this.type, this.address});

  Input.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    address = json["address"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    data["address"] = address;
    return data;
  }
}

// class Service {
//   String name;
//   String version;
//   String operation;
//   String time;

//   Service({this.name, this.version, this.operation, this.time});

//   Service.fromJson(Map<String, dynamic> json) {
//     this.name = json["name"];
//     this.version = json["version"];
//     this.operation = json["operation"];
//     this.time = json["time"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["name"] = this.name;
//     data["version"] = this.version;
//     data["operation"] = this.operation;
//     data["time"] = this.time;
//     return data;
//   }
// }