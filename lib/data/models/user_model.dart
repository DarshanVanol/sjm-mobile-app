import 'package:flutter/foundation.dart';

class User {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String roleCode;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.roleCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      name: json['name'],
      roleCode: json['roleId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'roleId': roleCode,
    };
  }

  User copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? roleId,
  }) {
    return User(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      roleCode: roleId ?? this.roleCode,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, roleId: $roleCode)';
  }


}

