// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class BackGround extends StatelessWidget {
//   const BackGround({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       color: Colors.white,
//       width: size.width,
//       height: size.height,
//       child: Stack(
//         children: [
//           CoffeBean(degree: 190, right: 160, top: 90),
//           CoffeBean(degree: 90, left: -50, top: 5),
//           CoffeBean(degree: 10, left: -70, top: 140),
//           CoffeBean(degree: 75, right: -20, top: 150),
//           CoffeBean(degree: 100, right: -70, top: 300),
//           CoffeBean(degree: 155, right: 70, top: 350),
//         ],
//       ),
//     );
//   }
// }
//
// class CoffeBean extends StatelessWidget {
//   CoffeBean(
//       {super.key, this.top, this.left, this.right, this.bottom, this.degree});
//
//   final double? top, left, right, bottom, degree;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         top: top,
//         bottom: bottom,
//         right: right,
//         left: left,
//         child: Transform.rotate(
//           angle: degree! * pi / 190,
//           child: SvgPicture.asset(
//             "assets/coffee-bean.svg",
//             width: 150,
//           ),
//         ));
//   }
// }
//
// class Clip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 100);
//     path.quadraticBezierTo(size.width / 2, -40, 0, 100);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: const Stack(
        children: [
          CoffeBean(degree: 190, right: 160, top: 90),
          CoffeBean(degree: 90, left: -50, top: 5),
          CoffeBean(degree: 10, left: -70, top: 140),
          CoffeBean(degree: 75, right: -20, top: 150),
          CoffeBean(degree: 100, right: -70, top: 300),
          CoffeBean(degree: 155, right: 70, top: 350),
        ],
      ),
    );
  }
}

class CoffeBean extends StatelessWidget {
  const CoffeBean({super.key, Key? key, this.top, this.left, this.right, this.bottom, this.degree});

  final double? top, left, right, bottom, degree;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: Transform.rotate(
        angle: degree! * pi / 190,
        child: SvgPicture.asset(
          "assets/coffee-bean.svg",
          width: 150,
        ),
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 100);
    path.quadraticBezierTo(size.width / 2, -40, 0, 100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
