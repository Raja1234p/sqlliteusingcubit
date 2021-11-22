import 'dart:convert';

class User {
  User(
      {this.id,
      required this.name,
      required this.age,
      required this.country,
      this.email,
      this.describtion,
      this.dateTime});

  factory User.fromMap(map) {
    return User(
        id: map['id'] as int,
        name: map['name'] as String,
        age: map['age'] as int,
        country: map['country'] as String,
        email: map['email'] as String?,
        describtion: map['describtion'] as String?,
        dateTime: map['dateTime'] as String?);
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  final int? id;
  final String name;
  final int age;
  final String country;
  final String? email;
  final String? describtion;
  final String? dateTime;

  User copyWith({
    int? id,
    String? name,
    int? age,
    String? country,
    String? email,
  }) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        country: country ?? this.country,
        email: email ?? this.email,
        describtion: describtion ?? this.describtion,
        dateTime: dateTime ?? this.dateTime);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'country': country,
      'email': email,
      'describtion': describtion,
      'dateTime': dateTime
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'User(id: $id, name: $name, age: $age, country: $country, email: $email,describtion:$describtion,dateTime:$dateTime)';
  }
}
