import 'dart:async';
import 'package:floor/floor.dart';
import 'user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

/// Represents the local database for the application.
@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  /// Provides access to the UserDao.
  UserDao get userDao;
}
