import 'package:camera/camera.dart';
import 'package:e_product_order_flutter/main.dart';
import 'package:flutter/material.dart';

class CameraValueObject extends StatefulWidget {
  const CameraValueObject({super.key});

  @override
  State<CameraValueObject> createState() => _CameraValueObjectState();
}

class _CameraValueObjectState extends State<CameraValueObject> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller?.value.isInitialized ?? false
          ? CameraPreview(controller!)
          : Container(
              child: Center(
                child: Text("initializing..."),
              ),
            ),
    );
  }
}
