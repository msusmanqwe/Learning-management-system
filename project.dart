import 'dart:io';

void main() {
  // Data for Student, Teachers, and Admin
  String studentMail = '123';
  String studentPass = '123';

  String teacherMail = 'td@mail.com';
  String teacherPass = '123';

  String adminMail = 'ad@mail.com';
  String adminPass = '123';

  // Creating data
  Map<String, Map<String, dynamic>> students = {
    'Ali': {
      'rollNumber': 142,
      'field': 'science',
      'subjects': {
        'English': 50,
        'Urdu': 50,
        'Islamiat': 50,
        'Bio': 50,
        'Chemistry': 50,
      }
    },
    'Usman': {
      'rollNumber': 143,
      'field': 'computer science',
      'subjects': {
        'English': 97,
        'Urdu': 94,
        'Islamiat': 95,
        'Math': 99,
        'Computer': 95,
      }
    }
  };

  Map<String, Map<String, String>> teachers = {
    'Haider': {'subject': 'computer'},
    'Faiqa': {'subject': 'english'},
    'Anila': {'subject': 'urdu'},
    'Asif': {'subject': 'chemistry'},
  };

  bool isLoggedIn = false;
  String role = '';

  // Login loop
  while (!isLoggedIn) {
    print('Enter the Domain you Want to Login \nPress \n1: for Student \n2: for Teacher \n3: for Admin');
    String input = stdin.readLineSync()!;
    
    if (input == '1') {
      print('You are Entering as a student \nEnter your mail:');
      String input2 = stdin.readLineSync()!;
      print('Enter your password:');
      String input3 = stdin.readLineSync()!;
      if ((input2 == studentMail) && (input3 == studentPass)) {
        print('Login successful as a student');
        isLoggedIn = true;
        role = 'student';
        studentMenu(students);
      } else {
        print('Try again\n');
      }
    } else if (input == '2') {
      print('You are Entering as a Teacher \nEnter your mail:');
      String input4 = stdin.readLineSync()!;
      print('Enter your password:');
      String input5 = stdin.readLineSync()!;
      if ((input4 == teacherMail) && (input5 == teacherPass)) {
        print('Login successful as a teacher');
        isLoggedIn = true;
        role = 'teacher';
        teacherMenu(students);
      } else {
        print('Try again\n');
      }
    } else if (input == '3') {
      print('You are Entering as an Admin \nEnter your mail:');
      String input6 = stdin.readLineSync()!;
      print('Enter your password:');
      String input7 = stdin.readLineSync()!;
      if ((input6 == adminMail) && (input7 == adminPass)) {
        print('Login successful as an admin');
        isLoggedIn = true;
        role = 'admin';
        adminMenu(students, teachers);
      } else {
        print('Try again\n');
      }
    } else {
      print('Invalid input, please try again.');
    }
  }
}

void studentMenu(Map<String, Map<String, dynamic>> students) {
  bool exit = false;
  while (!exit) {
    print('Choose an option:');
    print('1: Check Marks of Student');
    print('2: Check Field of Student');
    print('3: Change Subject of Student');
    print('4: Delete Subject of Student');
    print('5: Delete a Student');
    print('6: Logout');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        checkMarks(students);
        break;
      case '2':
        checkField(students);
        break;
      case '3':
        changeSubject(students);
        break;
      case '4':
        deleteSubject(students);
        break;
      case '5':
        deleteStudent(students);
        break;
      case '6':
        print('Logging out...');
        exit = true;
        break;
      default:
        print('Invalid choice. Please try again.');
    }

    if (!exit) {
      print('Do you want to exit? Press "y" to exit or any other key to continue.');
      String continueChoice = stdin.readLineSync()!;
      if (continueChoice.toLowerCase() == 'y') {
        exit = true;
        print('Logging out...');
      }
    }
  }
}

void adminMenu(Map<String, Map<String, dynamic>> students, Map<String, Map<String, String>> teachers) {
  bool exit = false;
  while (!exit) {
    print('Choose an option:');
    print('1: Add Student');
    print('2: Remove Student');
    print('3: Update Student');
    print('4: Add Teacher');
    print('5: Remove Teacher');
    print('6: Update Teacher');
    print('7: Logout');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        addStudent(students);
        break;
      case '2':
        removeStudent(students);
        break;
      case '3':
        updateStudent(students);
        break;
      case '4':
        addTeacher(teachers);
        break;
      case '5':
        removeTeacher(teachers);
        break;
      case '6':
        updateTeacher(teachers);
        break;
      case '7':
        print('Logging out...');
        exit = true;
        break;
      default:
        print('Invalid choice. Please try again.');
    }

    if (!exit) {
      print('Do you want to exit? Press "y" to exit or any other key to continue.');
      String continueChoice = stdin.readLineSync()!;
      if (continueChoice.toLowerCase() == 'y') {
        exit = true;
        print('Logging out...');
      }
    }
  }ﾀ
}

void teacherMenu(Map<String, Map<String, dynamic>> students) {
  bool exit = false;
  while (!exit) {
    print('Choose an option:');
    print('1: Check Marks of Student');
    print('2: Change Marks of Student');
    print('3: Delete Subject of Student');
    print('4: Delete a Student');
    print('5: Logout');

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        checkMarks(students);
        break;
      case '2':
        changeMarks(students);
        break;
      case '3':
        deleteSubject(students);
        break;
      case '4':
        deleteStudent(students);
        break;
      case '5':
        print('Logging out...');
        exit = true;
        break;
      default:
        print('Invalid choice. Please try again.');
    }

    if (!exit) {
      print('Do you want to exit? Press "y" to exit or any other key to continue.');
      String continueChoice = stdin.readLineSync()!;
      if (continueChoice.toLowerCase() == 'y') {
        exit = true;
        print('Logging out...');
      }
    }
  }
}

void checkMarks(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to check marks:');
  String studentName = stdin.readLineSync()!;
  var student = students[studentName];
  if (student != null) {
    var subjects = student['subjects'] as Map<String, int>;
    print('Marks for $studentName:');
    subjects.forEach((subject, marks) {
      print('$subject: $marks');
    });
  } else {
    print('Student not found.');
  }
}

void checkField(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to check field:');
  String studentName = stdin.readLineSync()!;
  var student = students[studentName];
  if (student != null) {
    print('Field for $studentName: ${student['field']}');
  } else {
    print('Student not found.');
  }
}

void changeSubject(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to change subject:');
  String studentName = stdin.readLineSync()!;
  var student = students[studentName];
  if (student != null) {
    var subjects = student['subjects'] as Map<String, int>;
    print('Current subjects: ${subjects.keys.join(', ')}');
    print('Enter the subject you want to change:');
    String oldSubject = stdin.readLineSync()!;
    if (subjects.containsKey(oldSubject)) {
      print('Enter new marks for $oldSubject:');
      int newMarks = int.parse(stdin.readLineSync()!);
      subjects[oldSubject] = newMarks;
      print('Marks for $oldSubject updated to $newMarks.');
    } else {
      print('Subject not found.');
    }
  } else {
    print('Student not found.');
  }
}

void deleteSubject(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to delete a subject:');
  String studentName = stdin.readLineSync()!;
  var student = students[studentName];
  if (student != null) {
    var subjects = student['subjects'] as Map<String, int>;
    print('Current subjects: ${subjects.keys.join(', ')}');
    print('Enter the subject you want to delete:');
    String subjectToDelete = stdin.readLineSync()!;
    if (subjects.containsKey(subjectToDelete)) {
      subjects.remove(subjectToDelete);
      print('Subject $subjectToDelete deleted.');
    } else {
      print('Subject not found.');
    }
  } else {
    print('Student not found.');
  }
}

void deleteStudent(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to delete:');
  String studentName = stdin.readLineSync()!;
  if (students.containsKey(studentName)) {
    students.remove(studentName);
    print('Student $studentName removed.');
  } else {
    print('Student not found.');
  }
}

void addStudent(Map<String, Map<String, dynamic>> students) {
  print('Enter student name:');
  String name = stdin.readLineSync()!;
  print('Enter roll number:');
  int rollNumber = int.parse(stdin.readLineSync()!);
  print('Enter field:');
  String field = stdin.readLineSync()!;
  
  Map<String, int> subjects = {};
  print('Enter number of subjects:');
  int numSubjects = int.parse(stdin.readLineSync()!);
  for (int i = 0; i < numSubjects; i++) {
    print('Enter subject name:');
    String subject = stdin.readLineSync()!;
    print('Enter marks for $subject:');
    int marks = int.parse(stdin.readLineSync()!);
    subjects[subject] = marks;
  }

  students[name] = {
    'rollNumber': rollNumber,
    'field': field,
    'subjects': subjects
  };
  print('Student $name added.');
}

void removeStudent(Map<String, Map<String, dynamic>> students) {
  print('Enter student name to remove:');
  String name = stdin.readLineSync()!;
  if (students.containsKey(name)) {
    students.remove(name);
    print('Student $name removed.');
  } else {
    print('Student not found.');
  }
}

void updateStudent(Map<String, Map<String, dynamic>> students) {
  print('Enter student name to update:');
  String name = stdin.readLineSync()!;
  if (students.containsKey(name)) {
    print('Enter new roll number (leave blank to keep current):');
    String rollNumberStr = stdin.readLineSync()!;
    if (rollNumberStr.isNotEmpty) {
      int rollNumber = int.parse(rollNumberStr);
      students[name]!['rollNumber'] = rollNumber;
    }

    print('Enter new field (leave blank to keep current):');
    String field = stdin.readLineSync()!;
    if (field.isNotEmpty) {
      students[name]!['field'] = field;
    }

    print('Do you want to update subjects? (y/n)');
    String updateSubjects = stdin.readLineSync()!;
    if (updateSubjects.toLowerCase() == 'y') {
      var subjects = students[name]!['subjects'] as Map<String, int>;
      print('Enter number of subjects to update:');
      int numSubjects = int.parse(stdin.readLineSync()!);
      for (int i = 0; i < numSubjects; i++) {
        print('Enter subject name:');
        String subject = stdin.readLineSync()!;
        print('Enter new marks for $subject (leave blank to keep current):');
        String marksStr = stdin.readLineSync()!;
        if (marksStr.isNotEmpty) {
          int marks = int.parse(marksStr);
          subjects[subject] = marks;
        }
      }
    }

    print('Student $name updated.');
  } else {
    print('Student not found.');
  }
}

void addTeacher(Map<String, Map<String, String>> teachers) {
  print('Enter teacher name:');
  String name = stdin.readLineSync()!;
  print('Enter subject taught by the teacher:');
  String subject = stdin.readLineSync()!;
  teachers[name] = {'subject': subject};
  print('Teacher $name added.');
}

void removeTeacher(Map<String, Map<String, String>> teachers) {
  print('Enter teacher name to remove:');
  String name = stdin.readLineSync()!;
  if (teachers.containsKey(name)) {
    teachers.remove(name);
    print('Teacher $name removed.');
  } else {
    print('Teacher not found.');
  }
}

void updateTeacher(Map<String, Map<String, String>> teachers) {
  print('Enter teacher name to update:');
  String name = stdin.readLineSync()!;
  if (teachers.containsKey(name)) {
    print('Enter new subject (leave blank to keep current):');
    String subject = stdin.readLineSync()!;
    if (subject.isNotEmpty) {
      teachers[name]!['subject'] = subject;
    }
    print('Teacher $name updated.');
  } else {
    print('Teacher not found.');
  }
}

void changeMarks(Map<String, Map<String, dynamic>> students) {
  print('Enter the student name to change marks:');
  String studentName = stdin.readLineSync()!;
  var student = students[studentName];
  if (student != null) {
    var subjects = student['subjects'] as Map<String, int>;
    print('Current subjects: ${subjects.keys.join(', ')}');
    print('Enter the subject you want to change marks for:');
    String subject = stdin.readLineSync()!;
    if (subjects.containsKey(subject)) {
      print('Enter new marks for $subject:');
      int newMarks = int.parse(stdin.readLineSync()!);
      subjects[subject] = newMarks;
      print('Marks for $subject updated to $newMarks.');
    } else {
      print('Subject not found.');
    }
  } else {
    print('Student not found.');
  }
}
