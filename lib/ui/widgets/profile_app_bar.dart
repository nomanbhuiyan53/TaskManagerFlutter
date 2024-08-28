import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import '../screen/page/update_profile_screen.dart';
import '../screen/sign_in_screen.dart';
import '../utility/app_colors.dart';
import 'network_cached_image.dart';

AppBar buildAppBar(context, [bool isUpdateProfileScreen = false]) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    title: GestureDetector(
      onTap: () {
        if (isUpdateProfileScreen) return;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateProfileScreen()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AuthController.userData?.fullName ?? '',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            AuthController.userData?.email ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    ),
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 50,
        child: NetworkCachedImage(imageUrl: 'https://picsum.photos/200'),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () async {
            await AuthController.clearData();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                (route) => false);
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ))
    ],
  );
}
