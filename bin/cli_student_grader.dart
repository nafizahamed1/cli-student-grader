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
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:
""");

    var choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addStudent(students);
        break;

      case "8":
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