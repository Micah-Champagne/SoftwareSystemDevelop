import 'package:flutter/material.dart';
import 'package:quest/pages/onboarding.dart';

class OnboardingPg1 extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return OnboardingScreen
    (
      imagePath: 'assets/icons/onboard1.png',
      title: 'Welcome to QuestBuddy!',
      description: 'Turn your to-do list items into Quests, and complete them to earn points!',
      onNext: () {Navigator.pushNamed(context, '/onboarding2');},
      onSkip: () {Navigator.pushNamed(context, '/signinPage');},
    );
  }
}

class OnboardingPg2 extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return OnboardingScreen
    (
      imagePath: 'assets/icons/onboard2.png',
      title: 'Stay Connected and Motivated!',
      description: 'Compete with friends, share tasks, and stay on track with social scoreboards.',
      onNext: () {Navigator.pushNamed(context, '/onboarding3');},
      onSkip: () {Navigator.pushNamed(context, '/signinPage');},
    );
  }
}

class OnboardingPg3 extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return OnboardingScreen
    (
      imagePath: 'assets/icons/onboard3.png',
      title: 'Let\'s Get Started!',
      description:'Get ready to embark on your first Quest!',
      onNext: () {Navigator.pushNamed(context, '/signinPage');},
      onSkip: () {},
      buttonText: 'Start Questing',
      isFinalPage: true,
    );
  }
}
