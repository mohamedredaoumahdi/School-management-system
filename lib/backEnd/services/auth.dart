import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserClient {
  UserClient({required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<UserClient> get onAuthStateChanges;
  Future<UserClient> currentUser();
  Future<UserClient> signInAnonymously();
  Future<void> signOut();
  Future<UserClient> signInWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase {
  
  final _firebaseAuth = FirebaseAuth.instance;
  
  UserClient _userFromFirebase(User user) {
    if (user == null as User) {
      return null as UserClient;
    }
    return UserClient(uid: user.uid);
  }

  @override
  Stream<UserClient> get onAuthStateChanges {
    return _firebaseAuth.authStateChanges().map(
      (user) => _userFromFirebase(user as User)
      );
  }

  @override
  Future<UserClient> currentUser() async {
    final user = await _firebaseAuth.currentUser as User;
    return _userFromFirebase(user);
  }

  @override
  Future<UserClient> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user as User);
  }
  
  @override
  Future<UserClient> signInWithEmailAndPassword(String email, String password)async{
    final authResult =await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user as User);
  }
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
