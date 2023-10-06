import 'package:floor/floor.dart';
import 'package:floor_database/database/entity/user_table.dart';

@dao
abstract class UserDao {
  @Query("SELECT * FROM user")
  Future<List<UserTable>> getAllUsers();

  @insert
  Future<int> insertUser(UserTable user);

  @update
  Future<int> updateUser(UserTable user);

  @delete
  Future<int> deleteUser(int id);
}
