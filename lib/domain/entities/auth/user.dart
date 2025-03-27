import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User entity for authentication
@freezed
class User with _$User {
  const User._(); // Add private constructor for freezed

  const factory User({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
  }) = _User;
} 