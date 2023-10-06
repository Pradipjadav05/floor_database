import 'package:floor/floor.dart';

@Entity(tableName: "user")
class UserTable {
  @PrimaryKey(autoGenerate: true)
  late final int? id;
  late final String name;
  late final String email;

  UserTable(this.id, this.name, this.email);
}
