import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';

import '../components/nav_item.dart';

enum SettingsViews { LESSONS, ACCOUNTS }

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  SettingsViews selectedView = SettingsViews.ACCOUNTS;

  void setView(SettingsViews view) {
    if (view == selectedView) {
      return;
    }
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
          SizedBox(
            width: 220,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                borderOnForeground: false,
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SettingsSubMenu([
                    NavItem(
                      Icons.date_range_rounded,
                      'Lessons',
                      () => setView(SettingsViews.LESSONS),
                      selected: selectedView == SettingsViews.LESSONS,
                    ),
                    NavItem(
                      Icons.person,
                      'Accounts',
                      () => setView(SettingsViews.ACCOUNTS),
                      selected: selectedView == SettingsViews.ACCOUNTS,
                    ),
                  ]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 24, right: 20),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, right: 20, bottom: 20),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        borderOnForeground: false,
                        elevation: 0,
                        color: Colors.white,
                        child: getSelectedView(),
                      ),
                    )),
              ],
            ),
          ),
        ],
      )),
      backgroundColor: AppColors.GreyLight,
    );
  }

  Widget getSelectedView() {
    switch (selectedView) {
      case SettingsViews.LESSONS:
        return Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Text('Settings'),
              ),
            ),
          ],
        );
      case SettingsViews.ACCOUNTS:
        return Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Text('Account'),
              ),
            ),
          ],
        );
    }
  }
}

class SettingsSubMenu extends StatelessWidget {
  final List<NavItem> navItems;
  const SettingsSubMenu(this.navItems);

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
