import 'package:flutter/material.dart';

class PropertyGallery extends StatelessWidget {
  const PropertyGallery({super.key});

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
        'https://tse2.mm.bing.net/th/id/OIP.b7ibTjl2QGU1MNTFyeV-FAHaE8?rs=1&pid=ImgDetMain&o=7&rm=3',
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
