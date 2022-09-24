/// success : true
/// message : "Products gotten"
/// data : [{"_id":"632b0dac1d6658dc24569baf","name":"Code","description":"Buy code from tams","images":["https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765928/Code%20/z7nkkdark9edfg7u7kx5.png","https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765930/Code%20/pyytcflb1wwi8qoelvdf.png","https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765931/Code%20/wupxz0izmwjoejwy5jfc.png"],"quantity":3,"price":200000,"category":"Mobile","__v":0}]

class GetProductsRes {
  GetProductsRes({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  GetProductsRes.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;
GetProductsRes copyWith({  bool? success,
  String? message,
  List<Data>? data,
}) => GetProductsRes(  success: success ?? _success,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "632b0dac1d6658dc24569baf"
/// name : "Code"
/// description : "Buy code from tams"
/// images : ["https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765928/Code%20/z7nkkdark9edfg7u7kx5.png","https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765930/Code%20/pyytcflb1wwi8qoelvdf.png","https://res.cloudinary.com/dxfwzjz4k/image/upload/v1663765931/Code%20/wupxz0izmwjoejwy5jfc.png"]
/// quantity : 3
/// price : 200000
/// category : "Mobile"
/// __v : 0

class Data {
  Data({
      String? id, 
      String? name, 
      String? description, 
      List<String>? images, 
      num? quantity, 
      num? price, 
      String? category, 
      num? v,}){
    _id = id;
    _name = name;
    _description = description;
    _images = images;
    _quantity = quantity;
    _price = price;
    _category = category;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _quantity = json['quantity'];
    _price = json['price'];
    _category = json['category'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  String? _description;
  List<String>? _images;
  num? _quantity;
  num? _price;
  String? _category;
  num? _v;
Data copyWith({  String? id,
  String? name,
  String? description,
  List<String>? images,
  num? quantity,
  num? price,
  String? category,
  num? v,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  images: images ?? _images,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  category: category ?? _category,
  v: v ?? _v,
);
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  List<String>? get images => _images;
  num? get quantity => _quantity;
  num? get price => _price;
  String? get category => _category;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['images'] = _images;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['category'] = _category;
    map['__v'] = _v;
    return map;
  }

}