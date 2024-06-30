import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class MyTravelHeader extends StatelessWidget {
  
  const MyTravelHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: CustomPaint(
              painter: _MyTravelHeaderPainter(),
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: Row(
              children: [
                Image.asset('assets/icon/logo.png', height: 70),
                Text('MyTravel', style: GoogleFonts.cabin(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.white)),
              ],
            )
          )
        ],
      )
    );
  }
}

class _MyTravelHeaderPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    // Propiedades
    paint.color = Color(0xff4B92FF);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 25;

    final path = Path();

    // Dibujar con el paint y el path
    path.lineTo(0, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.95, size.width * 0.5, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.75, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}