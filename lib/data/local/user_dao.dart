import 'package:floor/floor.dart';
import 'package:hometest/data/models/user.dart';

/// Represents a user entity in the local database.
@Entity(tableName: 'User')
class UserEntity {
  UserEntity({
    required this.email,
    required this.name,
    required this.password,
    required this.jobTitle,
  });

  @primaryKey
  final String email;
  final String name;
  final String password;
  final String jobTitle;

  // For simplicity, add conversion
  User toUser() => User(
        email: email,
        name: name,
        password: password,
        jobTitle: jobTitle,
      );

  factory UserEntity.fromUser(User user) => UserEntity(
        email: user.email,
        name: user.name,
        password: user.password,
        jobTitle: user.jobTitle,
      );
}

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<UserEntity>> findAllUsers();

  @Query('SELECT * FROM User WHERE email = :email')
  Future<UserEntity?> findUserByEmail(String email);

  @insert
  Future<void> insertUser(UserEntity user);

  @update
  Future<void> updateUser(UserEntity user);

  @delete
  Future<void> deleteUser(UserEntity user);
}
