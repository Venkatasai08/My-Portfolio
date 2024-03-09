import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/globals/app_buttons.dart';
import 'package:portfolio/helper%20class/helper_class.dart';
import 'package:portfolio/provider/contactUsProvider.dart';
import 'package:portfolio/views/contact_us_textfeild.dart';
import 'package:provider/provider.dart';

import '../globals/app_colors.dart';
import '../globals/app_text_styles.dart';
import '../globals/constants.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ContactUsProvider contactUsProvider = context.read();
    Widget sendButton() {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () {
            contactUsProvider.sendTheAdvice();
          },
          child: Card(
            color: AppColors.themeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child:
                  Consumer<ContactUsProvider>(builder: (context, value, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    if (value.isSuccess)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Icon(Icons.check),
                      ),
                    if (value.isLoading)
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                );
              }),
            ),
          ),
        ),
      );
    }

    Widget buildForm() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          buildContactText(),
          Constants.sizedBox(height: 40.0),
          Row(
            children: [
              Expanded(
                child: ContactTextFeild(
                  hintText: "Full Name",
                  controller: contactUsProvider.nameController,
                ),
              ),
              Expanded(
                child: ContactTextFeild(
                  hintText: "Email",
                  controller: contactUsProvider.emailController,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ContactTextFeild(
                  hintText: "Mobile number",
                  controller: contactUsProvider.phoneController,
                ),
              ),
              Expanded(
                child: ContactTextFeild(
                  hintText: "Subject",
                  controller: contactUsProvider.subjectController,
                ),
              ),
            ],
          ),
          ContactTextFeild(
            hintText: "Description",
            controller: contactUsProvider.descriptionController,
            maxLines: 8,
          ),
          sendButton()
        ],
      );
    }

    return Form(
      key: contactUsProvider.formKey,
      child: HelperClass(
        mobile: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            buildContactText(),
            Constants.sizedBox(height: 40.0),
            ContactTextFeild(
              hintText: "Full Name",
              controller: contactUsProvider.nameController,
            ),
            ContactTextFeild(
              hintText: "Email",
              controller: contactUsProvider.emailController,
            ),
            ContactTextFeild(
              hintText: "Mobile number",
              controller: contactUsProvider.phoneController,
            ),
            ContactTextFeild(
              hintText: "Subject",
              controller: contactUsProvider.subjectController,
            ),
            ContactTextFeild(
              hintText: "Description",
              controller: contactUsProvider.descriptionController,
              maxLines: 8,
            ),
            sendButton()
          ],
        ),
        tablet: buildForm(),
        desktop: buildForm(),
        paddingWidth: size.width * 0.2,
        bgColor: AppColors.bgColor2,
      ),
    );
  }

  FadeInDown buildContactText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'Contact ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Me!',
              style: AppTextStyles.headingStyles(
                  fontSize: 30, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
