import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../models/student.dart';
import '../providers/student_provider.dart';

class AddStudentScreen extends ConsumerStatefulWidget {
  const AddStudentScreen({super.key});

  @override
  ConsumerState<AddStudentScreen> createState() =>
      _AddStudentScreenState();
}

class _AddStudentScreenState
    extends ConsumerState<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final courseController = TextEditingController();

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // NAME
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                value!.isEmpty ? "Enter name" : null,
              ),

              // AGE
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(labelText: "Age"),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? "Enter age" : null,
              ),

              // COURSE
              TextFormField(
                controller: courseController,
                decoration:
                const InputDecoration(labelText: "Course"),
                validator: (value) =>
                value!.isEmpty ? "Enter course" : null,
              ),

              const SizedBox(height: 20),

              // IMAGE PREVIEW
              imagePath != null
                  ? CircleAvatar(
                radius: 40,
                backgroundImage: FileImage(File(imagePath!)),
              )
                  : const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person),
              ),

              const SizedBox(height: 10),

              // PICK IMAGE BUTTON (placeholder)
              ElevatedButton(
                onPressed: () {
                  // We'll implement image picker later
                },
                child: const Text("Pick Image"),
              ),

              const SizedBox(height: 20),

              // SAVE BUTTON
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final student = Student(
                      name: nameController.text,
                      age: int.parse(ageController.text),
                      course: courseController.text,
                      imagePath: imagePath,
                      id: DateTime.now().toString(),
                    );

                    ref
                        .read(studentProvider.notifier)
                        .addStudent(student);

                    context.pop(); // go back
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}