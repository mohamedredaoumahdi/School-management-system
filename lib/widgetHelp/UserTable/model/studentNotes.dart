class StudentNotes {
  final String subject;
  final int firstExam;
  final int secondExam;

  const StudentNotes({
    required this.subject,
    required this.firstExam,
    required this.secondExam,
  });

  StudentNotes copy({
    String? subject,
    int? firstExam,
    int? secondExam
  }) =>
      StudentNotes(
        subject: subject ?? this.subject,
        firstExam: firstExam ?? this.firstExam,
        secondExam: secondExam ?? this.secondExam
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentNotes &&
          runtimeType == other.runtimeType &&
          subject == other.subject &&
          firstExam == other.firstExam &&
          secondExam == other.secondExam;

  @override
  int get hashCode => subject.hashCode ^ firstExam.hashCode ^ secondExam.hashCode;
}