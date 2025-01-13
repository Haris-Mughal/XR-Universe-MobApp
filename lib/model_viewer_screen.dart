import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatelessWidget {
  final String modelSrc;
  const ModelViewerScreen({
    super.key,
    required this.modelSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Viewer'),
      ),
      body: Stack(
        children: [
          // Background image with black overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_image.png'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withAlpha(179), // Black overlay with 50% opacity
            ),
          ),
          // ModelViewer
          ModelViewer(
            backgroundColor: Colors.transparent, // Make background transparent
            src: modelSrc,
            alt: "Planet's model",
            ar: true,
            arModes: const ['scene-viewer', 'webxr', 'quick-look'],
            autoRotate: true,
            iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          ),
        ],
      ),
    );
  }
}