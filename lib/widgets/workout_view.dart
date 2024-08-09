import 'package:fitness_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class WorkoutView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;

  const WorkoutView(
      {required this.animationController, required this.animation});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue,
                      HexColor("#6F56E8"),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(68.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.gray.withOpacity(0.6),
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Next workout',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: AppTheme.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Legs Toning and\nGlutes Workout at Home.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Icon(
                                Icons.timer,
                                color: AppTheme.white,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: Text(
                                '68 min',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppTheme.white,
                                ),
                              ),
                            ),
                            Expanded(child: const SizedBox()),
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.nearlyWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        AppTheme.nearlyBlack.withOpacity(0.4),
                                    offset: const Offset(8, 8),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_right,
                                color: HexColor("#6F56E8"),
                                size: 44,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
