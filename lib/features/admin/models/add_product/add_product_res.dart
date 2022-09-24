/// success : true
/// message : "Product added"
/// name : "sas"
/// description : "this"
/// images : ["  "," "]
/// quantity : 20
/// price : 2
/// category : "ss"
/// _id : "632aeb2e35b255baaa7334e8"
/// __v : 0

class AddProductRes {
  AddProductRes({
      bool? success, 
      String? message, 
      String? name, 
      String? description, 
      List<String>? images, 
      num? quantity, 
      num? price, 
      String? category, 
      String? id, 
      num? v,}){
    _success = success;
    _message = message;
    _name = name;
    _description = description;
    _images = images;
    _quantity = quantity;
    _price = price;
    _category = category;
    _id = id;
    _v = v;
}

  AddProductRes.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    _name = json['name'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _quantity = json['quantity'];
    _price = json['price'];
    _category = json['category'];
    _id = json['_id'];
    _v = json['__v'];
  }
  bool? _success;
  String? _message;
  String? _name;
  String? _description;
  List<String>? _images;
  num? _quantity;
  num? _price;
  String? _category;
  String? _id;
  num? _v;
AddProductRes copyWith({  bool? success,
  String? message,
  String? name,
  String? description,
  List<String>? images,
  num? quantity,
  num? price,
  String? category,
  String? id,
  num? v,
}) => AddProductRes(  success: success ?? _success,
  message: message ?? _message,
  name: name ?? _name,
  description: description ?? _description,
  images: images ?? _images,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  category: category ?? _category,
  id: id ?? _id,
  v: v ?? _v,
);
  bool? get success => _success;
  String? get message => _message;
  String? get name => _name;
  String? get description => _description;
  List<String>? get images => _images;
  num? get quantity => _quantity;
  num? get price => _price;
  String? get category => _category;
  String? get id => _id;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    map['name'] = _name;
    map['description'] = _description;
    map['images'] = _images;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['category'] = _category;
    map['_id'] = _id;
    map['__v'] = _v;
    return map;
  }

}