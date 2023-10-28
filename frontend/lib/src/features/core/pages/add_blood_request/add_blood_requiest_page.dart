import 'package:flutter/material.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/constants/sizes.dart';
import 'package:frontend/src/features/core/pages/add_blood_request/widgets/blood_request_form_widget.dart';

class AddBloodRequestPage extends StatelessWidget {
  const AddBloodRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Blood Request",
          style: TextStyle(
            color: cPrimaryColor, // Set your preferred color
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Set your preferred color
        elevation: 0, // Remove the app bar shadow
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(cDefaultSize),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BloodRequiestFormWidget(),
              SizedBox(height: cDefaultSize - 10),
            ],
          ),
        ),
      ),
    );
  }
}
