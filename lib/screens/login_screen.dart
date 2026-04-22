import 'package:flutter/material.dart';
import 'package:student_management/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          ref.read(authProvider.notifier).login();
        }, child: Text('login')),
      ),
    );
  }
}
