import 'package:flutter/material.dart';

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class BackgroundPainter extends CustomPainter{
  final Paint bluePaint;
  final Paint greyPaint;


  BackgroundPainter()
    : bluePaint = Paint()
        ..color = Colors.blueGrey[800]
        ..style = PaintingStyle.fill,
       greyPaint = Paint()
        ..color = Color.fromRGBO(80, 194, 221, 1.0)
        ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size){
    paintBlue(size, canvas);
    paintDark(size, canvas);

  }

  void paintBlue(Size size, Canvas canvas){
    final path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(0, 0);

    _addPointsToPath(
      path,[
        Point(
          size.width*-0.2,
          size.height*1.1,
        ),
        Point(
          size.width*1.3,
          size.height*0.6,  
        ),
        Point(
          size.width,
          size.height*1.7,
        ),
        
      ]
    );
    /*size.width*0.35, size.height*0.35, size.width, size.height*0.55*/
    canvas.drawPath(path, bluePaint);
  }

  void paintDark(Size size, Canvas canvas){
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height*0.48);
    _addPointsToPath(
      path,[
        Point(
          size.width*0.45,
          size.height*0.68,
        ),
        Point(
          size.width*0.7,
          size.height*0.35,
        ),
        Point(
          size.width,
          size.height*0.25,
        ),
      ]
    );
    canvas.drawPath(path, greyPaint);
  }

  void _addPointsToPath(Path path, List<Point> points){
    if(points.length<3){
      throw UnsupportedError('Need + 3 Points to create a path');
    }

    for(var i=0; i<points.length - 2; i++){
      final xDiff = (points[i].x + points[i+1].x)/2;
      final yDiff = (points[i].y + points[i+1].y)/2;
      path.quadraticBezierTo(points[i].x,  points[i].y, xDiff, yDiff);
    }

    final secondLastPoint = points[points.length-2];
    final lastPoint = points[points.length-1];
    path.quadraticBezierTo(secondLastPoint.x, secondLastPoint.x, lastPoint.x, lastPoint.y);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
      
}