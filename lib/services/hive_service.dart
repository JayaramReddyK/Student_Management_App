
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/models/student.dart';

class HiveService {

  static final Box<Student> _studentBox=Hive.box<Student>('studentsBox');
  static final Box _authBox=Hive.box('authBox');

  static List<Student> getStudents(){
    return _studentBox.values.toList();
  }

  static void addStudent(Student student){
    _studentBox.add(student);
  }

  static void deleteStudent(String id){
    final students=_studentBox.values.toList();
    final index=students.indexWhere((s)=>s.id==id);
    _studentBox.deleteAt(index);
  }

  static bool isLoggedIn(){
    return _authBox.get('login',defaultValue: false);
  }

  static void login(){
    _authBox.put('login', true);
  }

  static void logout(){
    _authBox.put('logout', false);
  }

}