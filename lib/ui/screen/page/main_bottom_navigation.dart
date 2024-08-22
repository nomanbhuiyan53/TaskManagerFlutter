import 'package:flutter/material.dart';
import 'package:tasksystem/ui/screen/page/completed_screen.dart';
import 'package:tasksystem/ui/screen/page/new_task_screen.dart';
import 'package:tasksystem/ui/screen/page/progress_screen.dart';
import 'package:tasksystem/ui/utility/app_colors.dart';

import '../../widgets/profile_app_bar.dart';
import 'cancelled_screen.dart';

class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({super.key});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {

  int _selectedIndex = 0;

  final List<Widget>  _screens = const [
    NewTaskScreen(),
    CompletedScreen(),
    ProgressScreen(),
    CancelledScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedIndex = index;
          if(mounted){
            setState(() {});
          }
        } ,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.file_present),label: "New Task"),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.autorenew),label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel),label: "Cancelled"),
      ],),
    );
  }
}
