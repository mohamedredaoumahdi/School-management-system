import 'package:flutter/material.dart';
import 'package:school_management_system_01/backEnd/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({required this.auth, required this.child}) : super(child: child);
  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  // final auth = AuthProvider.of(context);
  static AuthBase of(BuildContext context) {
    AuthProvider provider = context.dependOnInheritedWidgetOfExactType<AuthProvider>() as AuthProvider;
    return provider.auth;
  }
}