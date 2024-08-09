import 'package:fitness_app/app_theme.dart';
import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  final List _drawerItems = [
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.home,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'Home',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.support_agent,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'Help',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.help,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'FeedBack',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.group,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'Invite Friend',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.share,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'Rate the app',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
    Theme(
      data: ThemeData(
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          Icons.info,
          color: AppTheme.nearlyBlack,
        ),
        title: Text(
          'About Us',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppTheme.nearlyBlack),
        ),
        onTap: () => null,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Drawer(
        //backgroundColor: AppTheme.notWhite.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.gray.withOpacity(0.6),
                            offset: const Offset(2.0, 4.0),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(60.0),
                          ),
                          child: Image.asset('lib/assets/images/unnamed.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 4),
                      child: Text(
                        'Ragab Elsayed',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppTheme.gray,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Divider(
              height: 1,
              color: AppTheme.gray.withOpacity(0.6),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _drawerItems.length,
                itemBuilder: (context, item) => _drawerItems[item],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
