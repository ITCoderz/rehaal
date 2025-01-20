class PlanModel {
  final String destinationName;
  final double budget;
  final String imagePath;
  final DateTime startDate;
  final DateTime endDate;
  final List<Activity> activities; // Adjust the type accordingly
  final List<Member> members; // Adjust the type accordingly

  PlanModel({
    required this.destinationName,
    required this.budget,
    required this.imagePath,
    required this.startDate,
    required this.endDate,
    required this.activities,
    required this.members,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      destinationName: json['destinationName'],
      budget: json['budget'].toDouble(),
      imagePath: json['imagePath'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      activities: (json['activities'] as List)
          .map((activity) => Activity.fromJson(activity))
          .toList(),
      members: (json['members'] as List)
          .map((member) => Member.fromJson(member))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'destinationName': destinationName,
      'budget': budget,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'members': members.map((member) => member.toJson()).toList(),
      'activities': activities.map((activity) => activity.toJson()).toList(),
      'imagePath': imagePath,
    };
  }
}

class Member {
  String memberId;
  String memberName;
  String phone;

  Member({
    required this.memberName,
    required this.phone,
    required this.memberId,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberName: json['memberName'] as String,
      phone: json['phone'] as String,
      memberId: json['memberId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberName': memberName,
      'phone': phone,
      'memberId': memberId,
    };
  }
}

class Activity {
  String name;
  String date;
  double cost;
  String activityId;
  bool isPast;

  Activity({
    required this.name,
    required this.date,
    required this.cost,
    required this.activityId,
    this.isPast = false,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'] as String,
      date: json['date'] as String,
      cost: (json['cost'] as num).toDouble(),
      activityId: json['activityId'] as String,
      isPast: json['isPast'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'cost': cost,
      'activityId': activityId,
      'isPast': isPast,
    };
  }

  Activity copyWith({
    String? name,
    String? date,
    double? cost,
    String? activityId,
    bool? isPast,
  }) {
    return Activity(
      name: name ?? this.name,
      date: date ?? this.date,
      cost: cost ?? this.cost,
      activityId: activityId ?? this.activityId,
      isPast: isPast ?? this.isPast,
    );
  }
}
