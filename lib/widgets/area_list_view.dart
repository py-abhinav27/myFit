import 'package:fitness_app/app_theme.dart';
import 'package:flutter/material.dart';

class AreaListView extends StatefulWidget {
  final AnimationController mainScreenAnimationController;
  final Animation<double> mainScreenAnimation;
  const AreaListView(
      {required this.mainScreenAnimationController,
      required this.mainScreenAnimation});

  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  List<String> _areaListData = [
    'lib/assets/images/area1.png',
    'lib/assets/images/area2.png',
    'lib/assets/images/area3.png',
    'lib/assets/images/area1.png',
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
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
            child: AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: GridView(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    _areaListData.length,
                    (index) {
                      final int count = 4;
                      final Animation<double> animation =
                          Tween<double>(begin: 0, end: 1).animate(
                        CurvedAnimation(
                          parent: _animationController,
                          curve: Interval(
                            (1 / count) * index,
                            1.0,
                            curve: Curves.fastOutSlowIn,
                          ),
                        ),
                      );
                      _animationController.forward();
                      return AreaView(
                        animationController: _animationController,
                        animation: animation,
                        image: _areaListData[index],
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 1,
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

class AreaView extends StatelessWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  final String image;
  const AreaView(
      {required this.animationController,
      required this.animation,
      required this.image});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform:
                Matrix4.translationValues(0.0, 50 * (1 - animation.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.gray.withOpacity(0.4),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  splashColor: AppTheme.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: Image.asset(image),
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
