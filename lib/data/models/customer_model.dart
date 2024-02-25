class Customer {
  final String name;
  final String? email;
  final String? phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  Customer({
    required this.name,
    this.email,
    this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Customer copyWith({
    String? name,
    String? email,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Customer(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Customer(name: $name, email: $email, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  //toMap() method
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
  
}
