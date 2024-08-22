import 'package:flutter/material.dart';
import 'package:tasksystem/ui/widgets/profile_app_bar.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child:  Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Task',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Subject',
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child:const Icon(Icons.arrow_circle_right_outlined,size: 25,)),
          ],
        ),
      ),
    );
  }
}
