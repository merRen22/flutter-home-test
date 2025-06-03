import 'package:hometest/data/local/user_dao.dart';
import 'package:hometest/data/models/user.dart';

/// Repository for managing user data.
class UserRepository {
  /// Constructor for [UserRepository]
  UserRepository({
    required this.userDao,
  });

  final UserDao userDao;

  /// TODO add usage of either class
  Future<User> getUser(String email) async {
    final localUserEntity = await userDao.findUserByEmail(email);
    return localUserEntity!.toUser();
  }
}
