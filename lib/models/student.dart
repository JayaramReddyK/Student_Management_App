import 'package:hive_flutter/hive_flutter.dart';

part 'student.g.dart';

@HiveType(typeId:0)
class Student {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String course;

  @HiveField(3)
  String? imagePath;

  @HiveField(4)
  String id;

  Student({
    required this.name,
    required this.age,
    required this.course,
    this.imagePath,
    required this.id,

});

}