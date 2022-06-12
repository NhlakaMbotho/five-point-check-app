import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/scheduler/scheduler_wrapper_panel.dart';

class MainContainer extends StatelessWidget {
  User user;
  AuthProvider authProvider;
  String get userName {
    return user != null ? '${user.firstName} ${user.lastName}' : 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();
    user = Provider.of<UserProvider>(context, listen: false).user;
    authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('DX3 Driving School'),
        backgroundColor: Colors.green,
      ),
      body: MultiProvider(
        child: Container(
          child: Center(child: SchedulerWrapperPanel(instructors)),
        ),
        providers: [
          ListenableProvider(
            create: (_) => InstructorProvider(),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.

          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: ListView(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(6), // Border radius
                        child: ClipOval(
                          child: Image(
                            image: AssetImage("./images/user.png"),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              ),
              // child:
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.home, color: Colors.green),
            ),
            ListTile(
              title: const Text('Lessons'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.airplane_ticket, color: Colors.green),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
              leading: const Icon(Icons.person, color: Colors.green),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
              leading: const Icon(Icons.settings, color: Colors.green),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                print('auth before: ${authProvider.isAuthenticated}');
                authProvider.logOut();
                print('auth: ${authProvider.isAuthenticated}');
              },
              leading: const Icon(Icons.logout, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
