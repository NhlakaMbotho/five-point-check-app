import 'package:driving_school_app/auth-guard.dart';

import 'package:driving_school_app/providers/authentication_provider.dart';
import 'package:driving_school_app/providers/ui_events_provider.dart';
import 'package:driving_school_app/providers/user.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/colors.dart';
import 'providers/instructor_provider.dart';
import 'providers/sequence_step_provider.dart';
import 'routes/router.gr.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = MainRouter(authGuard: AuthGuard());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => UIEventsProvider()),
        ListenableProvider(create: (_) => InstructorProvider()),
        ListenableProvider(create: (_) => AuthProvider()),
        ListenableProvider(create: (_) => UserProvider()),
        ListenableProvider(create: (_) => SequenceStepProvider()),
      ],
      child: Consumer<AuthProvider>(builder: (context, authentication, _) {
        if (!authentication.isAuthenticated) {
          _appRouter.replaceAll([LoginRoute()]);
        }
        // print('auth change picked up in root object');
        return MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: AppColors.Primary,
            backgroundColor: Colors.white,

            // Define the default font family.
            fontFamily: 'Helvetica Neue',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(
                fontSize: 11,
                decoration: TextDecoration.none,
                color: AppColors.Primary,
              ),
            ),
          ),
        );
      }),
    );
  }

  dispose() {}
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diagonal Scrolling',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ScrollController _vertical = ScrollController();
//   ScrollController _horizontal = ScrollController();
//   Offset? _lastOffset = null;

//   init() {
//     // _vertical.addListener(() {
//     //   print('coords: ${_vertical.offset}');
//     // });
//   }

//   @override
//   initState() {
//     init();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('rebuild...........');

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Diagonal Scrolling'),
//       ),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
//           width: 600,
//           height: 400,
//           child: GestureDetector(
//             onPanUpdate: (details) {
//               bool positionChanged = false;
//               if (_lastOffset != null) {
//                 final offsetDiff = _lastOffset! - details.localPosition;
//                 if (_horizontal.offset + offsetDiff.dx <= _horizontal.position.maxScrollExtent &&
//                     _horizontal.offset + offsetDiff.dx > _horizontal.position.minScrollExtent) {
//                   positionChanged = true;
//                   _horizontal.jumpTo(_horizontal.offset + offsetDiff.dx);
//                 }
//                 if (_vertical.offset + offsetDiff.dy <= _vertical.position.maxScrollExtent &&
//                     _vertical.offset + offsetDiff.dy >= _vertical.position.minScrollExtent)
//                   _vertical.jumpTo(_vertical.offset + offsetDiff.dy);
//                 positionChanged = true;
//               }
//               print("test...........");

//               _lastOffset = details.localPosition;
//             },
//             onPanEnd: (details) {
//               _lastOffset = null;
//             },
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               controller: _vertical,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 controller: _horizontal,
//                 child: Container(
//                   // Making the container larger than the screen to visualize scrolling.
//                   width: 800,
//                   height: 500,
//                   child: Placeholder(), // This can be your actual content.
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
