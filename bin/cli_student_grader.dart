import 'dart:io';

const String appTitle = "Student Grader v1.0";

final availableSubjects = {
  "Math",
  "English",
  "Science",
  "ICT"
};

void main() {
  var students = <Map<String, dynamic>>[];
  var running = true;

  do {
    print("""
===== $appTitle =====

1. Add Student
2. Record Score
3. Add Bonus
4. Add Comment
5. View Report Card
6. Exit

Choose an option:
""");

    var choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addStudent(students);
        break;

      case "2":
        recordScore(students);
        break;

      case "3":
        addBonus(students);
        break;

      case "4":
        addComment(students);
        break;

      case "5":
        viewReportCard(students);
        break;

      case "6":
        running = false;
        print("Exiting...");
        break;

      default:
        print("Invalid option");
    }

  } while (running);
}


void addStudent(List<Map<String, dynamic>> students) {
  print("Enter student name:");
  var name = stdin.readLineSync();

  students.add({
    "name": name,
    "scores": <int>[],
    "subjects": {...availableSubjects},
    "bonus": null,
    "comment": null,
  });

  print("Student $name added!");
}

void recordScore(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No students!");
    return;
  }

  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  print("Select student:");
  var index = int.parse(stdin.readLineSync()!) - 1;

  int score;

  while (true) {
    print("Enter score (0-100):");
    score = int.parse(stdin.readLineSync()!);

    if (score >= 0 && score <= 100) break;
    print("Invalid score!");
  }

  students[index]["scores"].add(score);
  print("Score added!");
}


void addBonus(List<Map<String, dynamic>> students) {
  if (students.isEmpty) return;

  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  print("Select student:");
  var index = int.parse(stdin.readLineSync()!) - 1;

  print("Enter bonus (1-10):");
  var bonus = int.parse(stdin.readLineSync()!);

  students[index]["bonus"] ??= bonus;

  print("Bonus added!");
}


void addComment(List<Map<String, dynamic>> students) {
  if (students.isEmpty) return;

  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  print("Select student:");
  var index = int.parse(stdin.readLineSync()!) - 1;

  print("Enter comment:");
  students[index]["comment"] = stdin.readLineSync();

  print("Comment saved!");
}


void viewReportCard(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No students!");
    return;
  }

  for (int i = 0; i < students.length; i++) {
    print("${i + 1}. ${students[i]["name"]}");
  }

  print("Select student:");
  var index = int.parse(stdin.readLineSync()!) - 1;

  var s = students[index];
  var scores = s["scores"] as List<int>;

  if (scores.isEmpty) {
    print("No scores available!");
    return;
  }

 
  int sum = 0;
  for (var sc in scores) {
    sum += sc;
  }

  double avg = sum / scores.length;


  avg += (s["bonus"] ?? 0);

  if (avg > 100) avg = 100;


  String grade;

  if (avg >= 90) {
    grade = "A";
  } else if (avg >= 80) {
    grade = "B";
  } else if (avg >= 70) {
    grade = "C";
  } else if (avg >= 60) {
    grade = "D";
  } else {
    grade = "F";
  }

  String feedback = switch (grade) {
    "A" => "Outstanding performance!",
    "B" => "Good work!",
    "C" => "Satisfactory",
    "D" => "Needs improvement",
    "F" => "Failing",
    _ => "Unknown"
  };

  
  String comment = s["comment"]?.toUpperCase() ?? "NO COMMENT";

 
  print("""
╔══════════════════════════════╗
║        REPORT CARD           ║
╠══════════════════════════════╣
║ Name: ${s["name"]}
║ Scores: $scores
║ Bonus: +${s["bonus"] ?? 0}
║ Average: ${avg.toStringAsFixed(1)}
║ Grade: $grade
║ Comment: $comment
║ Feedback: $feedback
╚══════════════════════════════╝
""");
}