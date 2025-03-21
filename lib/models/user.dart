// lib/models/user.dart
class User {
  final int id;
  final String email;
  final String username;
  final bool isActive;
  final String createdAt;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.isActive,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
    );
  }
}

// lib/models/subscription.dart
class Subscription {
  final int id;
  final int userId;
  final String planType;
  final String startDate;
  final String endDate;
  final bool isActive;

  Subscription({
    required this.id,
    required this.userId,
    required this.planType,
    required this.startDate,
    required this.endDate,
    required this.isActive,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      userId: json['user_id'],
      planType: json['plan_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      isActive: json['is_active'],
    );
  }
}
