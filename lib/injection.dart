import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:hometest/data/local/user_dao.dart';
import 'package:hometest/data/local/app_database.dart';
import 'package:hometest/repository/user_repository.dart';

final getIt = GetIt.instance;

/// Initializes the GetIt instance with the necessary dependencies.
Future<void> setup() async {
  // Floor database instance (await builder)
  final database = await $FloorAppDatabase
      .databaseBuilder('app_database_2.db')
      .addCallback(
        Callback(
          onCreate: (db, version) async {
            print('Database created with version $version');

            await db.execute(
              "INSERT INTO User (email, name, password, jobTitle) VALUES "
              "('alice@e.com', 'Alice', '12345', 'Developer'),"
              "('bob@e.com', 'Bob', '12345', 'Designer'),"
              "('carol@e.com', 'Carol', '12345', 'Product Manager');",
            );
          },
          onOpen: (db) async {
            print('Database opened');
          },
        ),
      )
      .build();

  getIt
    ..registerSingleton<AppDatabase>(database)

    // DAOs

    ..registerSingleton(database.userDao)

    // Repositories
    ..registerLazySingleton(() => UserRepository(
          userDao: getIt<UserDao>(),
        ));
}
