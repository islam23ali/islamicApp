import 'package:flutter/material.dart';
import 'package:islamic_app/presentation/register_screen/widget/top_appbar.dart';

class MyHabitsScreen extends StatefulWidget {
  const MyHabitsScreen({Key? key}) : super(key: key);

  @override
  _MyHabitsScreenState createState() => _MyHabitsScreenState();
}

class _MyHabitsScreenState extends State<MyHabitsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      TopAppBar()
    ],));
  }
}
