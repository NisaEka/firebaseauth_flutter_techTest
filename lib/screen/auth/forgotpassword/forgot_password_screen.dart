import 'package:flutter/material.dart';
import 'package:tech_test/const/color.dart';
import 'package:tech_test/const/textstyle.dart';
import 'package:tech_test/reusable/form/customfilledbutton.dart';
import 'package:tech_test/screen/auth/forgotpassword/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
        init: ForgotPasswordController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              // backgroundColor: Color(0xffEFF1F3),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/img/forgotpass.png"),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Forgot Your Password?", style: titleTextStyle.copyWith(fontSize: 25)),
                            Text("\nPlease enter the email associated with your account."),
                            SizedBox(height: 25),
                            RichText(
                              text: TextSpan(
                                text: 'Email ',style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                    hintText: "Input Your Email",
                                    hintStyle: hintTextStyle),
                              ),
                            ),
                            SizedBox(height: 25),
                            CustomFilledButton(color: infoColor, title: "Reset Password", onPressed: () => controller.resetPassword(),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
