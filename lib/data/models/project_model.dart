enum ProjectStatus { InReview, InProgress, OnHold, Completed }

class Project {
  final String? customerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final DateTime startDate;
  final ProjectStatus status;

  Project({
    this.customerId,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.startDate,
    this.status = ProjectStatus.InReview,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      customerId: json['customerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      startDate: DateTime.parse(json['startDate']),
      status: ProjectStatus.values
          .firstWhere((e) => e.toString() == json['status']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'title': title,
      'startDate': startDate.toIso8601String(),
      'status': status.toString(),
    };
  }

  Project copyWith({
    String? customerId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    DateTime? startDate,
    ProjectStatus? status,
  }) {
    return Project(
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      startDate: startDate ?? this.startDate,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'Project(customerId: $customerId, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, startDate: $startDate, status: $status)';
  }
}

class ProjectCounts {
  int inProgressCount = 0;
  int completedCount = 0;
  int inReviewCount = 0;
  int onHoldCount = 0;
}
