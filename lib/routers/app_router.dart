import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:student_management/providers/auth_provider.dart';
import 'package:student_management/screens/login_screen.dart';
import 'package:student_management/screens/home_screen.dart';
import 'package:student_management/screens/add_student_screen.dart';


final routerProvider=Provider<GoRouter>((ref) {
  final authState=ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',

    redirect: (context,state){
      final isLoginRoute =state.matchedLocation == '/login';


      if (!authState) {
        return isLoginRoute ? null :'/login';
      }


      if (authState && isLoginRoute) {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
          path: '/',
        builder: (context,state)=> const HomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context,state)=> const LoginScreen(),
      ),
      GoRoute(
        path: '/add',
        builder: (context,state)=> const AddStudentScreen(),
      ),
    ],
  );
});