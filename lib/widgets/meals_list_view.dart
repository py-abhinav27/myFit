import 'package:fitness_app/app_theme.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/models/meals_list_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MealsListView extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;
  MealsListView(
      {required this.mainScreenAnimationController,
      required this.mainScreenAnimation});

  @override
  _MealsListViewState createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  List<MealsListData> mealsListData = MealsListData.tabIconsList;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.mainScreenAnimationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: widget.mainScreenAnimation,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.mainScreenAnimation.value), 0.0),
              child: Container(
                height: 216,
                width: double.infinity,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, right: 16, left: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: mealsListData.length,
                  itemBuilder: (context, index) {
                    final int count =
                        mealsListData.length > 10 ? 10 : mealsListData.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController.forward();
                    return MealsView(
                      mealsListData: mealsListData[index],
                      animationController: animationController,
                      animation: animation,
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}

class MealsView extends StatelessWidget {
  final MealsListData mealsListData;
  final AnimationController animationController;
  final Animation<double> animation;
  const MealsView(
      {required this.mealsListData,
      required this.animationController,
      required this.animation});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: SizedBox(
                width: 130,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 32,
                        left: 8,
                        bottom: 16,
                        right: 8,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: HexColor(mealsListData.endColor)
                                    .withOpacity(0.6),
                                offset: const Offset(1.1, 4.0),
                                blurRadius: 8.0,
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                HexColor(mealsListData.startColor),
                                HexColor(mealsListData.endColor)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(54.0),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 54,
                            left: 16,
                            right: 16,
                            bottom: 8,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                mealsListData.title,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 0.2,
                                  color: AppTheme.white,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mealsListData.meals.join('\n'),
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          letterSpacing: 0.2,
                                          color: AppTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              mealsListData.kcal != 0
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          mealsListData.kcal.toString(),
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                            letterSpacing: 0.2,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            'Kcal',
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                              letterSpacing: 0.2,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.nearlyWhite,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppTheme.nearlyBlack
                                                .withOpacity(0.4),
                                            offset: const Offset(8.0, 8.0),
                                            blurRadius: 8.0,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Icon(
                                          Icons.add,
                                          color:
                                              HexColor(mealsListData.endColor),
                                          size: 24,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: AppTheme.nearlyWhite.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 8,
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.asset(mealsListData.imagePath),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
