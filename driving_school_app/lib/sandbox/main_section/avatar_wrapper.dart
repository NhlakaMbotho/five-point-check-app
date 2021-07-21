import 'package:driving_school_app/models/instructor.dart';
import 'package:driving_school_app/providers/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarWrapper extends StatelessWidget {
  ScrollController controller = new ScrollController();
  final double height;

  AvatarWrapper(this.height);

  @override
  Widget build(BuildContext context) {
    var instructors =
        Provider.of<InstructorProvider>(context, listen: false).getAll();

    return Container(
      child: ListView.separated(
        itemBuilder: (BuildContext ctx, int index) =>
            InstructorWidget(instructors[index]),
        separatorBuilder: (BuildContext ctx, int index) {
          return Container(
            height: 10,
          );
        },
        itemCount: instructors.length,
        physics: PageScrollPhysics(),
      ),
      height: height,
      width: 100,
    );
  }
}

class InstructorWidget extends StatelessWidget {
  final Instructor insrtuctor;
  InstructorWidget(this.insrtuctor);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            child: Center(
              child: Image(
                image: this.insrtuctor.image.image,
              ),
            ),
          ),
          Container(
            height: 20,
            child: Center(
              child: Text(
                this.insrtuctor.name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
