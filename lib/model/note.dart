class NoteModel {

  String? devoir;
  String? student;
  String? note;
  String? prof;
  String? matiere;

  NoteModel({
    this.devoir,
    this.matiere,
    this.note,
    this.prof,
    this.student
  });

  NoteModel.fromJson(Map<String, dynamic> json) {
    devoir = json['devoir']; // lahne njibou ely fy controller l back 
    matiere = json['matiere'];
    note = json['note'];// 
    prof = json['prof'];
    student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['devoir'] = devoir;
    data['matiere'] = matiere;
    data['note'] = note;
    data['prof'] = prof;
    data['student'] = student;
    return data;
  }
}
