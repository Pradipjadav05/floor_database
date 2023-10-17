// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  TableTmpDao? _tableDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `email` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `table_tmp` (`fid` INTEGER NOT NULL, `pid` INTEGER PRIMARY KEY AUTOINCREMENT, `someData` TEXT NOT NULL, `someData2` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  TableTmpDao get tableDao {
    return _tableDaoInstance ??= _$TableTmpDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userTableInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                }),
        _userTableUpdateAdapter = UpdateAdapter(
            database,
            'user',
            ['id'],
            (UserTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                }),
        _userTableDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (UserTable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserTable> _userTableInsertionAdapter;

  final UpdateAdapter<UserTable> _userTableUpdateAdapter;

  final DeletionAdapter<UserTable> _userTableDeletionAdapter;

  @override
  Future<List<UserTable>> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => UserTable(
            id: row['id'] as int?,
            name: row['name'] as String,
            email: row['email'] as String));
  }

  @override
  Future<int> insertUser(UserTable user) {
    return _userTableInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateUser(UserTable user) {
    return _userTableUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUser(UserTable user) {
    return _userTableDeletionAdapter.deleteAndReturnChangedRows(user);
  }
}

class _$TableTmpDao extends TableTmpDao {
  _$TableTmpDao(
    this.database,
    this.changeListener,
  ) : _tableTmpInsertionAdapter = InsertionAdapter(
            database,
            'table_tmp',
            (TableTmp item) => <String, Object?>{
                  'fid': item.fid,
                  'pid': item.pid,
                  'someData': item.someData,
                  'someData2': item.someData2
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<TableTmp> _tableTmpInsertionAdapter;

  @override
  Future<int> insertTemp(TableTmp tmp) {
    return _tableTmpInsertionAdapter.insertAndReturnId(
        tmp, OnConflictStrategy.abort);
  }
}
