import 'package:floor/floor.dart';

@Entity(tableName: "user")
class UserTable {
  @PrimaryKey(autoGenerate: true)
  late final int? id;
  late final String name;
  late final String email;

  UserTable({this.id, required this.name, required this.email});
}

@Entity(tableName: 'table_tmp')
class TableTmp {
  @ForeignKey(childColumns: ["fid"], parentColumns: ["id"], entity: UserTable)
  late final int fid;
  @PrimaryKey(autoGenerate: true)
  late final int? pid;
  late final String someData;
  late final String someData2;


  TableTmp({required this.fid, this.pid, required this.someData, required this.someData2});
}
