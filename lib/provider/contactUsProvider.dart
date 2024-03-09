import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/models/contactUsModel.dart';
import 'package:portfolio/models/headerModel.dart';
import 'package:portfolio/supabaseServices/contactUsService.dart';

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
        isSuccess = res.isSuccess;
        isLoading = false;
        notifyListeners();
      } else {
        Fluttertoast.showToast(msg: "Already sent your details");
      }
    }
  }
}
