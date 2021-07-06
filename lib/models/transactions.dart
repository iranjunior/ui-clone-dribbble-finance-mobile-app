import 'dart:convert';

import 'package:flutter/material.dart';

class TransactionsModel {
  String title;
  AssetImage image;
  String description;
  double value;

  TransactionsModel({
    required this.title,
    required this.image,
    required this.description,
    required this.value,
  });

  TransactionsModel copyWith({
    String? title,
    AssetImage? image,
    String? description,
    double? value,
  }) {
    return TransactionsModel(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image.assetName,
      'description': description,
      'value': value,
    };
  }

  factory TransactionsModel.fromMap(Map<String, dynamic> map) {
    return TransactionsModel(
      title: map['title'],
      image: AssetImage(map['image']),
      description: map['description'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsModel.fromJson(String source) =>
      TransactionsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionsModel(title: $title, image: ${image.assetName}, description: $description, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionsModel &&
        other.title == title &&
        other.image.assetName == image.assetName &&
        other.description == description &&
        other.value == value;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        image.hashCode ^
        description.hashCode ^
        value.hashCode;
  }
}
