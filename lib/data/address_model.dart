// class AddressModel {
//   Response? response;

//   AddressModel({this.response});

//   AddressModel.fromJson(Map<String, dynamic> json) {
//     if (json["response"] is Map) {
//       response =
//           json["response"] == null ? null : Response.fromJson(json["response"]);
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (response != null) {
//       data["response"] = response!.toJson();
//     }
//     return data;
//   }
// }

class AddressModel {
  Page? page;
  Result? result;

  AddressModel({this.page, this.result});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json["page"] is Map) {
      page = json["page"] == null ? null : Page.fromJson(json["page"]);
    }
    if (json["result"] is Map) {
      result = json["result"] == null ? null : Result.fromJson(json["result"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) {
      data["page"] = page!.toJson();
    }
    if (result != null) {
      data["result"] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? crs;
  String? type;
  List<Items>? items;

  Result({this.crs, this.type, this.items});

  Result.fromJson(Map<String, dynamic> json) {
    if (json["crs"] is String) {
      crs = json["crs"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["items"] is List) {
      items = json["items"] == null
          ? null
          : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["crs"] = crs;
    data["type"] = type;
    if (items != null) {
      data["items"] = items!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  Address? address;
  Point? point;

  Items({this.id, this.address, this.point});

  Items.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["address"] is Map) {
      address =
          json["address"] == null ? null : Address.fromJson(json["address"]);
    }
    if (json["point"] is Map) {
      point = json["point"] == null ? null : Point.fromJson(json["point"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (address != null) {
      data["address"] = address!.toJson();
    }
    if (point != null) {
      data["point"] = point!.toJson();
    }
    return data;
  }
}

class Point {
  String? x;
  String? y;

  Point({this.x, this.y});

  Point.fromJson(Map<String, dynamic> json) {
    if (json["x"] is String) {
      x = json["x"];
    }
    if (json["y"] is String) {
      y = json["y"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["x"] = x;
    data["y"] = y;
    return data;
  }
}

class Address {
  String? zipcode;
  String? category;
  String? road;
  String? parcel;
  String? bldnm;
  String? bldnmdc;

  Address(
      {this.zipcode,
      this.category,
      this.road,
      this.parcel,
      this.bldnm,
      this.bldnmdc});

  Address.fromJson(Map<String, dynamic> json) {
    if (json["zipcode"] is String) {
      zipcode = json["zipcode"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
    if (json["road"] is String) {
      road = json["road"];
    }
    if (json["parcel"] is String) {
      parcel = json["parcel"];
    }
    if (json["bldnm"] is String) {
      bldnm = json["bldnm"];
    }
    if (json["bldnmdc"] is String) {
      bldnmdc = json["bldnmdc"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["zipcode"] = zipcode;
    data["category"] = category;
    data["road"] = road;
    data["parcel"] = parcel;
    data["bldnm"] = bldnm;
    data["bldnmdc"] = bldnmdc;
    return data;
  }
}

class Page {
  String? total;
  String? current;
  String? size;

  Page({this.total, this.current, this.size});

  Page.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) total = json["total"];
    if (json["current"] is String) current = json["current"];
    if (json["size"] is String) size = json["size"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["current"] = current;
    data["size"] = size;
    return data;
  }
}

class Record {
  String? total;
  String? current;

  Record({this.total, this.current});

  Record.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) total = json["total"];
    if (json["current"] is String) current = json["current"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["current"] = current;
    return data;
  }
}
