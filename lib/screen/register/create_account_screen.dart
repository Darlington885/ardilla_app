import 'package:ardilla/constants/colors.dart';
import 'package:ardilla/constants/fonts.dart';
import 'package:ardilla/constants/image_asset.dart';
import 'package:ardilla/constants/text_string.dart';
import 'package:ardilla/screen/auth/login_screen.dart';
import 'package:ardilla/store/register_store/register_store.dart';
import 'package:ardilla/utils/alert_dialog.dart';
import 'package:ardilla/utils/navigators.dart';
import 'package:ardilla/widgets/button.dart';
import 'package:ardilla/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

var registerStore = RegisterStore();
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key key}) : super(key: key);
  static const routeName = '/createAccount';

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController inviteController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    inviteController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
   registerStore.setupValidations();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 60),
        children: [
        Row(children: [
          InkWell(
            onTap: () {
              popView(context);
            },
            child: Container(
              decoration: BoxDecoration(
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  assetBackArrow,
                  height: 18.95,
                  width: 10.85,
                  //color: AppColors.textColor,
                ),
              ),
            ),
          ),
          Expanded(child: Container(),)
        ],),

        Text(
          accountText,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 36,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        SizedBox(height: 20,),
        Observer(
          builder: (_) =>InputField(
            controller:usernameController,
            type: TextInputType.text,
            hint: 'Username',
            onChanged: (text) {
              registerStore.username = text;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetUsername, height: 18, width: 18,),
            ),
            message: registerStore.error.username,
            error: registerStore.error.username!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        Observer(
          builder: (_) =>InputField(
            controller: firstNameController,
            type: TextInputType.text,
            hint: 'First Name',
            onChanged: (text) {
              registerStore.firstName = text;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetPerson, height: 18, width: 18,),
            ),
            message: registerStore.error.firstName,
            error: registerStore.error.firstName!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        Observer(
          builder: (_) =>InputField(
            controller: lastNameController,
            type: TextInputType.text,
            hint: 'Last Name',
            onChanged: (text) {
              registerStore.lastName = text;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetPerson, height: 18, width: 18,),
            ),
            message: registerStore.error.lastName,
            error: registerStore.error.lastName!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        Observer(
          builder: (_) =>InputField(
            controller: phoneController,
            type: TextInputType.phone,
            hint: 'Phone Number',
            onChanged: (text) {
              registerStore.phoneNumber = text;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetPhone, height: 18, width: 18,),
            ),
            message: registerStore.error.phoneNumber,
            error: registerStore.error.phoneNumber!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        Observer(
          builder: (_) =>InputField(
            controller: inviteController,
            type: TextInputType.text,
            hint: 'Invite code (optional)',
            onChanged: (text) {
              registerStore.invite_code = text;
            },
            prefixIcon: Padding(
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetInvite, height: 18, width: 18,),
            ),
            message: registerStore.error.invite_code,
            error: registerStore.error.invite_code!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        Observer(
          builder: (_) =>InputField(
            controller: passwordController,
            type: TextInputType.text,
            hint: 'Password',
            onChanged: (text) {
              registerStore.password = text;

            },
            prefixIcon: Padding(
              //padding: const EdgeInsets.only(left: 20, right: 4),
              padding: const EdgeInsets.all(15),
              child:   Image.asset(assetLock, height: 18, width: 18,),
            ),
            message: registerStore.error.password,
            error: registerStore.error.password!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        SizedBox(height: 10,),
        Center(
          child: InkWell(
            child: RichText(
              text: TextSpan(
                text: 'By Signing Up , You’re agreeing to our',
                style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.Cabinet_Grotesk,
                    fontStyle: FontStyle.normal
                ),
                children: const <TextSpan>[
                  TextSpan(
                      text: ' Terms and\nConditions and Privacy Policy', style: TextStyle(
                      color: AppColors.lightPurpleColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontStyle: FontStyle.normal)),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                  context, CreateAccountScreen.routeName);
            },
          ),
        ),

        SizedBox(height: 10.0,),
        Container(
          height: 54,
          decoration: BoxDecoration(border: Border.all(color: AppColors.lightPurpleColor, ),
              borderRadius: BorderRadius.circular(24.0)
          ),
          width: double.infinity,
          child: Button(
              text: 'Create Account',
              onPressed:  () {
                FocusScope.of(context).unfocus();
                if(registerStore.hasErrors){
                return;
                 }
                else if(usernameController.text == null || usernameController.text == ""){
                  registerStore.error.username = "Please enter username";
                }else if(firstNameController.text == null || firstNameController.text == ""){
                  registerStore.error.firstName = "Please enter firstName";
                }else if(lastNameController.text == null || lastNameController.text == ""){
                  registerStore.error.lastName = "Please enter lastName";
                }else if(phoneController.text == null || phoneController.text == ""){
                  registerStore.error.phoneNumber = "Please enter Phone Number";
                }else if(inviteController.text == null || inviteController.text == ""){
                  registerStore.error.invite_code = "Please enter Invite Code";
                }else if(passwordController.text == null || passwordController.text == ""){
                  registerStore.error.password = "Please enter Password";
                }
                else {
                  openDialog(
                      CustomPopupDialog(
                        title: regSuccess,
                        description: regSuccessDesc,
                        buttonText: "Continue",
                        img: assetImageThumbs,
                        onButtonPressed: (){
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),
                      context);
                }
              },
              //loading: registerStore.loading,
              loaderColor: Colors.white,
              textColor: Colors.white,
              color:  AppColors.lightPurpleColor
          ),
        ),
      ],),
    );
  }
}
