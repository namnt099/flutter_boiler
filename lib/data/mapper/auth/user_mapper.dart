import '../../../../domain/domain.dart';
import '../../dto/auth/user_dto.dart';

class UserMapper {
  static User toEntity(UserDto dto) {
    return User(
      id: dto.id,
      email: dto.email,
      displayName: dto.displayName,
      photoUrl: dto.photoUrl,
    );
  }

  static UserDto toDto(User entity) {
    return UserDto(
      id: entity.id,
      email: entity.email,
      displayName: entity.displayName,
      photoUrl: entity.photoUrl,
    );
  }
} 