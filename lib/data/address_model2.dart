/// status : "OK"
/// input : {"type":"road","address":"효령로72길 60"}
/// refined : {"text":"서울특별시 서초구 효령로72길 60 (서초동)","structure":{"level0":"대한민국","level1":"서울특별시","level2":"서초구","level3":"서초동","level4L":"효령로72길","level4LC":"","level4A":"서초2동","level4AC":"1165052000","level5":"60","detail":"한전아트센터"}}
/// result : {"crs":"EPSG:4326","point":{"x":"127.027975025","y":"37.485553169"}}

class AddressModel2 {
  AddressModel2({
    String? status,
    Input? input,
    Refined? refined,
    // Result? result,
  }) {
    _status = status;
    _input = input;
    _refined = refined;
    // _result = result;
  }

  AddressModel2.fromJson(dynamic json) {
    _status = json['status'];
    _input = json['input'] != null ? Input.fromJson(json['input']) : null;
    _refined =
        json['refined'] != null ? Refined.fromJson(json['refined']) : null;
    // _result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
  String? _status;
  Input? _input;
  Refined? _refined;
  // Result? _result;

  String? get status => _status;
  Input? get input => _input;
  Refined? get refined => _refined;
  // Result? get result => _result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_input != null) {
      map['input'] = _input?.toJson();
    }
    if (_refined != null) {
      map['refined'] = _refined?.toJson();
    }
    // if (_result != null) {
    //   map['result'] = _result?.toJson();
    // }
    return map;
  }
}

/// crs : "EPSG:4326"
/// point : {"x":"127.027975025","y":"37.485553169"}

// class Result {
//   Result({
//     String? crs,
//     Point? point,
//   }) {
//     _crs = crs;
//     _point = point;
//   }

//   Result.fromJson(dynamic json) {
//     _crs = json['crs'];
//     _point = json['point'] != null ? Point.fromJson(json['point']) : null;
//   }
//   String? _crs;
//   Point? _point;

//   String? get crs => _crs;
//   Point? get point => _point;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['crs'] = _crs;
//     if (_point != null) {
//       map['point'] = _point?.toJson();
//     }
//     return map;
//   }
// }

/// x : "127.027975025"
/// y : "37.485553169"

class Point {
  Point({
    String? x,
    String? y,
  }) {
    _x = x;
    _y = y;
  }

  Point.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
  }
  String? _x;
  String? _y;

  String? get x => _x;
  String? get y => _y;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    return map;
  }
}

/// text : "서울특별시 서초구 효령로72길 60 (서초동)"
/// structure : {"level0":"대한민국","level1":"서울특별시","level2":"서초구","level3":"서초동","level4L":"효령로72길","level4LC":"","level4A":"서초2동","level4AC":"1165052000","level5":"60","detail":"한전아트센터"}

class Refined {
  Refined({
    String? text,
    Structure? structure,
  }) {
    _text = text;
    _structure = structure;
  }

  Refined.fromJson(dynamic json) {
    _text = json['text'];
    _structure = json['structure'] != null
        ? Structure.fromJson(json['structure'])
        : null;
  }
  String? _text;
  Structure? _structure;

  String? get text => _text;
  Structure? get structure => _structure;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    if (_structure != null) {
      map['structure'] = _structure?.toJson();
    }
    return map;
  }
}

/// level0 : "대한민국"
/// level1 : "서울특별시"
/// level2 : "서초구"
/// level3 : "서초동"
/// level4L : "효령로72길"
/// level4LC : ""
/// level4A : "서초2동"
/// level4AC : "1165052000"
/// level5 : "60"
/// detail : "한전아트센터"

class Structure {
  Structure({
    String? level0,
    String? level1,
    String? level2,
    String? level3,
    String? level4L,
    String? level4LC,
    String? level4A,
    String? level4AC,
    String? level5,
    String? detail,
  }) {
    _level0 = level0;
    _level1 = level1;
    _level2 = level2;
    _level3 = level3;
    _level4L = level4L;
    _level4LC = level4LC;
    _level4A = level4A;
    _level4AC = level4AC;
    _level5 = level5;
    _detail = detail;
  }

  Structure.fromJson(dynamic json) {
    _level0 = json['level0'];
    _level1 = json['level1'];
    _level2 = json['level2'];
    _level3 = json['level3'];
    _level4L = json['level4L'];
    _level4LC = json['level4LC'];
    _level4A = json['level4A'];
    _level4AC = json['level4AC'];
    _level5 = json['level5'];
    _detail = json['detail'];
  }
  String? _level0;
  String? _level1;
  String? _level2;
  String? _level3;
  String? _level4L;
  String? _level4LC;
  String? _level4A;
  String? _level4AC;
  String? _level5;
  String? _detail;

  String? get level0 => _level0;
  String? get level1 => _level1;
  String? get level2 => _level2;
  String? get level3 => _level3;
  String? get level4L => _level4L;
  String? get level4LC => _level4LC;
  String? get level4A => _level4A;
  String? get level4AC => _level4AC;
  String? get level5 => _level5;
  String? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['level0'] = _level0;
    map['level1'] = _level1;
    map['level2'] = _level2;
    map['level3'] = _level3;
    map['level4L'] = _level4L;
    map['level4LC'] = _level4LC;
    map['level4A'] = _level4A;
    map['level4AC'] = _level4AC;
    map['level5'] = _level5;
    map['detail'] = _detail;
    return map;
  }
}

/// type : "road"
/// address : "효령로72길 60"

class Input {
  Input({
    String? type,
    String? address,
  }) {
    _type = type;
    _address = address;
  }

  Input.fromJson(dynamic json) {
    _type = json['type'];
    _address = json['address'];
  }
  String? _type;
  String? _address;

  String? get type => _type;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['address'] = _address;
    return map;
  }
}
