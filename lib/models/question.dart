class Question {
  final String libelle;

  List<Answer> answers;

  Question({
    this.libelle,
    this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'answers': answers.map((answer) => answer.toMap()).toList(growable: false),
    };
  }

  static Question fromMap(Map<String, dynamic> map) {
    return Question(
      libelle: map['libelle'],
      answers: map['answers'].map((mapping) => Answer.fromMap(mapping)).toList().cast<Answer>(),
    );
  }
}

class Answer {
  final String libelle;
  final int value;

  Answer({this.libelle, this.value});

  Map<String, dynamic> toMap() {
    return {
      'libelle': libelle,
      'value': value,
    };
  }

  static Answer fromMap(Map<String, dynamic> map) {
    return Answer(
      libelle: map['libelle'],
      value: map['value'],
    );
  }
}
