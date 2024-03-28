// import 'package:coffee/models/colors.dart';
// import 'package:coffee/models/product_model.dart';
// import 'package:flutter/cupertino.dart';
//
// class DisplayImage extends StatelessWidget {
//   DisplayImage({super.key, required this.product});
//
//   Product product;
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constrain) {
//       return SizedBox(
//         height: constrain.maxWidth * 1.25,
//         width: constrain.maxWidth,
//         child: Stack(
//           alignment: AlignmentDirectional.bottomCenter,
//           children: [
//             Container(
//               height: constrain.maxWidth,
//               width: constrain.maxWidth * 0.9,
//               decoration:
//                   BoxDecoration(color: thirdColor, shape: BoxShape.circle),
//             ),
//             ClipRRect(
//               borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(constrain.maxWidth * 0.45)),
//               child: SizedBox(
//                 width: constrain.maxWidth * 0.9,
//                 height: constrain.maxWidth * 2,
//                 child: Stack(
//                   alignment: AlignmentDirectional.bottomCenter,
//                   children: [
//                     Positioned(
//                         bottom: -60,
//                         width: constrain.maxWidth * 0.9,
//                         height: constrain.maxWidth * 1.5,
//                         child: Image.asset("assets/${product.image}"))
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
import 'package:coffee/models/colors.dart';
import 'package:coffee/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth * 1.25,
        width: constraints.maxWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: constraints.maxWidth,
              width: constraints.maxWidth * 0.9,
              decoration: const BoxDecoration(color: thirdColor, shape: BoxShape.circle),
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(constraints.maxWidth * 0.45)),
              child: SizedBox(
                width: constraints.maxWidth * 0.9,
                height: constraints.maxWidth * 2,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Positioned(
                      bottom: -60,
                      width: constraints.maxWidth * 0.9,
                      height: constraints.maxWidth * 1.5,
                      child: Image.asset("assets/${product.image}"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
