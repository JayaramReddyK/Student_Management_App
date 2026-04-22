import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_management/providers/student_provider.dart';
import 'package:student_management/providers/auth_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final students=ref.watch(studentProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(onPressed: (){
            ref.read(authProvider.notifier).logout();
          }, icon: const  Icon(Icons.logout)
          ),
        ],
      ),
      body: students.isEmpty
      ? const Center(child: Text('No Students Added'))
      :ListView.builder(
          itemCount:students.length,
        itemBuilder: (context,index){
            final student=students[index];
            return ListTile(
              leading: student.imagePath !=null
                  ?CircleAvatar(
                backgroundImage: 
                FileImage(File(student.imagePath!),
                ),
              )
              : const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(student.name),
              subtitle: Text(
                  "${student.age} | ${student.course}"),

              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref
                      .read(studentProvider.notifier)
                      .deleteStudent(student.id);
                },
              ),
              
            );

        }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            context.push('/add');
          },
          child: const Icon(Icons.add),
      ),
        
    );
  }
}
