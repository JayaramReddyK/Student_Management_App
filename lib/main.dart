import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/models/student.dart';
import 'package:student_management/routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentAdapter());
  
  await Hive.openBox<Student>('studentsBox');
  await Hive.openBox('authBox');
  runApp(
      const ProviderScope(
          child:  MyApp(),
      )
  );


}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router=ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,

    );
  }
}
