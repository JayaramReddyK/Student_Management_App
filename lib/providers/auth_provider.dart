import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management/services/hive_service.dart';

final authProvider=
StateNotifierProvider<AuthNotifier,bool>((ref){
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<bool>{
  AuthNotifier():super(HiveService.isLoggedIn());

  void login(){
    HiveService.login();
    state=true;
  }
  void logout(){
    HiveService.logout();
    state=false;
  }

}