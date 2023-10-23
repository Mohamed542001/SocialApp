import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/general/blocks/home_cubit/home_cubit.dart';
import 'package:socialapp/general/constants/AppColors.dart';
import 'package:socialapp/general/screens/widgets/CustomText.dart';
import 'package:socialapp/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:socialapp/iconly_broken.dart';
import 'package:socialapp/user/screens/home/tabs/chats/chats_imports.dart';
import 'package:socialapp/user/screens/home/tabs/main/main_imports.dart';
import 'package:socialapp/user/screens/home/tabs/posts/posts_imports.dart';
import 'package:socialapp/user/screens/home/tabs/settings/settings_imports.dart';
import 'package:socialapp/user/screens/home/tabs/users/users_imports.dart';
import 'package:socialapp/user/screens/home/widgets/home_widgets_imports.dart';

part 'home.dart';
part 'home_data.dart';