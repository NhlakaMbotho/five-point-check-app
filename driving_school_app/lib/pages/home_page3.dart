import 'package:flutter/material.dart';

// class HomePage3 extends StatefulWidget {
//   @override
//   _HomePage3State createState() => _HomePage3State();
// }

// class _HomePage3State extends State<HomePage3> {
//   ScrollController _instructorListController;
//   ScrollController _swimlaneController;

//   @override
//   void initState() {
//     _instructorListController = ScrollController();
//     _swimlaneController = ScrollController();
//     //Listen to scrol events
//     _swimlaneController.addListener(() {
//       setState(() {
//         _instructorListController.jumpTo(_swimlaneController.position.pixels);
//       });
//     });
//     //Listen to scrol events
//     _instructorListController.addListener(() {
//       setState(() {
//         _swimlaneController.jumpTo(_instructorListController.position.pixels);
//       });
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     this._swimlaneController.dispose();
//     this._instructorListController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 440,
//           width: 1000,
//           child: Row(
//             children: [
//               CustomPlaceHolder(),
//               InstructorAvatarList(null),
//               CustomPlaceHolder(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomePage3 extends StatelessWidget {
  ScrollController _verticalScroller;

  HomePage3(this._verticalScroller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 440,
          width: 1000,
          child: Row(
            children: [
              CustomPlaceHolder(),
              InstructorAvatarList(_verticalScroller),
              CustomPlaceHolder(),
            ],
          ),
        ),
      ),
    );
  }
}

class InstructorAvatarList extends StatefulWidget {
  ScrollController controller;
  InstructorAvatarList(this.controller);

  @override
  _InstructorAvatarListState createState() =>
      _InstructorAvatarListState(this.controller);
}

class _InstructorAvatarListState extends State<InstructorAvatarList> {
  ScrollController controller;
  _InstructorAvatarListState(this.controller);

  @override
  Widget build(BuildContext context) {
    List<int> _instructors = [1, 2, 3, 4, 5, 6, 7, 8];
    var _physics = BouncingScrollPhysics();

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => InstructorAvatar(),
      controller: controller,
      itemCount: _instructors.length,
      physics: _physics,
      scrollDirection: Axis.vertical,
    );
  }
}

class CustomPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Placeholder(),
      height: 40,
      width: 100,
    );
  }
}

class InstructorAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Placeholder(),
      height: 100,
      width: 100,
    );
  }
}
