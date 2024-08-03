import 'package:flutter/material.dart';
import 'package:vocabulary_note/ui/widgets/home/home_app_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

