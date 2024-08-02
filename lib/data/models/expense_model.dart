class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String? category;
  final String? id;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    this.category,
    this.id,
  });

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      title: json['title'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
    };
  }

  Expense copyWith({
    String? title,
    double? amount,
    DateTime? date,
    String? category,
    String? id,
  }) {
    return Expense(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'Expanse(title: $title, amount: $amount, date: $date, category: $category)';
  }

  //toMap() method
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category,
    };
  }

  //fromMap() method

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
      category: map['category'],
    );
  }

  //fromSnapshot() method
  factory Expense.fromSnapshot(Map<String, dynamic> snapshot) {
    return Expense(
      title: snapshot['title'],
      amount: snapshot['amount'],
      date: snapshot['date'].toDate(),
      category: snapshot['category'],
    );
  }
}
