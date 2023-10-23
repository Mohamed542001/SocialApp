import 'package:flutter/material.dart';
import 'package:socialapp/general/constants/AppColors.dart';
import 'package:socialapp/res.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(Res.logo,color: AppColors.primary,),
    );
  }
}
