import 'dart:convert';

class CreditCardModel {
  String holder;
  String number;
  String brand;
  double balance;
  double avg;

  CreditCardModel({
    required this.holder,
    required this.number,
    required this.brand,
    required this.balance,
    required this.avg,
  });

  CreditCardModel copyWith({
    String? holder,
    String? number,
    String? brand,
    double? balance,
    double? avg,
  }) {
    return CreditCardModel(
      holder: holder ?? this.holder,
      number: number ?? this.number,
      brand: brand ?? this.brand,
      balance: balance ?? this.balance,
      avg: avg ?? this.avg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'holder': holder,
      'number': number,
      'brand': brand,
      'balance': balance,
      'avg': avg,
    };
  }

  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      holder: map['holder'],
      number: map['number'],
      brand: map['brand'],
      balance: map['balance'],
      avg: map['avg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardModel.fromJson(String source) =>
      CreditCardModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreditCardModel(holder: $holder, number: $number, brand: $brand, balance: $balance, avg: $avg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreditCardModel &&
        other.holder == holder &&
        other.number == number &&
        other.brand == brand &&
        other.balance == balance &&
        other.avg == avg;
  }

  @override
  int get hashCode {
    return holder.hashCode ^
        number.hashCode ^
        brand.hashCode ^
        balance.hashCode ^
        avg.hashCode;
  }
}
