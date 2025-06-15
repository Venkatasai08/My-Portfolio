import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/globals/app_assets.dart';
import 'package:portfolio/models/contactUsModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/supabaseServices/contactUsService.dart';
import 'dart:html' as html;

class ContactUsProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ContactUsService contactUsService = ContactUsService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool isLoading = false;
  bool isSuccess = false;
  void composeEmail() {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: AppAssets.mailLink,
      queryParameters: {
        'subject': '#Contact me ${subjectController.text.trim()}',
        'body': '''
Greeting of the day 

Name : ${nameController.text.trim()}
Email : ${emailController.text.trim()}
Phone number: ${phoneController.text.trim()}
Subject : ${subjectController.text.trim()}
Description : ${descriptionController.text.trim()}




Thank you
''',
      },
    );
    html.window.open(emailUri.toString().replaceAll("+", " "), 'Email');
  }

  sendTheAdvice() async {
    if (formKey.currentState!.validate()) {
      if (isSuccess == false) {
        isLoading = true;
        notifyListeners();
        ContactUsModel model = ContactUsModel(
            fullName: nameController.text.trim(),
            email: emailController.text.trim(),
            mobileNumber: phoneController.text.trim(),
            subject: subjectController.text.trim(),
            description: descriptionController.text.trim());
        ResponseModel res = await contactUsService.sendContact(model);
        composeEmail();
        isSuccess = res.isSuccess;
        isLoading = false;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Already sent your details");
      }
    }
  }
}
