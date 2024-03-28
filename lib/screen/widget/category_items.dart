// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../models/category_model.dart';
//
// class CategoryItems extends StatelessWidget {
//   const CategoryItems({super.key,required this.category});
// final Category category;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           height: 75,
//           width: 75,
//
//           decoration: BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle
//           ),
//           child: Image.asset("assets/${category.image}"),
//         ),
//         SizedBox(height: 10,),
//         Text(category.name,style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white),)
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../models/category_model.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/${category.image}"),
        ),
        const SizedBox(height: 10),
        Text(
          category.name,
          style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        )
      ],
    );
  }
}
