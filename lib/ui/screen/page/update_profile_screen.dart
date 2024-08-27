import 'package:flutter/material.dart';
import 'package:tasksystem/ui/widgets/backgroud_widget.dart';
import 'package:tasksystem/ui/widgets/profile_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, true),
      body: BackgroudWidget(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Update Profile',style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  _buildPhotoPickerWidget(),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _phoneNameController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){}, child: const Icon(Icons.arrow_circle_right_outlined,size: 25,)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPickerWidget() {
    return Container(
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 100,
                  height: 48,
                  decoration:const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  alignment: Alignment.center,
                  child:const Text('Photo',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                ),
              );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNameController.dispose();
    super.dispose();
  }
}
