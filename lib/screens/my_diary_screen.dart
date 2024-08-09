import 'package:fitness_app/app_theme.dart';
import 'package:fitness_app/custom_drawer.dart';
import 'package:fitness_app/widgets/body_measurement.dart';
import 'package:fitness_app/widgets/glass_view.dart';
import 'package:fitness_app/widgets/meals_list_view.dart';
import 'package:fitness_app/widgets/mediterranean_diet_view.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/title_view.dart';
import '../widgets/water_view.dart';

class MyDiaryScreen extends StatefulWidget {
  static const routeName = '/';
  final AnimationController animationController;

  const MyDiaryScreen({required this.animationController});

  @override
  _MyDiaryScreenState createState() => _MyDiaryScreenState();
}

class _MyDiaryScreenState extends State<MyDiaryScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> _listViews = [];
  late Animation<double> _topBarAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    parent: widget.animationController,
    curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
  ));
  double _topBarOpacity = 0.0;
  final ScrollController _scrollController = ScrollController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    // _topBarAnimation =
    //     Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    //   parent: widget.animationController,
    //   curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn),
    // ));
    _addAllListData();

    _scrollController.addListener(() {
      if (_scrollController.offset >= 24) {
        if (_topBarOpacity != 1.0) {
          setState(() {
            _topBarOpacity = 1.0;
          });
        }
      } else if (_scrollController.offset <= 24 &&
          _scrollController.offset >= 0) {
        if (_topBarOpacity != _scrollController.offset / 24) {
          setState(() {
            _topBarOpacity = _scrollController.offset / 24;
          });
        }
      } else if (_scrollController.offset <= 0) {
        if (_topBarOpacity != 0.0) {
          setState(() {
            _topBarOpacity = 0.0;
          });
        }
      }
    });
  }

  void _addAllListData() {
    const int count = 9;
    _listViews.add(
      TitleView(
        titleText: 'Mediterranean diet',
        subText: 'Details',
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 0,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
    _listViews.add(
      MediterraneasnDietView(
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 1,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
    _listViews.add(
      TitleView(
        titleText: 'Meals today',
        subText: 'Customize',
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 2,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      MealsListView(
        mainScreenAnimationController: widget.animationController,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 3,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      TitleView(
        titleText: 'Body measurement',
        subText: 'Today',
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 4,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      BodyMeasurementView(
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 5,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      TitleView(
        titleText: 'Water',
        subText: 'Aque SmartBottle',
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 6,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      WaterView(
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 7,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );

    _listViews.add(
      GlassView(
        animationController: widget.animationController,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(
              (1 / count) * 8,
              1.0,
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ),
      ),
    );
  }

  void _dataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  Future<bool> _getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        drawer: CustomeDrawer(),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            _getMainListViewUI(),
            _getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget _getMainListViewUI() {
    final _mediaQuery = MediaQuery.of(context);
    return FutureBuilder<bool>(
      future: _getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + _mediaQuery.padding.top + 24,
              bottom: _mediaQuery.padding.bottom + 62,
            ),
            itemCount: _listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              widget.animationController.forward();
              return _listViews[index];
            },
          );
        }
      },
    );
  }

  Widget _getAppBarUI() {
    return Column(
      children: [
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _topBarAnimation,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - _topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(_topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.gray.withOpacity(0.4 * _topBarOpacity),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16 - 8.0 * _topBarOpacity,
                          bottom: 12 - 0.8 * _topBarOpacity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'My Diary',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * _topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: AppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                onTap: () {},
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: AppTheme.gray,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      color: AppTheme.gray,
                                      iconSize: 18,
                                      onPressed: _dataPicker,
                                    ),
                                  ),
                                  Text(
                                    _selectedDate == null
                                        ? '15 May'
                                        : '${DateFormat.MMMd().format(_selectedDate!)}',
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      letterSpacing: -0.2,
                                      color: AppTheme.darkerText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32),
                                ),
                                onTap: () {},
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: AppTheme.gray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
