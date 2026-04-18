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
3. Exit

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

  var student = {
    "name": name,
    "scores": <int>[],
    "subjects": {...availableSubjects},
    "bonus": null,
    "comment": null,
  };

  students.add(student);

  print("Student $name added successfully!");
}

void recordScore(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print("No students available!");
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

    if (score >= 0 && score <= 100) {
      break;
    }

    print("Invalid score! Try again.");
  }

  students[index]["scores"].add(score);

  print("Score added successfully!");
}