final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, description, time
  ];

  static final String id = '_id';
  static final String hours = 'hours';
  static final String minutes = 'minutes';
  static final String description = 'description';
  static final String time = 'time';
}

class Note {
  final int? id;
  final int hours;
  final int minutes;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.hours,
    required this.minutes,
    required this.description,
    required this.createdTime,
  });

  Note copy({
    int? id,
    int? hours,
    int? minutes,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        hours: hours ?? this.hours,
        minutes: minutes ?? this.minutes,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
    id: json[NoteFields.id] as int?,
    hours: json[NoteFields.hours] as int,
    minutes: json[NoteFields.minutes] as int,
    description: json[NoteFields.description] as String,
    createdTime: DateTime.parse(json[NoteFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.hours: hours,
    NoteFields.minutes: minutes,
    NoteFields.description: description,
    NoteFields.time: createdTime.toIso8601String(),
  };
}