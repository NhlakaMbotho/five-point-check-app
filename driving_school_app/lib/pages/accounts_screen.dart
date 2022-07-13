import 'dart:math';

import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../components/instructor_list.dart';
import '../components/nav_item.dart';

enum AccountViews { CLIENTS, INSTRUCTORS }

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => AccountsPageState();
}

class AccountsPageState extends State<AccountsPage> {
  AccountViews selectedView = AccountViews.INSTRUCTORS;
  bool loading = true;

  void setView(AccountViews view) {
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
          Expanded(
            child: Column(
              children: [
                TableHeader(),
                Expanded(
                  flex: 4,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                    ),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    borderOnForeground: false,
                    elevation: 0,
                    color: Colors.white,
                    child: getSelectedView(),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      backgroundColor: AppColors.GreyLight,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => print('Awe!'),
        backgroundColor: AppColors.Primary,
        foregroundColor: Colors.white,
        elevation: 12,
        focusElevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text('+'),
      ),
    );
  }

  Widget getSelectedView() {
    switch (selectedView) {
      case AccountViews.INSTRUCTORS:
        return InstructorList();
      case AccountViews.CLIENTS:
        return Column(
          children: [],
        );
    }
  }
}

class RowText extends Text {
  const RowText(String text)
      : super(text, style: const TextStyle(fontSize: 12));
}

class TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 2, child: RowText('Name')),
          Expanded(flex: 2, child: RowText('Phone')),
          Expanded(flex: 2, child: Center(child: RowText('Status'))),
          Expanded(flex: 2, child: Center(child: RowText('Planned Lessons'))),
          Expanded(flex: 2, child: Center(child: RowText('Total Hours'))),
          Expanded(flex: 2, child: Center(child: RowText('Av. Rating'))),
        ],
      ),
    );
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
