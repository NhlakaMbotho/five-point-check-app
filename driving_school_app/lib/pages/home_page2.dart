import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  ScrollController _timeLineController;
  ScrollController _swimlaneController;

  @override
  void initState() {
    _timeLineController = ScrollController();
    _swimlaneController = ScrollController();
    //Listen to scrol events
    _swimlaneController.addListener(() {
      setState(() {
        _timeLineController.jumpTo(_swimlaneController.position.pixels);
      });
    });
    //Listen to scrol events
    _timeLineController.addListener(() {
      setState(() {
        _swimlaneController.jumpTo(_timeLineController.position.pixels);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    this._swimlaneController.dispose();
    this._timeLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var lines = [1, 2, 3, 4, 5, 6, 7, 8];
    // var _physics = BouncingScrollPhysics();

    return Scaffold(
      body: Center(
        child: Container(
          height: 440,
          width: 1000,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _timeLineController,
                child: Container(
                  decoration: BoxDecoration(color: Colors.green),
                  height: 40,
                  width: 3000,
                  child: Placeholder(),
                ),
              ),
              Flexible(
                  child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Container(
                    height: 800,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: _swimlaneController,
                      physics: RangeMaintainingScrollPhysics(),
                      child: Container(
                        color: Colors.blue.withOpacity(.3),
                        height: 800,
                        width: 3000,
                        child: Placeholder(),
                      ),
                    )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
