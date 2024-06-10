class User {
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String roleCode;

  User({
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.roleCode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      name: json['name'],
      roleCode: json['roleId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'roleId': roleCode,
    };
  }

  User copyWith({
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? roleId,
  }) {
    return User(
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      roleCode: roleId ?? roleCode,
    );
  }

  @override
  String toString() {
    return 'User(email: $email, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, roleId: $roleCode)';
  }
}
