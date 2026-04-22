import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management/models/student.dart';
import 'package:student_management/services/hive_service.dart';

final studentProvider=
    StateNotifierProvider<StudentNotifier,List<Student>>((ref){
      return StudentNotifier();
    });

class StudentNotifier extends StateNotifier<List<Student>>{
  StudentNotifier():super([]){
    load();
  }

  void load(){
    state=HiveService.getStudents();
  }
  void addStudent(Student student){
    HiveService.addStudent(student);
    load();
  }
  void deleteStudent(String id){
    HiveService.deleteStudent(id);
    load();
  }
}