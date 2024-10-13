// ignore_for_file: file_names
import 'dart:convert';

OrderCancelByUserModel ordercancelByUserModelFromJson(String str) =>
    OrderCancelByUserModel.fromJson(json.decode(str));

String ordercancelByUserModelToJson(OrderCancelByUserModel data) => json.encode(data.toJson());

class OrderCancelByUserModel {
  OrderCancelByUserModel({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  OrderCancelByUserModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? _status;
  String? _message;
  Data? _data;

  OrderCancelByUserModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      OrderCancelByUserModel(
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
    ShippingAddress? shippingAddress,
    PromoCode? promoCode,
    String? id,
    String? orderId,
    String? userId,
    List<Items>? items,
    int? purchasedTimeadminCommissionCharges,
    int? totalQuantity,
    int? totalItems,
    int? totalShippingCharges,
    int? discount,
    int? subTotal,
    int? total,
    int? finalTotal,
    String? paymentGateway,
    String? createdAt,
    String? updatedAt,
  }) {
    _shippingAddress = shippingAddress;
    _promoCode = promoCode;
    _id = id;
    _orderId = orderId;
    _userId = userId;
    _items = items;
    _purchasedTimeadminCommissionCharges = purchasedTimeadminCommissionCharges;
    _totalQuantity = totalQuantity;
    _totalItems = totalItems;
    _totalShippingCharges = totalShippingCharges;
    _discount = discount;
    _subTotal = subTotal;
    _total = total;
    _finalTotal = finalTotal;
    _paymentGateway = paymentGateway;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    _promoCode = json['promoCode'] != null ? PromoCode.fromJson(json['promoCode']) : null;
    _id = json['_id'];
    _orderId = json['orderId'];
    _userId = json['userId'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
    _purchasedTimeadminCommissionCharges = json['purchasedTimeadminCommissionCharges'];
    _totalQuantity = json['totalQuantity'];
    _totalItems = json['totalItems'];
    _totalShippingCharges = json['totalShippingCharges'];
    _discount = json['discount'];
    _subTotal = json['subTotal'];
    _total = json['total'];
    _finalTotal = json['finalTotal'];
    _paymentGateway = json['paymentGateway'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  ShippingAddress? _shippingAddress;
  PromoCode? _promoCode;
  String? _id;
  String? _orderId;
  String? _userId;
  List<Items>? _items;
  int? _purchasedTimeadminCommissionCharges;
  int? _totalQuantity;
  int? _totalItems;
  int? _totalShippingCharges;
  int? _discount;
  int? _subTotal;
  int? _total;
  int? _finalTotal;
  String? _paymentGateway;
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    ShippingAddress? shippingAddress,
    PromoCode? promoCode,
    String? id,
    String? orderId,
    String? userId,
    List<Items>? items,
    int? purchasedTimeadminCommissionCharges,
    int? totalQuantity,
    int? totalItems,
    int? totalShippingCharges,
    int? discount,
    int? subTotal,
    int? total,
    int? finalTotal,
    String? paymentGateway,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        shippingAddress: shippingAddress ?? _shippingAddress,
        promoCode: promoCode ?? _promoCode,
        id: id ?? _id,
        orderId: orderId ?? _orderId,
        userId: userId ?? _userId,
        items: items ?? _items,
        purchasedTimeadminCommissionCharges:
            purchasedTimeadminCommissionCharges ?? _purchasedTimeadminCommissionCharges,
        totalQuantity: totalQuantity ?? _totalQuantity,
        totalItems: totalItems ?? _totalItems,
        totalShippingCharges: totalShippingCharges ?? _totalShippingCharges,
        discount: discount ?? _discount,
        subTotal: subTotal ?? _subTotal,
        total: total ?? _total,
        finalTotal: finalTotal ?? _finalTotal,
        paymentGateway: paymentGateway ?? _paymentGateway,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  ShippingAddress? get shippingAddress => _shippingAddress;

  PromoCode? get promoCode => _promoCode;

  String? get id => _id;

  String? get orderId => _orderId;

  String? get userId => _userId;

  List<Items>? get items => _items;

  int? get purchasedTimeadminCommissionCharges => _purchasedTimeadminCommissionCharges;

  int? get totalQuantity => _totalQuantity;

  int? get totalItems => _totalItems;

  int? get totalShippingCharges => _totalShippingCharges;

  int? get discount => _discount;

  int? get subTotal => _subTotal;

  int? get total => _total;

  int? get finalTotal => _finalTotal;

  String? get paymentGateway => _paymentGateway;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_shippingAddress != null) {
      map['shippingAddress'] = _shippingAddress?.toJson();
    }
    if (_promoCode != null) {
      map['promoCode'] = _promoCode?.toJson();
    }
    map['_id'] = _id;
    map['orderId'] = _orderId;
    map['userId'] = _userId;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['purchasedTimeadminCommissionCharges'] = _purchasedTimeadminCommissionCharges;
    map['totalQuantity'] = _totalQuantity;
    map['totalItems'] = _totalItems;
    map['totalShippingCharges'] = _totalShippingCharges;
    map['discount'] = _discount;
    map['subTotal'] = _subTotal;
    map['total'] = _total;
    map['finalTotal'] = _finalTotal;
    map['paymentGateway'] = _paymentGateway;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    ProductId? productId,
    SellerId? sellerId,
    int? purchasedTimeProductPrice,
    int? purchasedTimeShippingCharges,
    String? productCode,
    int? productQuantity,
    List<AttributesArray>? attributesArray,
    int? commissionPerProductQuantity,
    dynamic deliveredServiceName,
    dynamic trackingId,
    dynamic trackingLink,
    String? id,
    String? status,
    String? date,
  }) {
    _productId = productId;
    _sellerId = sellerId;
    _purchasedTimeProductPrice = purchasedTimeProductPrice;
    _purchasedTimeShippingCharges = purchasedTimeShippingCharges;
    _productCode = productCode;
    _productQuantity = productQuantity;
    _attributesArray = attributesArray;
    _commissionPerProductQuantity = commissionPerProductQuantity;
    _deliveredServiceName = deliveredServiceName;
    _trackingId = trackingId;
    _trackingLink = trackingLink;
    _id = id;
    _status = status;
    _date = date;
  }

  Items.fromJson(dynamic json) {
    _productId = json['productId'] != null ? ProductId.fromJson(json['productId']) : null;
    _sellerId = json['sellerId'] != null ? SellerId.fromJson(json['sellerId']) : null;
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
    _commissionPerProductQuantity = json['commissionPerProductQuantity'];
    _deliveredServiceName = json['deliveredServiceName'];
    _trackingId = json['trackingId'];
    _trackingLink = json['trackingLink'];
    _id = json['_id'];
    _status = json['status'];
    _date = json['date'];
  }

  ProductId? _productId;
  SellerId? _sellerId;
  int? _purchasedTimeProductPrice;
  int? _purchasedTimeShippingCharges;
  String? _productCode;
  int? _productQuantity;
  List<AttributesArray>? _attributesArray;
  int? _commissionPerProductQuantity;
  dynamic _deliveredServiceName;
  dynamic _trackingId;
  dynamic _trackingLink;
  String? _id;
  String? _status;
  String? _date;

  Items copyWith({
    ProductId? productId,
    SellerId? sellerId,
    int? purchasedTimeProductPrice,
    int? purchasedTimeShippingCharges,
    String? productCode,
    int? productQuantity,
    List<AttributesArray>? attributesArray,
    int? commissionPerProductQuantity,
    dynamic deliveredServiceName,
    dynamic trackingId,
    dynamic trackingLink,
    String? id,
    String? status,
    String? date,
  }) =>
      Items(
        productId: productId ?? _productId,
        sellerId: sellerId ?? _sellerId,
        purchasedTimeProductPrice: purchasedTimeProductPrice ?? _purchasedTimeProductPrice,
        purchasedTimeShippingCharges: purchasedTimeShippingCharges ?? _purchasedTimeShippingCharges,
        productCode: productCode ?? _productCode,
        productQuantity: productQuantity ?? _productQuantity,
        attributesArray: attributesArray ?? _attributesArray,
        commissionPerProductQuantity: commissionPerProductQuantity ?? _commissionPerProductQuantity,
        deliveredServiceName: deliveredServiceName ?? _deliveredServiceName,
        trackingId: trackingId ?? _trackingId,
        trackingLink: trackingLink ?? _trackingLink,
        id: id ?? _id,
        status: status ?? _status,
        date: date ?? _date,
      );

  ProductId? get productId => _productId;

  SellerId? get sellerId => _sellerId;

  int? get purchasedTimeProductPrice => _purchasedTimeProductPrice;

  int? get purchasedTimeShippingCharges => _purchasedTimeShippingCharges;

  String? get productCode => _productCode;

  int? get productQuantity => _productQuantity;

  List<AttributesArray>? get attributesArray => _attributesArray;

  int? get commissionPerProductQuantity => _commissionPerProductQuantity;

  dynamic get deliveredServiceName => _deliveredServiceName;

  dynamic get trackingId => _trackingId;

  dynamic get trackingLink => _trackingLink;

  String? get id => _id;

  String? get status => _status;

  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_productId != null) {
      map['productId'] = _productId?.toJson();
    }
    if (_sellerId != null) {
      map['sellerId'] = _sellerId?.toJson();
    }
    map['purchasedTimeProductPrice'] = _purchasedTimeProductPrice;
    map['purchasedTimeShippingCharges'] = _purchasedTimeShippingCharges;
    map['productCode'] = _productCode;
    map['productQuantity'] = _productQuantity;
    if (_attributesArray != null) {
      map['attributesArray'] = _attributesArray?.map((v) => v.toJson()).toList();
    }
    map['commissionPerProductQuantity'] = _commissionPerProductQuantity;
    map['deliveredServiceName'] = _deliveredServiceName;
    map['trackingId'] = _trackingId;
    map['trackingLink'] = _trackingLink;
    map['_id'] = _id;
    map['status'] = _status;
    map['date'] = _date;
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

SellerId sellerIdFromJson(String str) => SellerId.fromJson(json.decode(str));

String sellerIdToJson(SellerId data) => json.encode(data.toJson());

class SellerId {
  SellerId({
    String? id,
    String? firstName,
    String? lastName,
    String? businessName,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _businessName = businessName;
  }

  SellerId.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _businessName = json['businessName'];
  }

  String? _id;
  String? _firstName;
  String? _lastName;
  String? _businessName;

  SellerId copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? businessName,
  }) =>
      SellerId(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        businessName: businessName ?? _businessName,
      );

  String? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get businessName => _businessName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['businessName'] = _businessName;
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

PromoCode promoCodeFromJson(String str) => PromoCode.fromJson(json.decode(str));

String promoCodeToJson(PromoCode data) => json.encode(data.toJson());

class PromoCode {
  PromoCode({
    dynamic promoCode,
    dynamic discountType,
    dynamic discountAmount,
    List<String>? conditions,
  }) {
    _promoCode = promoCode;
    _discountType = discountType;
    _discountAmount = discountAmount;
    _conditions = conditions;
  }

  PromoCode.fromJson(dynamic json) {
    _promoCode = json['promoCode'];
    _discountType = json['discountType'];
    _discountAmount = json['discountAmount'];
    _conditions = json['conditions'] != null ? json['conditions'].cast<String>() : [];
  }

  dynamic _promoCode;
  dynamic _discountType;
  dynamic _discountAmount;
  List<String>? _conditions;

  PromoCode copyWith({
    dynamic promoCode,
    dynamic discountType,
    dynamic discountAmount,
    List<String>? conditions,
  }) =>
      PromoCode(
        promoCode: promoCode ?? _promoCode,
        discountType: discountType ?? _discountType,
        discountAmount: discountAmount ?? _discountAmount,
        conditions: conditions ?? _conditions,
      );

  dynamic get promoCode => _promoCode;

  dynamic get discountType => _discountType;

  dynamic get discountAmount => _discountAmount;

  List<String>? get conditions => _conditions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['promoCode'] = _promoCode;
    map['discountType'] = _discountType;
    map['discountAmount'] = _discountAmount;
    map['conditions'] = _conditions;
    return map;
  }
}

ShippingAddress shippingAddressFromJson(String str) => ShippingAddress.fromJson(json.decode(str));

String shippingAddressToJson(ShippingAddress data) => json.encode(data.toJson());

class ShippingAddress {
  ShippingAddress({
    String? name,
    String? country,
    String? state,
    String? city,
    int? zipCode,
    String? address,
  }) {
    _name = name;
    _country = country;
    _state = state;
    _city = city;
    _zipCode = zipCode;
    _address = address;
  }

  ShippingAddress.fromJson(dynamic json) {
    _name = json['name'];
    _country = json['country'];
    _state = json['state'];
    _city = json['city'];
    _zipCode = json['zipCode'];
    _address = json['address'];
  }

  String? _name;
  String? _country;
  String? _state;
  String? _city;
  int? _zipCode;
  String? _address;

  ShippingAddress copyWith({
    String? name,
    String? country,
    String? state,
    String? city,
    int? zipCode,
    String? address,
  }) =>
      ShippingAddress(
        name: name ?? _name,
        country: country ?? _country,
        state: state ?? _state,
        city: city ?? _city,
        zipCode: zipCode ?? _zipCode,
        address: address ?? _address,
      );

  String? get name => _name;

  String? get country => _country;

  String? get state => _state;

  String? get city => _city;

  int? get zipCode => _zipCode;

  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['country'] = _country;
    map['state'] = _state;
    map['city'] = _city;
    map['zipCode'] = _zipCode;
    map['address'] = _address;
    return map;
  }
}
