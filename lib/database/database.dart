import 'package:floor/floor.dart';
import 'package:floor_database/database/entity/user_table.dart';

@Database(version: 1, entities: [UserTable])
abstract class AppDatabase extends FloorDatabase {
  UserTable get userDao;
}