import 'dart:io';

const String appTitle = "Student Grader v1.0";

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
        print("Add Student selected");
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