class PlanModel {
  String destinationName;
  double budget;
  DateTime startDate;
  DateTime endDate;
  List<Member> members;
  String? imagePath;
  List<Activity> activities;
  PlanModel({
    required this.destinationName,
    required this.budget,
    required this.startDate,
    required this.endDate,
    this.members = const [], // Default to empty list
    this.activities = const [],
    this.imagePath,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      destinationName: json['destinationName'] as String,
      budget: (json['budget'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      members: (json['members'])
              ?.map((member) => Member.fromJson(member as Map<String, dynamic>))
              .toList() ??
          [],
      activities: (json['activities'] as List<dynamic>?)
              ?.map((activity) =>
                  Activity.fromJson(activity as Map<String, dynamic>))
              .toList() ??
          [],
      imagePath: json['imagePath'] as String?,
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
  String memberName;
  String phone;

  Member({
    required this.memberName,
    required this.phone,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberName: json['memberName'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberName': memberName,
      'phone': phone,
    };
  }
}

class Activity {
  String name;
  String date;
  double cost;

  Activity({
    required this.name,
    required this.date,
    required this.cost,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      name: json['name'] as String,
      date: json['date'] as String,
      cost: (json['cost'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'cost': cost,
    };
  }
}
