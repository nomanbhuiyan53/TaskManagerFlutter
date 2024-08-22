import 'package:flutter/material.dart';
import '../../widgets/task_item_card.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const TaskItemCard();
              },
              itemCount: 10,
            ),
          )
        ]),
      ),
    );
  }
}
