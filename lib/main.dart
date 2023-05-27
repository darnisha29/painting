
import 'dart:typed_data';
import 'dart:ui' as ui;
// import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:permission_handler/permission_handler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CanvasPainting()
);}

class CanvasPainting extends StatefulWidget {
  @override
  _CanvasPaintingState createState() => _CanvasPaintingState();
}

class _CanvasPaintingState extends State<CanvasPainting> {
  bool _isSliderOpen = false;
  GlobalKey globalKey = GlobalKey();

  List<TouchPoints> points = [];
  double opacity = 1.0;
  StrokeCap strokeType = StrokeCap.round;
  double strokeWidth = 3.0;
  Color selectedColor = Colors.black;
  //brush chhene e floating action button chhene ena on press ma aa pickstroke funtion aapyu chhe e nai chaltu
  Future<void> _pickStroke(context) async {
    print(" 🟨🟨 ");
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context1) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick stroke value.
            actions: <Widget>[
              //Resetting to default stroke value
              TextButton(
                child: Icon(
                  Icons.clear,
                ),
                onPressed: () {
                  strokeWidth = 3.0;
                  Navigator.of(context1).pop();
                },
              ),
             TextButton(
                child: Icon(
                  Icons.brush,
                  size: 24,
                ),
                onPressed: () {
                  strokeWidth = 10.0;
                  Navigator.of(context1).pop();
                },
              ),
             TextButton(
                child: Icon(
                  Icons.brush,
                  size: 40,
                ),
                onPressed: () {
                  strokeWidth = 30.0;
                  Navigator.of(context1).pop();
                },
              ),
              TextButton(
                child: Icon(
                  Icons.brush,
                  size: 60,
                ),
                onPressed: () {
                  strokeWidth = 50.0;
                  Navigator.of(context1).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _opacity() async {
    //Shows AlertDialog
    return showDialog<void>(
      context: context,

      //Dismiss alert dialog when set true
      barrierDismissible: true,

      builder: (BuildContext context) {
        //Clips its child in a oval shape
        return ClipOval(
          child: AlertDialog(
            //Creates three buttons to pick opacity value.
            actions: <Widget>[
              TextButton(
                child: Icon(
                  Icons.opacity,
                  size: 24,
                ),
                onPressed: () {
                  //most transparent
                  opacity = 0.1;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Icon(
                  Icons.opacity,
                  size: 40,
                ),
                onPressed: () {
                  opacity = 0.5;
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Icon(
                  Icons.opacity,
                  size: 60,
                ),
                onPressed: () {
                  //not transparent at all.
                  opacity = 1.0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Future<void> _save() async {
  //   RenderObject? boundary =
  //   globalKey.currentContext?.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData!.buffer.asUint8List();
  //
  //   //Request permissions if not already granted
  //   if (!(await Permission.storage.status.isGranted))
  //     await Permission.storage.request();
  //
  //   final result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(pngBytes),
  //       quality: 60,
  //       name: "canvas_image");
  //   print(result);
  // }

  // List<Widget> fabOption() {
  //   return <Widget>[
      // FloatingActionButton(
      //   heroTag: "paint_save",
      //   child: Icon(Icons.save),
      //   tooltip: 'Save',
      //   onPressed: () {
      //     //min: 0, max: 50
      //     setState(() {
      //       _save();
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   heroTag: "paint_stroke",
      //   child: Icon(Icons.brush),
      //   tooltip: 'Stroke',
      //   onPressed: () {
      //     //min: 0, max: 50
      //     setState(() {
      //       _pickStroke();
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   heroTag: "paint_opacity",
      //   child: Icon(Icons.opacity),
      //   tooltip: 'Opacity',
      //   onPressed: () {
      //     //min:0, max:1
      //     setState(() {
      //       _opacity();
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //     heroTag: "erase",
      //     child: Icon(Icons.clear),
      //     tooltip: "Erase",
      //     onPressed: () {
      //       setState(() {
      //         points.clear();
      //       });
      //     }),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_red",
      //   child: colorMenuItem(Colors.red),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.red;
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_green",
      //   child: colorMenuItem(Colors.green),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.green;
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_pink",
      //   child: colorMenuItem(Colors.pink),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.pink;
      //     });
      //   },
      // ),
      // FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   heroTag: "color_blue",
      //   child: colorMenuItem(Colors.blue),
      //   tooltip: 'Color',
      //   onPressed: () {
      //     setState(() {
      //       selectedColor = Colors.blue;
      //     });
      //   },
      // ),
    // ];
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
        body: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              RenderBox? renderBox = context.findRenderObject() as RenderBox;

              // RenderObject? renderBox = context.findRenderObject();
              points.add(TouchPoints(

                  points: renderBox!.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = selectedColor.withOpacity(opacity)
                    ..strokeWidth = strokeWidth));
            });
          },
          onPanStart: (details) {
            setState(() {
              RenderBox? renderBox = context.findRenderObject() as RenderBox;
              // RenderObject? renderBox = context.findRenderObject();
              points.add(TouchPoints(
                  points: renderBox!.globalToLocal(details.globalPosition),
                  paint: Paint()
                    ..strokeCap = strokeType
                    ..isAntiAlias = true
                    ..color = selectedColor.withOpacity(opacity)
                    ..strokeWidth = strokeWidth));
            });
          },
          onPanEnd: (_) {
            setState((){
              // points = null;
            });
          },
          child: RepaintBoundary(
            key: globalKey,
            child: Stack(
              children: <Widget>[
                // Center(
                //   // child: Image.asset("assets/images/hut.png"),
                // ),
                CustomPaint(
                  size: Size.infinite,
                  painter: MyPainter(
                    pointsList: points,
                  ),
                ),
              ],
            ),
          ),
        ),


        floatingActionButton :Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              FloatingActionButton(
                heroTag: "paint_stroke",
                child: Icon(Icons.brush),
                tooltip: 'Stroke',
                onPressed: () {
                  //min: 0, max: 50 aa bhe nai chaltu
                  setState(() {
                    _pickStroke(context);
                    //     strokeWidth= 40.0;
                    _isSliderOpen = !_isSliderOpen;

                  });

                  // AlertDialog(
                  //   actions: <Widget>[
                  // Positioned(
                  // top: MediaQuery.of(context).padding.top + 80,
                  // right: 0,
                  // bottom: 150,
                  // child: RotatedBox(
                  // quarterTurns: 3, // 270 degree
                  // child:
                  // Slider(
                  // value:strokeWidth,
                  // min: 1,
                  // max: 40,
                  // onChanged: (value) {
                  // setState(() {
                  // strokeWidth = value;
                  // });
                  // },
                  // ),
                  // ),
                  // ),
                  //   ],
                  // );
                },
              ),
              FloatingActionButton(
                heroTag: "paint_opacity",
                child: Icon(Icons.opacity),
                tooltip: 'Opacity',
                onPressed: () {
                  //min:0, max:1 on press par aa work nai kartu
                  setState(() {
                    _opacity();
                  });
                },
              ),
              FloatingActionButton(
                  heroTag: "erase",
                  child: Icon(Icons.clear),
                  tooltip: "Erase",
                  onPressed: () {
                    setState(() {
                      points.clear();
                    });
                  }),
              // FloatingActionButton(
              //   backgroundColor: Colors.white,
              //   heroTag: "color_red",
              //   child: colorMenuItem(Colors.red),
              //   tooltip: 'Color',
              //   onPressed: () {
              //     setState(() {
              //       selectedColor = Colors.red;
              //     });
              //   },
              // ),
              SizedBox(width: 20,),
              FloatingActionButton(
                backgroundColor: Colors.white,
                heroTag: "color_green",
                tooltip: 'Color',
                onPressed: () {
                  setState(() {
                    selectedColor = Colors.green;
                  });
                },
                child: colorMenuItem(Colors.green),
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                heroTag: "color_pink",
                tooltip: 'Color',
                onPressed: () {
                  setState(() {
                    selectedColor = Colors.pink;
                  });
                },
                child: colorMenuItem(Colors.pink),
              ),
              FloatingActionButton(
                backgroundColor: Colors.white,
                heroTag: "color_blue",
                child: colorMenuItem(Colors.blue),
                tooltip: 'Color',
                onPressed: () {
                  setState(() {
                    selectedColor = Colors.blue;
                  });
                },
              ),
            ],
        ),
        ),

    );
  }
  Widget colorMenuItem(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: ClipOval(
        child: Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          height: 36,
          width: 36,
          color: color,
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.pointsList});

  //Keep track of the points tapped on the screen
  List<TouchPoints> pointsList;
  List<Offset> offsetPoints = [];

  //This is where we can draw on canvas.
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < pointsList.length - 1; i++) {
      if (pointsList[i] != null && pointsList[i + 1] != null) {
        //Drawing line when two consecutive points are available
        canvas.drawLine(pointsList[i].points, pointsList[i + 1].points,
            pointsList[i].paint);
      } else if (pointsList[i] != null && pointsList[i + 1] == null) {
        offsetPoints.clear();
        offsetPoints.add(pointsList[i].points);
        offsetPoints.add(Offset(
            pointsList[i].points.dx + 0.1, pointsList[i].points.dy + 0.1));

        //Draw points when two points are not next to each other
        canvas.drawPoints(
            ui.PointMode.points, offsetPoints, pointsList[i].paint);
      }
    }
  }

  //Called when CustomPainter is rebuilt.
  //Returning true because we want canvas to be rebuilt to reflect new changes.
  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

//Class to define a point touched at canvas
class TouchPoints {
  Paint paint;
  Offset points;
  TouchPoints({required this.points, required this.paint});
}




// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DrawingBoard(),
//     );
//   }
// }
//
// class DrawingBoard extends StatefulWidget {
//   @override
//   _DrawingBoardState createState() => _DrawingBoardState();
// }
//
// class _DrawingBoardState extends State<DrawingBoard> {
//   Color selectedColor = Colors.black;
//   double strokeWidth = 5;
//   List<DrawingPoint> drawingPoints = [];
//   List<Color> colors = [
//     Colors.purple,
//     Colors.red,
//     Colors.pinkAccent,
//     Colors.black,
//     Colors.blueAccent,
//     Colors.green,
//     Colors.yellow,
//     Colors.brown,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           GestureDetector(
//             onPanStart: (details) {
//               setState(() {
//                 drawingPoints.add(
//                   DrawingPoint(
//                     details.localPosition,
//                     Paint()
//                       ..color = selectedColor
//                       ..isAntiAlias = true
//                       ..strokeWidth = strokeWidth
//                       ..strokeCap = StrokeCap.round,
//                   ),
//                 );
//               });
//             },
//             onPanUpdate: (details) {
//               setState(() {
//                 drawingPoints.add(
//                   DrawingPoint(
//                     details.localPosition,
//                     Paint()
//                       ..color = selectedColor
//                       ..isAntiAlias = true
//                       ..strokeWidth = strokeWidth
//                       ..strokeCap = StrokeCap.round,
//                   ),
//                 );
//               });
//             },
//             onPanEnd: (details) {
//               setState(() {
//                 drawingPoints.add(DrawingPoint(
//                     , paint));
//               });
//             },
//             child: CustomPaint(
//               painter: _DrawingPainter(drawingPoints),
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             right: 30,
//             child: Row(
//               children: [
//                 Slider(
//                   min: 0,
//                   max: 40,
//                   value: strokeWidth,
//                   onChanged: (val) => setState(() => strokeWidth = val),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () => setState(() => drawingPoints = []),
//                   icon: Icon(Icons.clear),
//                   label: Text("Clear Board"),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           color: Colors.grey[200],
//           padding: EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List.generate(
//               colors.length,
//                   (index) => _buildColorChose(colors[index]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildColorChose(Color color) {
//     bool isSelected = selectedColor == color;
//     return GestureDetector(
//       onTap: () => setState(() { selectedColor = color;
//
//       }),
//       child: Container(
//         height: isSelected ? 47 : 40,
//         width: isSelected ? 47 : 40,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//           border: isSelected ? Border.all(color: Colors.white, width: 6) : null,
//         ),
//       ),
//     );
//   }
// }
//
// class _DrawingPainter extends CustomPainter {
//   final List<DrawingPoint> drawingPoints;
//
//   _DrawingPainter(this.drawingPoints);
//
//   List<Offset> offsetsList = [];
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     for (int i = 0; i < drawingPoints.length; i++) {
//       if (drawingPoints[i] != null && drawingPoints[i + 1] != null) {
//         canvas.drawLine(drawingPoints[i].offset, drawingPoints[i + 1].offset,
//             drawingPoints[i].paint);
//       } else if (drawingPoints[i] != null && drawingPoints[i + 1] == null) {
//         offsetsList.clear();
//         offsetsList.add(drawingPoints[i].offset);
//
//         canvas.drawPoints(
//             PointMode.points, offsetsList, drawingPoints[i].paint);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
// class DrawingPoint {
//   Offset offset;
//   Paint paint;
//
//   DrawingPoint(this.offset, this.paint);
// }

