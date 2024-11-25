import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final String buttonText;
  final bool isFinalPage; 

  // ignore: use_super_parameters
  const OnboardingScreen
  ({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onNext,
    required this.onSkip,
    this.buttonText = 'Next', 
    this.isFinalPage = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: Column
      (
        mainAxisSize: MainAxisSize.min,
        children: 
        [
          const SizedBox(height: 70),
          Text
          (
            'QuestBuddy',
            style: GoogleFonts.lato
            (
              color: const Color(0xFF181818),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Image.asset(imagePath, height: 450, width: 600),
          Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: 
            [
              SizedBox
              (
                width: 203,
                height: 65,
                child: Text
                (
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato
                  (
                    color: const Color(0xFF181818),
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.48,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox
              (
                width: 299,
                child: Text
                (
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato
                  (
                    color: const Color(0xFF615F5F),
                    fontSize: 14.55,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                    letterSpacing: -0.48,
                  ),
                ),
              ),
            ], 
          ),
          const SizedBox(height: 48),
          Center
          (
            child: isFinalPage ? GestureDetector
            (
              onTap: onNext,
              child: Container
              (
                width: 149,
                height: 54,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration
                (
                  color: const Color(0xFF838EF4),
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const 
                  [
                    BoxShadow
                    (
                      color: Color(0x19003078),
                      blurRadius: 30,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center
                (
                  child: Text
                  (
                    buttonText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato
                    (
                      color: const Color(0xFF262626),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.48,
                    ),
                  ),
                ),
              ),
            )
            : Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                GestureDetector
                (
                  onTap: onSkip,
                  child: Container
                  (
                    width: 149,
                    height: 54,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration
                    (
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center
                    (
                      child: Text
                      (
                        'Skip',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato
                        (
                          color: const Color(0xFF838EF4),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.48,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 29),
                GestureDetector
                (
                  onTap: onNext,
                  child: Container
                  (
                    width: 149,
                    height: 54,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration
                    (
                      color: const Color(0xFF838EF4),
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: const 
                      [
                        BoxShadow(
                          color: Color(0x19003078),
                          blurRadius: 30,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center
                    (
                      child: Text
                      (
                        'Next',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: const Color(0xFF262626),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.48,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
