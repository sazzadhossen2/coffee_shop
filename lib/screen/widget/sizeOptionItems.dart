import 'package:coffee/models/colors.dart';
import 'package:coffee/models/size_options_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SizeOptionItems extends StatelessWidget {
 const SizeOptionItems({super.key,
 required this.index,
   required this.sizeOption,
   required this.selected

 });
final int index;
final SizeOption sizeOption;
final bool selected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: selected?secondColor:firstColor.withAlpha(4),
            shape: BoxShape.circle
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/coffee-cup.svg",
              height: 30,
              color: selected?Colors.white:firstColor,
              width: 25+(index *2),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(sizeOption.name,style: const TextStyle(color: Colors.black,
        fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5
        ),),
        Text("${sizeOption.quantity} Fl 0z",style: const TextStyle(
          color: Colors.black38,
          fontSize: 12
        ),)
      ],
    );
  }
}
