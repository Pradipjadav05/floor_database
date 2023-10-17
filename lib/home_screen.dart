import 'package:flutter/material.dart';

import 'database/database.dart';
import 'database/entity/user_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic database;
  List<UserTable> users = [];

  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor database"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          UserTable data = users[index];
          return ListTile(
            leading: CircleAvatar(child: Text("${data.id}")),
            title: Text(data.name),
            subtitle: Text(data.email),
            trailing: IconButton(
              onPressed: () async {
                final user =
                    UserTable(id: data.id, name: data.name, email: data.email);
                int res = await database.userDao.deleteUser(user);
                debugPrint("record deleted $res");
                getData();
              },
              icon: const Icon(Icons.delete),
            ),
            onLongPress: () async {
              final user = UserTable(
                  id: data.id,
                  name: 'Pradip Jadav',
                  email: 'jadavpradip2002@gmail.com');
              int res = await database.userDao.updateUser(user);
              debugPrint("Record inserted $res");
              getData();
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final user =
              UserTable(name: 'John Doe', email: 'johndoe@example.com');
          int res = await database.userDao.insertUser(user);
          TableTmp t = TableTmp(fid: 1, someData: "abc", someData2: '');
          await database.tableDao.insertTemp(t);
          debugPrint("Record inserted $res");
          getData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  initializeDatabase() async {
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    getData();
  }

  void getData() async {
    final res = await database.userDao.getAllUsers();

    setState(() {
      users = res;
    });
    for (final user in res) {
      debugPrint(
          "User ID: ${user.id}, Name: ${user.name}, Email: ${user.email}");
    }
  }
}
