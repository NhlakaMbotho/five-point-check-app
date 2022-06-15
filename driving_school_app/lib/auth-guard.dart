import 'package:auto_route/auto_route.dart';
import 'package:driving_school_app/routes/router.gr.dart';
import 'utilities/global.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    // print(
    //     'Auth checked for route ${router.current.name} - ${this.authProvider!.isAuthenticated}');
    if (Global.authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      router.push(LoginRoute());
    }
  }
}
