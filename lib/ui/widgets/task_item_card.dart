import 'package:flutter/material.dart';

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: const Text(
          "lorem ipsum",
          style:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Are you feeling stuck or overwhelmed in your coding journey? Don't worry, I've got your back! "),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Date : 12/02/2023",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text("New",style: TextStyle(color: Colors.white,fontSize: 14),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  backgroundColor: Colors.lightBlue,

                ),
                ButtonBar(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete,color: Colors.deepOrange,)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit,color:Colors.teal ,)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
