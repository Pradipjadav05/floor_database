import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database/database/entity/user_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/user_dao.dart';

part 'database.g.dart';

@Database(version: 2, entities: [UserTable,TableTmp])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  TableTmpDao get tableDao;
}
