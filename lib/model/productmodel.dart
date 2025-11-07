class Dimensions {
  num? width;
  num? height;
  num? depth;

  Dimensions({this.width, this.height, this.depth});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["width"] = width;
    map["height"] = height;
    map["depth"] = depth;
    return map;
  }

  Dimensions.fromJson(dynamic json){
    width = json["width"];
    height = json["height"];
    depth = json["depth"];
  }
}

class Reviews {
  num? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating, this.comment, this.date, this.reviewerName, this.reviewerEmail});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["rating"] = rating;
    map["comment"] = comment;
    map["date"] = date;
    map["reviewerName"] = reviewerName;
    map["reviewerEmail"] = reviewerEmail;
    return map;
  }

  Reviews.fromJson(dynamic json){
    rating = json["rating"];
    comment = json["comment"];
    date = json["date"];
    reviewerName = json["reviewerName"];
    reviewerEmail = json["reviewerEmail"];
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["barcode"] = barcode;
    map["qrCode"] = qrCode;
    return map;
  }

  Meta.fromJson(dynamic json){
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    barcode = json["barcode"];
    qrCode = json["qrCode"];
  }
}

class Products {
  num? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<String>? tagsList;
  String? brand;
  String? sku;
  num? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviewsList;
  String? returnPolicy;
  num? minimumOrderQuantity;
  Meta? meta;
  List<String>? imagesList;
  String? thumbnail;

  Products(
      {this.id, this.title, this.description, this.category, this.price, this.discountPercentage, this.rating, this.stock, this.tagsList, this.brand, this.sku, this.weight, this.dimensions, this.warrantyInformation, this.shippingInformation, this.availabilityStatus, this.reviewsList, this.returnPolicy, this.minimumOrderQuantity, this.meta, this.imagesList, this.thumbnail});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    map["category"] = category;
    map["price"] = price;
    map["discountPercentage"] = discountPercentage;
    map["rating"] = rating;
    map["stock"] = stock;
    map["tags"] = tagsList;
    map["brand"] = brand;
    map["sku"] = sku;
    map["weight"] = weight;
    if (dimensions != null) {
      map["dimensions"] = dimensions?.toJson();
    }
    map["warrantyInformation"] = warrantyInformation;
    map["shippingInformation"] = shippingInformation;
    map["availabilityStatus"] = availabilityStatus;
    if (reviewsList != null) {
      map["reviews"] = reviewsList?.map((v) => v.toJson()).toList();
    }
    map["returnPolicy"] = returnPolicy;
    map["minimumOrderQuantity"] = minimumOrderQuantity;
    if (meta != null) {
      map["meta"] = meta?.toJson();
    }
    map["images"] = imagesList;
    map["thumbnail"] = thumbnail;
    return map;
  }

  Products.fromJson(dynamic json){
    id = json["id"];
    title = json["title"];
    description = json["description"];
    category = json["category"];
    price = json["price"];
    discountPercentage = json["discountPercentage"];
    rating = json["rating"];
    stock = json["stock"];
    tagsList = json["tags"] != null ? json["tags"].cast<String>() : [];
    brand = json["brand"];
    sku = json["sku"];
    weight = json["weight"];
    dimensions =
    json["dimensions"] != null ? Dimensions.fromJson(json["dimensions"]) : null;
    warrantyInformation = json["warrantyInformation"];
    shippingInformation = json["shippingInformation"];
    availabilityStatus = json["availabilityStatus"];
    if (json["reviews"] != null) {
      reviewsList = [];
      json["reviews"].forEach((v) {
        reviewsList?.add(Reviews.fromJson(v));
      });
    }
    returnPolicy = json["returnPolicy"];
    minimumOrderQuantity = json["minimumOrderQuantity"];
    meta = json["meta"] != null ? Meta.fromJson(json["meta"]) : null;
    imagesList = json["images"] != null ? json["images"].cast<String>() : [];
    thumbnail = json["thumbnail"];
  }
}

class Productmodel {
  List<Products>? productsList;
  num? total;
  num? skip;
  num? limit;

  Productmodel({this.productsList, this.total, this.skip, this.limit});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productsList != null) {
      map["products"] = productsList?.map((v) => v.toJson()).toList();
    }
    map["total"] = total;
    map["skip"] = skip;
    map["limit"] = limit;
    return map;
  }

  Productmodel.fromJson(dynamic json){
    if (json["products"] != null) {
      productsList = [];
      json["products"].forEach((v) {
        productsList?.add(Products.fromJson(v));
      });
    }
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }
}