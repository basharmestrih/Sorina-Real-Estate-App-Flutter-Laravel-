import 'package:flutter/material.dart';

class PropertyGallery extends StatelessWidget {
  const PropertyGallery({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.01), // ⬅️ very light fade at top
            Colors.black,
            Colors.black,
            Colors.black.withOpacity(0.01), // ⬅️ very light fade at bottom
          ],
          stops: [0.0, 0.1, 0.9, 1.0], // shorter fade zones
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: Image.network(
        imageUrl,
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
