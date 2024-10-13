class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.images,
    required this.thumbnail,
    required this.dimensions,
    required this.reviews,
    required this.meta,
  });

  factory Product.fromJson(Map<String, dynamic> data) {
    return Product(
      id: data["id"] ?? 0,
      title: data["title"] ?? 'No Title',
      description: data["description"] ?? 'No Description',
      category: data["category"] ?? 'No Category',
      price: (data["price"] ?? 0).toDouble(),
      discountPercentage: (data["discountPercentage"] ?? 0).toDouble(),
      rating: (data["rating"] ?? 0).toDouble(),
      stock: data["stock"] ?? 0,
      tags: data["tags"] != null ? List<String>.from(data["tags"]) : [],
      brand: data["brand"] ?? 'No Brand',
      sku: data["sku"] ?? 'No SKU',
      weight: (data["weight"] ?? 0).toDouble(),
      warrantyInformation: data["warrantyInformation"] ?? 'No Warranty',
      shippingInformation: data["shippingInformation"] ?? 'No Shipping Info',
      availabilityStatus: data["availabilityStatus"] ?? 'Unknown',
      returnPolicy: data["returnPolicy"] ?? 'No Return Policy',
      minimumOrderQuantity: data["minimumOrderQuantity"] ?? 1,
      images: data["images"] != null ? List<String>.from(data["images"]) : [],
      thumbnail: data["thumbnail"] ?? '',
      dimensions: data['dimensions'] != null
          ? Dimensions.fromJson(data['dimensions'])
          : Dimensions(width: 0, height: 0, depth: 0),
      reviews: data['reviews'] != null
          ? (data['reviews'] as List)
              .map((reviewJson) => Review.fromJson(reviewJson))
              .toList()
          : [],
      meta: data['meta'] != null
          ? Meta.fromJson(data['meta'])
          : Meta(createdAt: '', updatedAt: '', barcode: '', qrCode: ''),
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });
  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}

class Review {
  final double rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
