import 'package:flutter/material.dart';

class TaskSummeryCard extends StatelessWidget {
  const TaskSummeryCard({
    super.key, required this.title, required this.count,
  });

  final String title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(count.toString(),style: Theme.of(context).textTheme.titleLarge,),
            Text(title.toString())
          ],
        ),
      ),
    );
  }
}