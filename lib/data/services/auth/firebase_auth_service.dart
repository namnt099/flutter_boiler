import 'package:firebase_auth/firebase_auth.dart' as firebase;

class FirebaseAuthService {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;

  Future<firebase.UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<firebase.UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<firebase.User?> getCurrentUser() async {
    return _auth.currentUser;
  }
} 