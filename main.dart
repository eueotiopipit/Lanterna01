import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanterna',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FlashlightPage(),
    );
  }
}

class FlashlightPage extends StatefulWidget {
  @override
  _FlashlightPageState createState() => _FlashlightPageState();
}

class _FlashlightPageState extends State<FlashlightPage> {
  bool isOn = false;

  Future<void> toggleFlashlight() async {
    try {
      if (isOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        isOn = !isOn;
      });
    } catch (e) {
      print("Erro ao usar a lanterna: \$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(
            isOn ? Icons.flashlight_off : Icons.flashlight_on,
            size: 100,
            color: isOn ? Colors.yellow : Colors.white,
          ),
          onPressed: toggleFlashlight,
        ),
      ),
    );
  }
}
