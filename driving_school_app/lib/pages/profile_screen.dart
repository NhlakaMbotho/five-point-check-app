import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../components/nav_item.dart';

enum ProfileViews { EDIT, SECURITY }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  ProfileViews selectedView = ProfileViews.EDIT;

  void setView(ProfileViews view) {
    setState(() {
      selectedView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                borderOnForeground: false,
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ProfileSubMenu([
                    NavItem(
                      Icons.edit,
                      'Edit',
                      () => setView(ProfileViews.EDIT),
                      selected: selectedView == ProfileViews.EDIT,
                    ),
                    NavItem(
                      Icons.security,
                      'Security',
                      () => setView(ProfileViews.SECURITY),
                      selected: selectedView == ProfileViews.SECURITY,
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                child: Card(
                  borderOnForeground: false,
                  elevation: 0,
                  color: Colors.white,
                  child: Column(
                    children: [],
                  ),
                ),
              )),
        ],
      )),
      backgroundColor: AppColors.GreyLight,
    );
  }
}

class ProfileSubMenu extends StatelessWidget {
  final List<NavItem> navItems;
  const ProfileSubMenu(this.navItems);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          height: 40,
          child: Center(child: navItems[index]),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 6),
      itemCount: navItems.length,
    );
  }
}
