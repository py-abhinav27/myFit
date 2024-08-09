import 'package:fitness_app/custom_drawer.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/tabIcon_data.dart';
import '../screens/my_diary_screen.dart';
import '../screens/training_screen.dart';
import '../widgets/bottom_bar_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<TabIconData> _tabIconsList = TabIconData.tabIconsList;
  Widget _tabBody = Container(color: AppTheme.background);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _tabBody = MyDiaryScreen(
      animationController: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        drawer: CustomeDrawer(),
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: [
                  _tabBody,
                  _bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        BottomBarView(
          tabIconeList: _tabIconsList,
          addClick: () {},
          changeIndex: (index) {
            if (index == 0 || index == 2) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = MyDiaryScreen(
                    animationController: _animationController,
                  );
                });
              });
            } else if (index == 1 || index == 3) {
              _animationController.reverse().then((value) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  _tabBody = TrainingScreen(
                    animationController: _animationController,
                  );
                });
              });
            }
          },
        ),
      ],
    );
  }
}
