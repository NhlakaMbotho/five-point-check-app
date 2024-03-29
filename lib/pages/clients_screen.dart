import 'package:driving_school_app/components/client_list.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../components/scheduler/main_header.dart';
import '../components/table_header.dart';

class ClientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Clients'),
      body: Center(
          child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                TableHeader(UserType.CLIENT),
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
                    child: ClientList(),
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
}
