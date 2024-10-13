// ignore_for_file: file_names
import 'dart:convert';

GetAllCartProductsModel getAllCartProductsModelFromJson(String str) =>
    GetAllCartProductsModel.fromJson(json.decode(str));

String getAllCartProductsModelToJson(GetAllCartProductsModel data) => json.encode(data.toJson());

class GetAllCartProductsModel {
  GetAllCartProductsModel({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  GetAllCartProductsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  GetAllCartProductsModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      GetAllCartProductsModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get status => _status;

  String? get message => _message;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    int? totalShippingCharges,
    int? subTotal,
    int? total,
    int? finalTotal,
    int? totalItems,
    List<Items>? items,
    String? userId,
  }) {
    _id = id;
    _totalShippingCharges = totalShippingCharges;
    _subTotal = subTotal;
    _total = total;
    _finalTotal = finalTotal;
    _totalItems = totalItems;
    _items = items;
    _userId = userId;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _totalShippingCharges = json['totalShippingCharges'];
    _subTotal = json['subTotal'];
    _total = json['total'];
    _finalTotal = json['finalTotal'];
    _totalItems = json['totalItems'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _userId = json['userId'];
  }

  String? _id;
  int? _totalShippingCharges;
  int? _subTotal;
  int? _total;
  int? _finalTotal;
  int? _totalItems;
  List<Items>? _items;
  String? _userId;

  Data copyWith({
    String? id,
    int? totalShippingCharges,
    int? subTotal,
    int? total,
    int? finalTotal,
    int? totalItems,
    List<Items>? items,
    String? userId,
  }) =>
      Data(
        id: id ?? _id,
        totalShippingCharges: totalShippingCharges ?? _totalShippingCharges,
        subTotal: subTotal ?? _subTotal,
        total: total ?? _total,
        finalTotal: finalTotal ?? _finalTotal,
        totalItems: totalItems ?? _totalItems,
        items: items ?? _items,
        userId: userId ?? _userId,
      );

  String? get id => _id;

  int? get totalShippingCharges => _totalShippingCharges;

  int? get subTotal => _subTotal;

  int? get total => _total;

  int? get finalTotal => _finalTotal;

  int? get totalItems => _totalItems;

  List<Items>? get items => _items;

  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['totalShippingCharges'] = _totalShippingCharges;
    map['subTotal'] = _subTotal;
    map['total'] = _total;
    map['finalTotal'] = _finalTotal;
    map['totalItems'] = _totalItems;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['userId'] = _userId;
    return map;
  }
}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    ProductId? productId,
    String? sellerId,
    int? purchasedTimeProductPrice,
    int? purchasedTimeShippingCharges,
    String? productCode,
    int? productQuantity,
    List<AttributesArray>? attributesArray,
    String? id,
  }) {
    _productId = productId;
    _sellerId = sellerId;
    _purchasedTimeProductPrice = purchasedTimeProductPrice;
    _purchasedTimeShippingCharges = purchasedTimeShippingCharges;
    _productCode = productCode;
    _productQuantity = productQuantity;
    _attributesArray = attributesArray;
    _id = id;
  }

  Items.fromJson(dynamic json) {
    _productId = json['productId'] != null ? ProductId.fromJson(json['productId']) : null;
    _sellerId = json['sellerId'];
    _purchasedTimeProductPrice = json['purchasedTimeProductPrice'];
    _purchasedTimeShippingCharges = json['purchasedTimeShippingCharges'];
    _productCode = json['productCode'];
    _productQuantity = json['productQuantity'];
    if (json['attributesArray'] != null) {
      _attributesArray = [];
      json['attributesArray'].forEach((v) {
        _attributesArray?.add(AttributesArray.fromJson(v));
      });
    }
    _id = json['_id'];
  }

  ProductId? _productId;
  String? _sellerId;
  int? _purchasedTimeProductPrice;
  int? _purchasedTimeShippingCharges;
  String? _productCode;
  int? _productQuantity;
  List<AttributesArray>? _attributesArray;
  String? _id;

  Items copyWith({
    ProductId? productId,
    String? sellerId,
    int? purchasedTimeProductPrice,
    int? purchasedTimeShippingCharges,
    String? productCode,
    int? productQuantity,
    List<AttributesArray>? attributesArray,
    String? id,
  }) =>
      Items(
        productId: productId ?? _productId,
        sellerId: sellerId ?? _sellerId,
        purchasedTimeProductPrice: purchasedTimeProductPrice ?? _purchasedTimeProductPrice,
        purchasedTimeShippingCharges: purchasedTimeShippingCharges ?? _purchasedTimeShippingCharges,
        productCode: productCode ?? _productCode,
        productQuantity: productQuantity ?? _productQuantity,
        attributesArray: attributesArray ?? _attributesArray,
        id: id ?? _id,
      );

  ProductId? get productId => _productId;

  String? get sellerId => _sellerId;

  int? get purchasedTimeProductPrice => _purchasedTimeProductPrice;

  int? get purchasedTimeShippingCharges => _purchasedTimeShippingCharges;

  String? get productCode => _productCode;

  int? get productQuantity => _productQuantity;

  List<AttributesArray>? get attributesArray => _attributesArray;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_productId != null) {
      map['productId'] = _productId?.toJson();
    }
    map['sellerId'] = _sellerId;
    map['purchasedTimeProductPrice'] = _purchasedTimeProductPrice;
    map['purchasedTimeShippingCharges'] = _purchasedTimeShippingCharges;
    map['productCode'] = _productCode;
    map['productQuantity'] = _productQuantity;
    if (_attributesArray != null) {
      map['attributesArray'] = _attributesArray?.map((v) => v.toJson()).toList();
    }
    map['_id'] = _id;
    return map;
  }
}

AttributesArray attributesArrayFromJson(String str) => AttributesArray.fromJson(json.decode(str));

String attributesArrayToJson(AttributesArray data) => json.encode(data.toJson());

class AttributesArray {
  AttributesArray({
    String? name,
    String? value,
    String? id,
  }) {
    _name = name;
    _value = value;
    _id = id;
  }

  AttributesArray.fromJson(dynamic json) {
    _name = json['name'];
    _value = json['value'];
    _id = json['_id'];
  }

  String? _name;
  String? _value;
  String? _id;

  AttributesArray copyWith({
    String? name,
    String? value,
    String? id,
  }) =>
      AttributesArray(
        name: name ?? _name,
        value: value ?? _value,
        id: id ?? _id,
      );

  String? get name => _name;

  String? get value => _value;

  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['value'] = _value;
    map['_id'] = _id;
    return map;
  }
}

ProductId productIdFromJson(String str) => ProductId.fromJson(json.decode(str));

String productIdToJson(ProductId data) => json.encode(data.toJson());

class ProductId {
  ProductId({
    String? id,
    String? productName,
    String? mainImage,
  }) {
    _id = id;
    _productName = productName;
    _mainImage = mainImage;
  }

  ProductId.fromJson(dynamic json) {
    _id = json['_id'];
    _productName = json['productName'];
    _mainImage = json['mainImage'];
  }

  String? _id;
  String? _productName;
  String? _mainImage;

  ProductId copyWith({
    String? id,
    String? productName,
    String? mainImage,
  }) =>
      ProductId(
        id: id ?? _id,
        productName: productName ?? _productName,
        mainImage: mainImage ?? _mainImage,
      );

  String? get id => _id;

  String? get productName => _productName;

  String? get mainImage => _mainImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['productName'] = _productName;
    map['mainImage'] = _mainImage;
    return map;
  }
}