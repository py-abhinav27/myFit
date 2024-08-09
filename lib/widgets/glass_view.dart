import 'package:fitness_app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class GlassView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  const GlassView({required this.animationController, required this.animation});
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
                  left: 24, right: 24, top: 0, bottom: 24),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: HexColor("#D7E0F9"),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: AppTheme.gray.withOpacity(0.2),
                        //     offset: Offset(1.1, 1.1),
                        //     blurRadius: 10.0,
                        //   ),
                        // ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 68, bottom: 12, right: 16, top: 12),
                        child: Text(
                          'Prepare your stomach for lunch with one or two glass of water.',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: AppTheme.nearlyDarkBlue.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -12,
                    left: 0,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset('lib/assets/images/glass.png'),
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
