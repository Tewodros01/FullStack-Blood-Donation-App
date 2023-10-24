import 'package:flutter/material.dart';
import 'package:frontend/src/constants/image_strings.dart';
import 'package:frontend/src/constants/sizes.dart';
import 'package:frontend/src/constants/text_string.dart';
import 'package:frontend/src/features/authentication/pages/signup_page/signup_screen.dart';
import 'package:get/get.dart';

class SignInFooterWidget extends StatelessWidget {
  const SignInFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // const Text("OR"),
        // const SizedBox(height: cFormHeigth - 10),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     icon: const Image(
        //       width: 20.0,
        //       image: AssetImage(cGoogleLogoImage),
        //     ),
        //     onPressed: () {},
        //     label: const Text(cSignInWithGoogle),
        //   ),
        // ),
        const SizedBox(height: cFormHeigth - 10),
        TextButton(
          onPressed: () {
            Get.to(() => const SignUpPage());
          },
          child: Text.rich(
            TextSpan(
              text: "dontHaveAccount?".tr,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: "SignUp".tr,
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
