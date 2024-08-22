import 'package:flutter/material.dart';
import '../../widgets/task_item_card.dart';
import '../../widgets/task_summery_card.dart';
import 'add_new_task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(children: [
          buildSingleChildScrollView(),
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
      floatingActionButton: FloatingActionButton(onPressed: _addnewtaskbtn, child: const Icon(Icons.add)),
    );
  }

  void _addnewtaskbtn() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTask()));
  }

  Widget buildSingleChildScrollView() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TaskSummeryCard(
            title: 'New Task',
            count: '25',
          ),
          TaskSummeryCard(
            title: 'Completed',
            count: '12',
          ),
          TaskSummeryCard(
            title: 'Progress',
            count: '13',
          ),
          TaskSummeryCard(
            title: 'Cancelled',
            count: '09',
          ),
        ],
      ),
    );
  }
}

