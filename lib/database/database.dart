import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database/database/entity/user_table.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [UserTable])
abstract class AppDatabase extends FloorDatabase {
  UserTable get userDao;
}