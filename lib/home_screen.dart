import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

import 'database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// final databasd = AppDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floor database"),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Text("data"),
        ],
      ),
    );
  }
}
