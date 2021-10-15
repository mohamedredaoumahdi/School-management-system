class User {
  final String firstName;
  final String lastName;
  final int firstExam;
  final int secondExam;

  const User({
    required this.firstName,
    required this.lastName,
    required this.firstExam,
    required this.secondExam,e
  });

  User copy({
    String? firstName,
    String? lastName,
    int? firstExam,
    int? secondExam
  }) =>
      User(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        firstExam: firstExam ?? this.firstExam,
        secondExam: secondExam ?? this.secondExam
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          firstExam == other.firstExam &&
          secondExam == other.secondExam;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ firstExam.hashCode ^ secondExam.hashCode;
}