import 'dart:io';

abstract class namedRole {
  void displayRole();
}

class Person implements namedRole {
  String name;
  int age;
  String address;
  Person(this.name, this.age, this.address);

  String get getName {
    return name;
  }

  int get getAge {
    return age;
  }

  String get getAddress {
    return address;
  }

  @override
  void displayRole() {
    print('Role: Person');
  }
}

class Student extends Person {
  int studentID;
  String grade;
  List<double> courseScores;
  Student(String name, int age, String address, this.studentID, this.grade,
      this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    double sum = 0;
    for (var x in courseScores) {
      sum += x;
    }
    return sum / courseScores.length;
  }

  void displayInfo() {
    displayRole();
    print('Name: ${getName}');
    print('Age: $getAge');
    print('Address: $getAddress');
    print('Student ID: $studentID');
    print('Grade: $grade');
    print('Course Scores: $courseScores');
    print('Average Score: ${calculateAverageScore()}');
  }
}

class Teacher extends Person {
  int teacherID;

  List<String> courseTaught;
  Teacher(
      String name, int age, String address, this.teacherID, this.courseTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  String get getCourseTaught {
    return courseTaught.toString();
  }

  void displayInfo() {
    displayRole();
    print('Name: $getName');
    print('Age: $getAge');
    print('Address: $getAddress');
    print('Teacher ID: $teacherID');
    print('Courses Taught: $courseTaught');
  }
}

void main() {
  var student = Student('John Doe', 20, '123 Main St', 123, 'A', [90, 80, 70]);
  student.displayInfo();
  var teacher =
      Teacher('Mrs. Smith', 35, '456 Elm St', 456, ['Math', 'Science']);
  teacher.displayInfo();
}
