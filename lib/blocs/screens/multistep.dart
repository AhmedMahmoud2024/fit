
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagementproject/blocs/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import '../../widgets/Location_Screen/location_bottom_sheet.dart';
import '../../widgets/body_status/body_status_card.dart';
import '../../widgets/custom_heading.dart';
import '../../widgets/custom_input_field.dart';
import '../../widgets/first_regestration _widgets/custom_divider.dart';
import '../../widgets/first_regestration _widgets/dropdown_field.dart';
import '../../widgets/first_regestration _widgets/terms_checkbox.dart';
import '../../widgets/gender_Screen/gender_card.dart';
import '../../widgets/gender_Screen/next_button.dart';
import '../../widgets/gender_Screen/previous_button.dart';
import '../../widgets/goal_card.dart';
import '../../widgets/important_sports/sport_card.dart';
import '../../widgets/second_regestration_widgets/google_button.dart';
import '../../widgets/second_regestration_widgets/phone_input_field.dart';
import '../../widgets/skill_card.dart';
import '../../widgets/training_environment/training_environment_card.dart';
import '../../widgets/training_style_card.dart';
import '../../widgets/weight_and_hight/custom_input.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  int currentStep = 0;
  final _formData = <String, dynamic>{};
  final _formKey = GlobalKey<FormState>();

  final List<Widget> _formSteps = [
    RegistrationScreen1(),
    RegistrationPage2(),
    GenderFormScreen(),
    LocationFormScreen(),
    WeightHeightFormScreen(),
    SkillsLevelFormScreen(),
    SportsFormScreen(),
    GoalsFormScreen(),
    TrainingStyleFormScreen(),
    TrainingEnvironmentFormScreen(),
    BodyStatusFormScreen(),
  ];

  void _nextStep() {
    if (currentStep < _formSteps.length - 1) {
      setState(() {
        currentStep++;
      });
    }
  }

  void _prevStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
   //   postData1();
      // Send _formData to backend
      print(_formData); // Replace this with your backend API call logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(child: _formSteps[currentStep]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentStep > 0)
                    ElevatedButton(
                      onPressed: _prevStep,
                      child: Text('Previous'),
                    ),
                  if (currentStep < _formSteps.length - 1)
                    ElevatedButton(
                      onPressed: _nextStep,
                      child: Text('Next'),
                    )
                  else
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit'),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController authController = TextEditingController();
final TextEditingController dateOfBirthController = TextEditingController();
final TextEditingController genderCon = TextEditingController();
final TextEditingController ageCon = TextEditingController();
final TextEditingController weightCon = TextEditingController();
final TextEditingController heightCon = TextEditingController();
final TextEditingController goalCon = TextEditingController();
final TextEditingController experienceCon = TextEditingController();
final TextEditingController bodyFatPercentageCon = TextEditingController();
final TextEditingController muscleMassCon = TextEditingController();
final TextEditingController preferredExerciseTypesCon = TextEditingController();
final TextEditingController workoutFrequencyPreferenceCon = TextEditingController();
final TextEditingController workoutDurationPreferenceCon = TextEditingController();
final TextEditingController trainingEnvironmentPreferenceCon = TextEditingController();
final TextEditingController accessToEquipmentCon = TextEditingController();
final TextEditingController motivationLevelCon = TextEditingController();
final TextEditingController stressLevelsCon = TextEditingController();
final TextEditingController governorateCon = TextEditingController();
final TextEditingController cityCon = TextEditingController();
final TextEditingController phoneCon = TextEditingController();

class RegistrationScreen1 extends StatelessWidget {
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
                "إنشاء حساب",
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
                    "لديك حساب بالفعل؟",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF66768E),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap:(){   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));},
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F3A4C),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),

              CustomInputField(labelText: "الأسم بالكامل", hintText: "محمد عزت", obscureText: false, controller:nameController,),
              SizedBox(height: 16),
              CustomInputField(labelText: "البريد الإلكتروني", hintText: "البريد الإلكتروني", obscureText: false, controller: emailController,),
              SizedBox(height: 16),
              CustomInputField(labelText: "كلمة المرور", hintText: "كلمة المرور", obscureText: true, controller: passwordController),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  "يجب أن تكون كلمة المرور 8 أحرف على الأقل.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF66768E),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 24),
              TermsCheckbox(),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0560FD),
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Implement registration logic here
                },
                child: GestureDetector(
                  onTap:(){   Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage2(),));},
                  child: Text(
                    "إنشاء الحساب",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),
              CustomDivider(),
              SizedBox(height: 16),
              GoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}


class RegistrationPage2 extends StatelessWidget {
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
                "أكمل التسجيل",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF101C2D),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 8),
              Text(
                "أكمل أنشاء حسابك بإدخال البيانات ادناه ",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF66768E),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              CustomInputField(labelText: 'zsc',hintText: '',controller: phoneCon,obscureText: false,),
              SizedBox(height: 16),
              CustomInputField(labelText: "تاريخ الميلاد", hintText: "24/3/2002", obscureText: false, controller: dateOfBirthController,),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => LocationFormScreen(),)),
                        child: DropdownField(labelText: "المدينة", value: "مدينة نصر",controller:cityCon ,)),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownField(labelText: "المحافظة", value: "القاهرة",controller: governorateCon,),
                  ),
                ],
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
                onPressed: () {
                  // Implement form submission logic here
                },
                child: GestureDetector(
                  onTap:(){   Navigator.push(context, MaterialPageRoute(builder: (context) => GenderFormScreen(),));},
                  child: Text(
                    "التالي",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _selectedGender = '';
class GenderFormScreen extends StatefulWidget {
  const GenderFormScreen({super.key});

  @override
  _GenderFormScreenState createState() => _GenderFormScreenState();
}

class _GenderFormScreenState extends State<GenderFormScreen> {
 // String _selectedGender = '';

  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  void _submitGender() {
    if (_selectedGender.isNotEmpty) {
      // Implement submission logic here
      print('Selected Gender: $_selectedGender');
      Navigator.push(context, MaterialPageRoute(builder: (context) => WeightHeightFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select a gender');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 1',
                question: 'اى واحد من هؤلاء انت؟',
                subtitle: 'لنمنحك تجربة أكثر تخصيصًا، نحتاج إلى معرفة المزيد عنك',
              ),
              SizedBox(height: 32),
              GenderCard(
                gender: 'ذكر',
                isSelected: _selectedGender == 'ذكر',
                onSelect: _selectGender,
                // imageAssetPaths: {
                //   'Bg': 'assets/bg.svg',
                //   'Accesories': 'assets/accesories.svg',
                //   'Hair': 'assets/hair.svg',
                //   'Eyes': 'assets/eyes.svg',
                //   'Mouth': 'assets/mouth.svg',
                //   'Head': 'assets/head.svg',
                //   'Outfit': 'assets/outfit.svg',
                //   'Body': 'assets/body.svg',
                //   'Ellipse': 'assets/ellipse-1.svg',
                // },
              ),
              SizedBox(height: 16),
              GenderCard(
                gender: 'أنثى',
                isSelected: _selectedGender == 'أنثى',
                onSelect: _selectGender,
                // imageAssetPaths: {
                //   'Bg': 'assets/bg-2.svg',
                //   'Accesories': 'assets/accesories-2.svg',
                //   'Hair': 'assets/hair-2.svg',
                //   'Eyes': 'assets/eyes-2.svg',
                //   'Mouth': 'assets/mouth-2.svg',
                //   'Head': 'assets/head-2.svg',
                //   'Outfit': 'assets/outfit-2.svg',
                //   'Body': 'assets/body-2.svg',
                //   'Ellipse': 'assets/ellipse-1-2.svg',
                // },
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitGender,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Form'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => LocationBottomSheet(),
            );
          },
          child: Text('Select Location'),
        ),
      ),
    );
  }
}



class WeightHeightFormScreen extends StatefulWidget {

  @override
  _WeightHeightFormScreenState createState() => _WeightHeightFormScreenState();
}

class _WeightHeightFormScreenState extends State<WeightHeightFormScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  void _submitDetails() {
    final height = heightController.text;
    final weight = weightController.text;
    if (height.isNotEmpty && weight.isNotEmpty) {
      // Implement submission logic here
      print('Height: $height');
      print('Weight: $weight');
      Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsLevelFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please fill in both fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 2',
                question: 'طولك ووزنك',
                subtitle: 'لنمنحك تجربة أكثر تخصيصًا، نحتاج إلى معرفة المزيد عنك',
              ),
              SizedBox(height: 32),
              CustomInput(
                label: 'الطول',
                unit: 'سم',
                controller: heightController,
              ),
              SizedBox(height: 16),
              CustomInput(
                label: 'الوزن',
                unit: 'كج',
                controller: weightController,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitDetails),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class SkillsLevelFormScreen extends StatefulWidget {
  @override
  _SkillsLevelFormScreenState createState() => _SkillsLevelFormScreenState();
}

class _SkillsLevelFormScreenState extends State<SkillsLevelFormScreen> {
  String _selectedSkillLevel = '';

  void _selectSkillLevel(String level) {
    setState(() {
      _selectedSkillLevel = level;
    });
  }

  void _submitSkillLevel() {
    if (_selectedSkillLevel.isNotEmpty) {
      // Implement submission logic here
      print('Selected Skill Level: $_selectedSkillLevel');

      Navigator.push(context, MaterialPageRoute(builder: (context) => SportsFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select a skill level');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 3',
                question: 'ما هو مستوى مهاراتك؟',
                subtitle: 'نحتاج لمعرفه مستواك لتحديد الخطة الأنسب لك',
              ),
              SizedBox(height: 32),
              SkillCard(
                level: 'مبتدئ',
                description: "يمكنك القيام ب 5 ضغط فى المره الواحده",
               // iconPath: 'assets/other.svg',
                isSelected: _selectedSkillLevel == 'مبتدئ',
                onSelect: _selectSkillLevel,
              ),
              SizedBox(height: 8),
              SkillCard(
                level: 'متوسط',
                description: "يمكنك القيام ب 10 ضغط فى المرة الواحدة",
               // iconPath: 'assets/other-2.svg',
                isSelected: _selectedSkillLevel == 'متوسط',
                onSelect: _selectSkillLevel,
                selectedBackgroundColor: Color(0xFFE6F1FF),
                selectedBorderColor: Color(0xFF9BBFFE),
              ),
              SizedBox(height: 8),
              SkillCard(
                level: 'محترف',
                description: "يمكنك القيام ب 5 ضغط فى المرة الواحدة",
             //   iconPath: 'assets/sport.svg',
                isSelected: _selectedSkillLevel == 'محترف',
                onSelect: _selectSkillLevel,
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitSkillLevel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SportsFormScreen extends StatefulWidget {
  @override
  _SportsFormScreenState createState() => _SportsFormScreenState();
}

class _SportsFormScreenState extends State<SportsFormScreen> {
  List<String> _selectedSports = [];

  void _selectSport(String sport) {
    setState(() {
      if (_selectedSports.contains(sport)) {
        _selectedSports.remove(sport);
      } else {
        _selectedSports.add(sport);
      }
    });
  }

  void _submitSports() {
    if (_selectedSports.isNotEmpty) {
      // Implement submission logic here
      print('Selected Sports: $_selectedSports');
      Navigator.push(context, MaterialPageRoute(builder: (context) => GoalsFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one sport');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 4',
                question: 'ما هي الرياضات التى تهمك؟',
                subtitle: 'اختر واحدة أو اكثر من هذه الرياضات وسنقوم بتخصيص التطبيق لمساعدتك فى التمرن عليها',
              ),
              const SizedBox(height: 32),
              GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: (374 / 68) / (68 / 48),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                children: [
                  SportCard(
                    sport: 'كرة السلة',
                 //   iconPath: 'assets/sport.svg',
                    isSelected: _selectedSports.contains('كرة السلة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة الشاطئ',
                 //   iconPath: 'assets/sport-2.svg',
                    isSelected: _selectedSports.contains('كرة الشاطئ'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'السباحة',
                   // iconPath: 'assets/sport-3.svg',
                    isSelected: _selectedSports.contains('السباحة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'التزحلق',
                 //   iconPath: 'assets/sport-4.svg',
                    isSelected: _selectedSports.contains('التزحلق'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'البولينج',
                 //   iconPath: 'assets/sport-5.svg',
                    isSelected: _selectedSports.contains('البولينج'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة القدم الامريكية',
                   // iconPath: 'assets/sport-6.svg',
                    isSelected: _selectedSports.contains('كرة القدم الامريكية'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الالعاب الالكترونيه',
                 //   iconPath: 'assets/sport-7.svg',
                    isSelected: _selectedSports.contains('الالعاب الالكترونيه'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'التنس',
                   // iconPath: 'assets/sport-8.svg',
                    isSelected: _selectedSports.contains('التنس'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'رالى',
                 //   iconPath: 'assets/sport-9.svg',
                    isSelected: _selectedSports.contains('رالى'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'السباقات',
                 //   iconPath: 'assets/sport-10.svg',
                    isSelected: _selectedSports.contains('السباقات'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الخيل',
                 //   iconPath: 'assets/sport-11.svg',
                    isSelected: _selectedSports.contains('الخيل'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الترحلق على الجليد',
                   // iconPath: 'assets/sport-12.svg',
                    isSelected: _selectedSports.contains('الترحلق على الجليد'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'كرة الطاولة',
                  //  iconPath: 'assets/sport-13.svg',
                    isSelected: _selectedSports.contains('كرة الطاولة'),
                    onSelect: _selectSport,
                  ),
                  SportCard(
                    sport: 'الشطرنج',
                 //   iconPath: 'assets/sport-14.svg',
                    isSelected: _selectedSports.contains('الشطرنج'),
                    onSelect: _selectSport,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitSports),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoalsFormScreen extends StatefulWidget {
  @override
  _GoalsFormScreenState createState() => _GoalsFormScreenState();
}

class _GoalsFormScreenState extends State<GoalsFormScreen> {
  List<String> _selectedGoals = [];

  void _selectGoal(String goal) {
    setState(() {
      if (_selectedGoals.contains(goal)) {
        _selectedGoals.remove(goal);
      } else {
        _selectedGoals.add(goal);
      }
    });
  }

  void _submitGoals() {
    if (_selectedGoals.isNotEmpty) {
      // Implement submission logic here
      print('Selected Goals: $_selectedGoals');
      Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingStyleFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one goal');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 5',
                question: 'ما هي أهدافك؟',
                subtitle: 'بناءً على أهدافك سننشئ الخطة المناسبة للوصول لها فى بأنسب طريقة ممكنه.',
              ),
              const SizedBox(height: 32),
              GoalCard(
                title: 'فقدان الوزن',
                description: "تحقيق وزن جسم صحي من خلال تغذية متوازنة وممارسة الرياضة بانتظام، مما يؤدي إلى تحسين الصحة العامة والعافية.",
                isSelected: _selectedGoals.contains('فقدان الوزن'),
                onSelect: _selectGoal,
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'زيادة العضلات',
                description: "بناء كتلة عضلية نحينة وقوة من خلال التدريب على المقاومة المستهدفة والتغذية السليمة، مما يعزز الأداء البدني والمظهر.",
                isSelected: _selectedGoals.contains('زيادة العضلات'),
                onSelect: _selectGoal,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'لياقة عامة',
                description: "تحسين مستويات اللياقة العامة والقدرة على التحمل والقدرة على التحمل من خلال مزيج متوازن من التمارين القلبية وتدريبات القوة وتمارين المرونة.",
                isSelected: _selectedGoals.contains('لياقة عامة'),
                onSelect: _selectGoal,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'أداء رياضي',
                description: "تعزيز الأداء الرياضي ومهارات التمرين في رياضة معينة أو نشاط من خلال التدريب المركز، وتنقيح التقنيات، واستراتيجيات تحسين الأداء.",
                isSelected: _selectedGoals.contains('أداء رياضي'),
                onSelect: _selectGoal,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'المرونة والتنقل',
                description: "زيادة المرونة ونطاق الحركة وتحرك المفاصل لمنع الإصابات، وتحسين الوضع، وتعزيز أنماط الحركة الوظيفية للأنشطة اليومية والتمرين.",
                isSelected: _selectedGoals.contains('المرونة والتنقل'),
                onSelect: _selectGoal,
              ),
              const SizedBox(height: 5),
              GoalCard(
                title: 'تقليل الضغط النفسي',
                description: "تقليل مستويات الضغط النفسي، وتعزيز الاسترخاء، وتحسين الرفاهية العقلية من خلال ممارسات العقل والجسد مثل اليوغا والتأمل وتمارين التنفس العميق.",
                isSelected: _selectedGoals.contains('تقليل الضغط النفسي'),
                onSelect: _selectGoal,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitGoals),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainingStyleFormScreen extends StatefulWidget {
  @override
  _TrainingStyleFormScreenState createState() => _TrainingStyleFormScreenState();
}

class _TrainingStyleFormScreenState extends State<TrainingStyleFormScreen> {
  List<String> _selectedStyles = [];

  void _selectStyle(String style) {
    setState(() {
      if (_selectedStyles.contains(style)) {
        _selectedStyles.remove(style);
      } else {
        _selectedStyles.add(style);
      }
    });
  }

  void _submitStyles() {
    if (_selectedStyles.isNotEmpty) {
      // Implement submission logic here
      print('Selected Styles: $_selectedStyles');

      Navigator.push(context, MaterialPageRoute(builder: (context) => TrainingEnvironmentFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one style');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 6',
                question: 'اختار نمط التدريب المناسب لك؟',
                subtitle: 'تخصيص تجربة التدريب الخاصة بك داخل التطبيق وفقًا لتفضيلاتك وأسلوب التدريب المفضل لديك.',
              ),
              const SizedBox(height: 32),
              TrainingStyleCard(
                title: 'خطط التدريب الشخصية',
                description: "استلم خطط تدريب شخصية مصممة خصيصًا لأهدافك ومستوى لياقتك وتفضيلاتك، لتوجيهك خطوة بخطوة نحو تحقيق النتائج.",
                isSelected: _selectedStyles.contains('خطط التدريب الشخصية'),
                onSelect: _selectStyle,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'صفوف اللياقة الجماعية',
                description: "انضم إلى صفوف اللياقة البدنية التي يقودها المدربون وتغطي أنماط تدريب مختلفة ومستويات الشدة، مما يعزز التحفيز وروح التعاون بين المشاركين.",
                isSelected: _selectedStyles.contains('صفوف اللياقة الجماعية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'جلسات التدريب الافتراضية',
                description: "شارك في جلسات تدريب افتراضية فردية مع المدربين المعتمدين عبر المكالمات الفيديو أو الرسائل داخل التطبيق، لتلقي التوجيه والتغذية الراجعة الشخصية على تقدمك.",
                isSelected: _selectedStyles.contains('جلسات التدريب الافتراضية'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'التمارين التوجيهية الذاتية',
                description: "اتبع تمارين توجيهية ذاتية القيادة وتمارينًا تم اختيارها بعناية من قبل خبراء اللياقة، مما يتيح لك مرونة في جدول التدريب واختيار التمارين.",
                isSelected: _selectedStyles.contains('التمارين التوجيهية الذاتية'),
                onSelect: _selectStyle,
                backgroundColor: Color(0xFFE6EFFF),
              ),
              const SizedBox(height: 8),
              TrainingStyleCard(
                title: 'مزيج من أساليب التدريب',
                description: "استمتع بمزيج من الأساليب والتقنيات التوجيهية المختلفة والمصممة خصيصًا لتفضيلاتك، مما يجمع بين الخطط الشخصية وصفوف اللياقة الجماعية والتدريب الافتراضي لتجربة لياقة بدنية شاملة.",
                isSelected: _selectedStyles.contains('مزيج من أساليب التدريب'),
                onSelect: _selectStyle,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitStyles),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(68, 56),
                  side: BorderSide(color: Color(0xFFDDE4EE)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Implement skip logic here
                  print('Skip pressed');
                },
                child: Text(
                  'تخطى',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101C2D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainingEnvironmentFormScreen extends StatefulWidget {
  @override
  _TrainingEnvironmentFormScreenState createState() => _TrainingEnvironmentFormScreenState();
}

class _TrainingEnvironmentFormScreenState extends State<TrainingEnvironmentFormScreen> {
  List<String> _selectedEnvironments = [];

  void _selectEnvironment(String environment) {
    setState(() {
      if (_selectedEnvironments.contains(environment)) {
        _selectedEnvironments.remove(environment);
      } else {
        _selectedEnvironments.add(environment);
      }
    });
  }

  void _submitEnvironments() {
    if (_selectedEnvironments.isNotEmpty) {
      // Implement submission logic here
      print('Selected Environments: $_selectedEnvironments');
      //postData1(_selectedEnvironments);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BodyStatusFormScreen(),));
    } else {
      // Show an error message or toast
      print('Please select at least one environment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomHeading(
                step: 'الخطوة 7',
                question: 'ما هي بيئاتك المثالية للتدريب؟',
                subtitle: 'تحديد التمارين المناسبة لك بناءً على أماكن التدريب لا تقلق يمكنك تغيير ذلك فى الاعدادات بعد ذلك',
              ),
              const SizedBox(height: 32),
              TrainingEnvironmentCard(
                title: 'التمرين في الهواء الطلق',
                description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في الهواء الطلق مثل الركض في الحديقة أو التمارين على الشاطئ.',
                isSelected: _selectedEnvironments.contains('التمرين في الهواء الطلق'),
                onSelect: _selectEnvironment,
                backgroundColor: Color(0xFFE6EFFB),
              ),
              const SizedBox(height: 8),
              TrainingEnvironmentCard(
                title: 'صالة الألعاب الرياضية',
                description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في بيئة داخلية مجهزة مثل النوادي الرياضية أو الصالات الرياضية.',
                isSelected: _selectedEnvironments.contains('صالة الألعاب الرياضية'),
                onSelect: _selectEnvironment,
              ),
              const SizedBox(height: 8),
              TrainingEnvironmentCard(
                title: 'المنزل',
                description: 'اختر هذا الخيار إذا كنت تفضل ممارسة التمارين في راحة منزلك وباستخدام معدات التمرين الخاصة بك.',
                isSelected: _selectedEnvironments.contains('المنزل'),
                onSelect: _selectEnvironment,
              ),
              const SizedBox(height: 8),
              TrainingEnvironmentCard(
                title: 'تمارين اليوغا والاسترخاء',
                description: 'اختر هذا الخيار إذا كنت تفضل ممارسة تمارين اليوغا والاسترخاء في بيئة هادئة ومنعشة.',
                isSelected: _selectedEnvironments.contains('تمارين اليوغا والاسترخاء'),
                onSelect: _selectEnvironment,
                backgroundColor: Color(0xFFE6EFFB),
              ),
              const SizedBox(height: 8),
              TrainingEnvironmentCard(
                title: 'التمارين في مرافق متعددة',
                description: 'اختر هذا الخيار إذا كنت تفضل الاستفادة من مرافق متعددة مثل صالات الألعاب الرياضية التي توفر مجموعة متنوعة من الأنشطة الرياضية.',
                isSelected: _selectedEnvironments.contains('التمارين في مرافق متعددة'),
                onSelect: _selectEnvironment,
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PreviousButton(onPressed: () {
                    // Implement previous button logic here
                  }),
                  NextButton(onPressed: _submitEnvironments),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: const Size(68, 56),
                  side: BorderSide(color: Color(0xFFDDE4EE)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  // Implement skip logic here
                  print('Skip pressed');
                },
                child: Text(
                  'تخطى',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF101C2D),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class BodyStatusFormScreen extends StatefulWidget {
  @override
  _BodyStatusFormScreenState createState() => _BodyStatusFormScreenState();
}

class _BodyStatusFormScreenState extends State<BodyStatusFormScreen> {
  List<String>_selectedStatuses = [];

  void _selectStatus(String status) {
    setState(() {
      if (_selectedStatuses.contains(status)) {
        _selectedStatuses.remove(status);
      } else {
        _selectedStatuses.add(status);
      }
    });
  }

  void _submitStatus() {
    if (_selectedStatuses.isNotEmpty) {
      // Implement submission logic here
      print('Selected Statuses: $_selectedStatuses');
    } else {
      // Show an error message or toast
      print('Please select at least one status');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    CustomHeading(
                      step: 'الخطوة 8',
                      question: 'هل تعاني من أي إعاقة أو مرض مزمن؟',
                      subtitle: 'تساعد هذه المعلومات في اختيار التمارين و النظام والرياضات الأنسب لحالتك وأيضًا اختيار أفضل الأماكن المتاحة لك.',
                    ),
                    const SizedBox(height: 32),
                    GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 3.5,
                      ),
                      children: _buildStatusCards(),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PreviousButton(
                          onPressed: () =>
                        postData1()
                        // Implement previous button logic here

                      ),
                      NextButton(
                          onPressed:()=> _submitStatus,

                      )
                      ,
                //      postData1()
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(68, 56),
                      side: BorderSide(color: Color(0xFFDDE4EE)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {

                      // Implement skip logic here
                      print('Skip pressed');
                    },
                    child: Text(
                      'تخطى',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF101C2D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStatusCards() {
    final statuses = [
      'السكري',
      'ضغط الدم',
      'إعاقة سمعية',
      'إعاقة بصرية',
      'إعاقة حركيه',
      'إعاقة ذهنية',
      'إعاقة عقليه',
      'التوحد',
      'لا يوجد'
    ];

    return statuses.map((status) {
      return BodyStatusCard(
        status: status,
        isSelected: _selectedStatuses.contains(status),
        onSelect: _selectStatus,
      );
    }).toList();
  }
}


 postData1( ) async {

  Map data = {
    "name": nameController.text.trim(),
    "email": emailController.text.trim(),
    "authentication": {
      "password":  passwordController.text.trim()
    },
    "gender": _selectedGender,
  //  "age": ageCon.text.trim(),
    "weight":_WeightHeightFormScreenState().weightController.text.trim(),
    "height": _WeightHeightFormScreenState().weightController.text.trim(),
    "goal": _GoalsFormScreenState()._selectedGoals,
  //  "experience": experienceCon.text.trim(),
  //  "bodyFatPercentage": bodyFatPercentageCon.text.trim(),
   // "muscleMass": muscleMassCon.text.trim(),
   // "preferredExerciseTypes": preferredExerciseTypesCon.text.trim(),
  //  "workoutFrequencyPreference": workoutFrequencyPreferenceCon.text.trim(),
  //  "workoutDurationPreference": workoutDurationPreferenceCon.text.trim(),
    //"trainingEnvironmentPreference": trainingEnvironmentPreferenceCon.text.trim(),
 //   "accessToEquipment": accessToEquipmentCon.text.trim(),
    "motivationLevel": _SkillsLevelFormScreenState()._selectedSkillLevel,
//    "stressLevels": stressLevelsCon.text.trim(),
    "healthIssues":_BodyStatusFormScreenState()._selectedStatuses ,
   // "preferredExerciseTypes":selectedSports,
   // "trainingEnvironmentPreference":selectedEnvironments,
    "phoneNumber": phoneCon.text.trim(),
    "address":{
      "governorate":governorateCon.text.trim(),
      "city":cityCon.text.trim()
    },
    "dateOfBirth":dateOfBirthController.text.trim(),
    "skillLevel":_SkillsLevelFormScreenState()._selectedSkillLevel,

  };
  try {
    print(data.toString());
    var response1;

    http.Response response = await http.post(
      Uri.parse(
          "https://x-fit-backend-graduation-project-production.up.railway.app/api/v1/user/register"),
      headers: {
        "Content-Type" : "application/json",
        "Accept" : "application/json",
      },
      body: jsonEncode(data),
    );
    print(response.body.toString());
    print(response.body);

    // jsonDecode(response.body);
    //  var dataE= jsonEncode(response) as Map ;
    if (response.statusCode == 200 || response.statusCode == 201 ||
        response.statusCode == 204 ) {
      final json=jsonDecode(response.body);

      var token= json["user"]["token"];
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