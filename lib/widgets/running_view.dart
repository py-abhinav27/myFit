import 'package:fitness_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunningView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;

  const RunningView(
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
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.gray.withOpacity(0.4),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: SizedBox(
                              height: 74,
                              child: AspectRatio(
                                aspectRatio: 1.714,
                                child:
                                    Image.asset('lib/assets/images/back.png'),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 100, right: 16, top: 16),
                                    child: Text(
                                      "You're doing great?",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: AppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 100, right: 16, top: 4, bottom: 12),
                                child: Text(
                                  'Keep it up\nand stick to your plan!',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: AppTheme.gray.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -16,
                    child: SizedBox(
                      width: 110,
                      height: 110,
                      child: Image.asset('lib/assets/images/runner.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
