
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:statemanagementproject/blocs/screens/forgot_password.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/first_regestration _widgets/custom_divider.dart';
import '../../widgets/second_regestration_widgets/google_button.dart';
import 'package:http/http.dart' as http;
import 'multistep.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  TextEditingController emailCo=TextEditingController();
  final  TextEditingController passCo=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "تسجيل الدخول",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF101C2D),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF66768E),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap:(){   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen1(),));},
                    child: Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F3A4C),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomInputField(labelText: "البريد الالكتروني", hintText: "coach@fit.hub", obscureText: false, controller: TextEditingController(),),
              SizedBox(height: 16),
              CustomInputField(labelText: "كلمة المرور", hintText: "كلمة المرور", obscureText:false, controller: TextEditingController(),),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen(),)),
                  child: Text(
                    "نسيت كلمة المرور؟",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2F3A4C),
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0560FD),
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: ()=>postDataLogin()
                  // Implement login logic here
                ,
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 24),
              CustomDivider(),
              SizedBox(height: 16),
              GestureDetector(
                  onTap:()=> onButtonTapped(context),
                  child: GoogleButton()),
            ],
          ),
        ),
      ),
    );
  }

  postDataLogin(

      ) async {

    Map logindata = {
      "email": emailCo.text.trim(),
      "password": passCo.text.trim()


    };
    try {
      print(logindata.toString());
      var response1;

      http.Response response = await http.post(
        Uri.parse(
            "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/user/login"),
        headers: {
          "Content-Type" : "application/json",
          "Accept" : "application/json",
        },
        body: jsonEncode(logindata),
      );
      print(response.body.toString());
      print(response.body);

      // jsonDecode(response.body);
      //  var dataE= jsonEncode(response) as Map ;
      if (response.statusCode == 200 || response.statusCode == 201 ||
          response.statusCode == 204 ) {
        final json=jsonDecode(response.body);

        //var token= json["user"]["token"];
         token= json["user"]["token"];
        print(token);
        // Registration successful
        print('Registration successful');
      } else {
        // Registration failed
        print('Registration failed');
      }

      return response.body;
      // return 5 ;
    }catch(e){
      print(e);
    }
  }
}
String token='';

