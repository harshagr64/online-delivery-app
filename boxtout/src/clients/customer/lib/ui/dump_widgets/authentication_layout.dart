import 'package:customer/ui/shared/styles.dart';
import 'package:customer/ui/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? mainButtonTitle;
  final bool showTermsText;
  final Widget? form;
  final Function? onMainButtonTapped;
  final Function? onNewAccountCreatTapped;
  final Function? onForgotPasswordTapped;
  final Function? onBackPressed;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key? key,
    this.title,
    this.subtitle,
    this.mainButtonTitle,
    this.showTermsText = false,
    this.form,
    this.onMainButtonTapped,
    this.onNewAccountCreatTapped,
    this.onForgotPasswordTapped,
    this.onBackPressed,
    this.validationMessage,
    this.busy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: onBackPressed as void Function()?,
            ),
          Text(
            title!,
            style: TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.7),
              child: Text(
                subtitle!,
                style: ktsMediumGreyBodyText,
              ),
            ),
          ),
          verticalSpaceRegular,
          form!,
          verticalSpaceRegular,
          if (onForgotPasswordTapped != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgotPasswordTapped as void Function()?,
                child: Text(
                  'Forget Password?',
                  style: ktsMediumGreyBodyText.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: kBodyTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped as void Function()?,
            child: Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(
                      mainButtonTitle!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
            ),
          ),
          verticalSpaceRegular,
          if (onNewAccountCreatTapped != null)
            GestureDetector(
              onTap: onNewAccountCreatTapped as void Function()?,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  horizontalSpaceTiny,
                  Text(
                    'Create new account',
                    style: TextStyle(
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          if (showTermsText)
            Text(
              'By signing up you are agree to our terms, conditions and privacy policy.',
              style: ktsMediumGreyBodyText,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
