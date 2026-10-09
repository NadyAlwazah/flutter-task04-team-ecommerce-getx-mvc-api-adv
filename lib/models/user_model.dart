// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String name;
  final String email;
  final String? password;
  final String avatar;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    this.password,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      avatar: json['avatar'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'name': name,
      'email': email,
      'avatar': avatar,
    };

    if (id != null) {
      data['id'] = id;
    }

    if (password != null) {
      data['password'] = password;
    }

    return data;
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props => [id, name, email, password, avatar];
}
