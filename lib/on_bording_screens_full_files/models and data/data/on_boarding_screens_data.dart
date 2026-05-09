import 'package:expenseapp/on_bording_screens_full_files/models%20and%20data/models/on_boarding_screens_model.dart';

class OnBoardingScreensData {
  static final List<OnBoardingScreensModel> onBoardingScreensData = [
    OnBoardingScreensModel(
      screenImageurl: "assets/images/onboard_1.png",
      screenTitle: 'Gain total control\n of your money',
      screensubTitle: 'Become your own money manager and make every cent count',
    ),

    OnBoardingScreensModel(
      screenImageurl: "assets/images/onboard_2.png",
      screenTitle: 'Know where your money goes',
      screensubTitle:
          'Track your transaction easily, with categories and financial report',
    ),

    OnBoardingScreensModel(
      screenImageurl: "assets/images/onboard_3.png",
      screenTitle: 'Planning ahead',
      screensubTitle: 'Setup your budget for each category so you in control',
    ),
  ];
}
