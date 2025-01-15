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
