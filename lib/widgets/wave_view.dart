import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:fitness_app/app_theme.dart';

import 'package:flutter/material.dart';

class WaveView extends StatefulWidget {
  final double percentageValue;
  WaveView({this.percentageValue = 100.0});

  @override
  _WaveViewState createState() => _WaveViewState();
}

class _WaveViewState extends State<WaveView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _waveAnimationController;
  Offset bottleOffset1 = Offset(0, 0);
  List<Offset> animList1 = [];
  Offset bottleOffset2 = Offset(60, 0);
  List<Offset> animList2 = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _waveAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _waveAnimationController.addListener(() {
      animList1.clear();
      for (int i = -2 - bottleOffset1.dx.toInt(); i <= 60 + 2; i++) {
        animList1.add(
          new Offset(
            i.toDouble() + bottleOffset1.dx.toInt(),
            math.sin((_waveAnimationController.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - widget.percentageValue) * 160 / 100)),
          ),
        );
      }

      animList2.clear();
      for (int i = -2 - bottleOffset2.dx.toInt(); i <= 60 + 2; i++) {
        animList2.add(
          new Offset(
            i.toDouble() + bottleOffset2.dx.toInt(),
            math.sin((_waveAnimationController.value * 360 - i) %
                        360 *
                        vector.degrees2Radians) *
                    4 +
                (((100 - widget.percentageValue) * 160 / 100)),
          ),
        );
      }
    });
    _animationController.forward();
    _waveAnimationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _waveAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
      builder: (context, child) {
        return Stack(
          children: [
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyDarkBlue.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                    topRight: Radius.circular(80.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue.withOpacity(0.2),
                      AppTheme.nearlyDarkBlue.withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              clipper: WaveClipper(_animationController.value, animList1),
            ),
            ClipPath(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyDarkBlue,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80.0),
                    bottomLeft: Radius.circular(80.0),
                    bottomRight: Radius.circular(80.0),
                    topRight: Radius.circular(80.0),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue.withOpacity(0.4),
                      AppTheme.nearlyDarkBlue,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              clipper: WaveClipper(_animationController.value, animList2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.percentageValue.round().toString(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: AppTheme.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 6,
              bottom: 8,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn),
                  ),
                ),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                      color: AppTheme.white.withOpacity(0.4),
                      shape: BoxShape.circle),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 0,
              bottom: 16,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 24,
              bottom: 32,
              child: ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 16 * (1.0 - _animationController.value), 0.0),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(
                        _animationController.status == AnimationStatus.reverse
                            ? 0.0
                            : 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('lib/assets/images/bottle.png'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
