class PlanModel {
  String destinationName;
  double budget;
  DateTime startDate;
  DateTime endDate;
  List<Member> members;

  PlanModel({
    required this.destinationName,
    required this.budget,
    required this.startDate,
    required this.endDate,
    required this.members,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      destinationName: json['destinationName'] as String,
      budget: (json['budget'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      members: (json['members'] as List<dynamic>)
          .map((member) => Member.fromJson(member as Map<String, dynamic>))
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
