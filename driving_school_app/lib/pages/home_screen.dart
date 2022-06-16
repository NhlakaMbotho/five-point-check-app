import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/constants/colors.dart';
import 'package:driving_school_app/models/user.dart';
import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@immutable
class MainPage extends StatelessWidget {
  User? user;
  AuthProvider? authProvider;
  String get userName {
    return user != null ? '${user?.firstName} ${user?.lastName}' : 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();
    user = Provider.of<UserProvider>(context, listen: false).user;
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    return AutoTabsRouter(
        routes: const [
          DashboardRoute(),
          SettingsRoute(),
          ExampleRoute(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('DX3 Driving School'),
                backgroundColor: AppColors.Primary,
              ),
              body: MultiProvider(
                child: child,
                providers: [
                  ListenableProvider(
                    create: (_) => InstructorProvider(),
                  ),
                ],
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: AppColors.Primary,
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
                              ),
                            ),
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
                        tabsRouter.setActiveIndex(0);
                      },
                      leading: const Icon(Icons.home, color: AppColors.Primary),
                    ),
                    ListTile(
                      title: const Text('Lessons'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: const Icon(Icons.airplane_ticket,
                          color: AppColors.Primary),
                    ),
                    ListTile(
                      title: const Text('Profile'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        tabsRouter.setActiveIndex(2);
                      },
                      leading:
                          const Icon(Icons.person, color: AppColors.Primary),
                    ),
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        tabsRouter.setActiveIndex(1);
                      },
                      leading:
                          const Icon(Icons.settings, color: AppColors.Primary),
                    ),
                    ListTile(
                      title: const Text('Logout'),
                      onTap: () {
                        print('auth before: ${authProvider?.isAuthenticated}');
                        authProvider?.logOut();
                        print('auth: ${authProvider?.isAuthenticated}');
                      },
                      leading:
                          const Icon(Icons.logout, color: AppColors.Primary),
                    ),
                  ],
                ),
              ));
        });
  }
}
