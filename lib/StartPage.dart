import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class StartPage extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const StartPage({this.cameras, Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![1],
      ResolutionPreset.medium,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pushups counter'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 35, 10, 5),
                    child: Center(
                      child: SizedBox(
                        height: 400,
                        width: 330,
                        child: CameraPreview(controller),
                      ),
                    ),
                  )
                ],
              ),
              Row(children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                  child: const Text(
                    'Number of pushups: 0',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                  child: FlatButton(
                    child: Text(
                      'START',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    color: Colors.purple.shade200,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {},
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}


//class PoseDetector extends StatefulWidget {
//  const PoseDetector({this. val, Key? key}) : super(key: key);

//  @override
 // _PoseDetectorState createState() => _PoseDetectorState();
//}

//class _PoseDetectorState extends StatelessWidget {
//  @override

// val image = InputImage.formBitmap(bitmap, 0);

 //Task<Pose> result = poseDetector.process(image)
 //.addOnSuccessListener; {result ->}
 //.addOnFailureListener{ e ->; }

//val options = PoseDetectorOptions.Builder()
//.setDetectorMode(PoseDetectorOptions.STREAM_MODE)

//val poseDetector = PoseDetector.getClient(options)


  //Widget build(BuildContext context) {
    // TODO: implement build
  //  throw UnimplementedError();
 // }
//}







