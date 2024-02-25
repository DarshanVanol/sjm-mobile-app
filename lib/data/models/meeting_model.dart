class Meeting {
  final String? customerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? title;
  final DateTime scheduledOn;
  final String? projectId;

  Meeting({
    this.customerId,
    required this.createdAt,
    required this.updatedAt,
    this.title,
    required this.scheduledOn,
    this.projectId,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      customerId: json['customerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      scheduledOn: DateTime.parse(json['startDate']),
      projectId: json['projectId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'title': title,
      'scheduledOn': scheduledOn.toIso8601String(),
      'projectId': projectId,
    };
  }

  Meeting copyWith({
    String? customerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    DateTime? scheduledOn,
    String? projectId,
  }) {
    return Meeting(
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      scheduledOn: scheduledOn ?? this.scheduledOn,
      projectId: projectId ?? this.projectId,
    );
  }

  @override
  String toString() {
    return 'Meeting(customerId: $customerId, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, scheduledOn: $scheduledOn, projectId: $projectId)';
  }

  // from snapshot
  factory Meeting.fromSnapshot(Map<String, dynamic> snapshot) {
    return Meeting(
      customerId: snapshot['customerId'],
      createdAt: snapshot['createdAt'].toDate(),
      updatedAt: snapshot['updatedAt'].toDate(),
      title: snapshot['title'],
      scheduledOn: snapshot['scheduledOn'].toDate(),
      projectId: snapshot['projectId'],
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'title': title,
      'scheduledOn': scheduledOn,
      'projectId': projectId,
    };
  }
}
