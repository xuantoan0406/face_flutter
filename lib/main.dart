import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;
import 'package:flutter/services.dart' show rootBundle;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String pathImage = "";

  //final Image image = Image.file.File "assets/images/rb1.jpg");
  // void openImage() {
  //   setState(() {
  //     _counter++;
  //   });
  //   if (_counter % 2 == 0) {
  //     setState(() {
  //       pathImage = "lh_train.jpg";
  //     });
  //   } else {
  //     setState(() {
  //       pathImage = "t-ara1.jpg";
  //     });
  //   }
  // }

  @override
  void initState() {
    loadImage();
    loadModel();
    super.initState();
  }

  loadImage() async {
    // Directory directory = await getApplicationDocumentsDirectory();

    // final image = imglib.decodeImage(Image(image: AssetImage('graphics/background.png')).readAsBytesSync());
    // print('image____________ ${Image(image: AssetImage('assets/9.png'))}');
    // imglib.Image img = imglib.copyResizeCropSquare(, 112);
    // final image = imglib.decodeImage(File("./9.png").readAsBytesSync());
    // final data = rootBundle..app_flutter
    // Directory tempDir = await getTemporaryDirectory();
    // String tempPath = tempDir.path;
    // Directory appDocDir  = await getApplicationDocumentsDirectory();
    // String appDocPath = appDocDir.path;
    print('_-----tempPath ${path.basename('assets/9.png')} ');


    // imglib.Image img = imglib.copyResizeCropSquare(croppedImage, 112);
  }

  loadModel() async {
    final interpreter =
        await Interpreter.fromAsset('myModelMobile.tflite');
    print('interpreter_________ ${interpreter.getInputTensors()}');
   var  _inputShape = interpreter.getInputTensor(0).shape;

    print('interpreter_________ ${_inputShape.runtimeType}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Image.asset('')
            // Image(image: AssetImage("assets/images/" + pathImage)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: openImage,
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.camera),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
