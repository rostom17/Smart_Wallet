import 'package:flutter/material.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/custom_text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({
    super.key,
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            labelName: "Name",
            textEditingController: _nameController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelName: "Email",
            textEditingController: _emailController,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelName: "Current Password",
            textEditingController: _passwordController,
            isPassword: true,
          ),
          const SizedBox(height: 20),
          CustomTextField(
            labelName: "New Password",
            textEditingController: _newPasswordController,
            isPassword: true,
          ),
          const SizedBox(height: 20),

          FilledButton(onPressed: () {}, child: Text("Update Profile")),
        ],
      ),
    );
  }
}
