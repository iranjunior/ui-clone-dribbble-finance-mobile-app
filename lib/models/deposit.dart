import 'dart:convert';

class DepositModel {
  String name;
  String description;
  String type;
  double value;

  DepositModel({
    required this.name,
    required this.description,
    required this.type,
    required this.value,
  });

  DepositModel copyWith({
    String? name,
    String? description,
    String? type,
    double? value,
  }) {
    return DepositModel(
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'type': type,
      'value': value,
    };
  }

  factory DepositModel.fromMap(Map<String, dynamic> map) {
    return DepositModel(
      name: map['name'],
      description: map['description'],
      type: map['type'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DepositModel.fromJson(String source) =>
      DepositModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DepositModel(name: $name, description: $description, type: $type, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DepositModel &&
        other.name == name &&
        other.description == description &&
        other.type == type &&
        other.value == value;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        type.hashCode ^
        value.hashCode;
  }
}
