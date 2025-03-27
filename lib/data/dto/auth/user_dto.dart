import 'package:firebase_auth/firebase_auth.dart' as firebase;

class UserDto {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;

  const UserDto({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
  });

  factory UserDto.fromFirebaseUser(firebase.User user) {
    return UserDto(
      id: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
    );
  }
} 