import 'package:flutter/material.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/custom_text_field.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({
    super.key,
    required this.name,
    required this.email,
    required this.password,
    required this.numberOfCards,
    required this.numberOfBankAccount,
  });

  final String name;
  final String email;
  final String password;
  final int numberOfCards;
  final int numberOfBankAccount;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberOfCardController = TextEditingController();
  final TextEditingController _numberOfBankAccountController =
      TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.name;
    _emailController.text = widget.email;
    _passwordController.text = widget.password;
    _numberOfCardController.text = widget.numberOfCards.toString();
    _numberOfBankAccountController.text = widget.numberOfBankAccount.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          labelName: "Password",
          textEditingController: _passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          labelName: "Number of cards",
          textEditingController: _numberOfCardController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          labelName: "Number of Bank Accounts",
          textEditingController: _numberOfBankAccountController,
        ),
        const SizedBox(height: 20),
        FilledButton(onPressed: () {}, child: Text("Update Profile")),
      ],
    );
  }
}
