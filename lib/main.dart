import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/general/constants/AppColors.dart';
import 'package:socialapp/general/constants/CustomBlocObserver.dart';
import 'package:socialapp/general/screens/Login/LoginImports.dart';
import 'package:socialapp/general/screens/onBoarding/OnBoardingImports.dart';
import 'package:socialapp/general/screens/splash/SplashImports.dart';
import 'package:socialapp/general/utilities/main_data/MainDataImports.dart';
import 'package:socialapp/general/utilities/utils_functions/ApiNames.dart';
import 'package:socialapp/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:socialapp/general/utilities/utils_functions/cache_helper.dart';
import 'package:socialapp/user/screens/home/home_imports.dart';


Future<void> firebaseMessagingBackgroundHandlers(RemoteMessage message) async {
  print('on background message');
  CustomToast.showSimpleToast(msg: "on background message",color: Colors.green);
  print(message.data.toString());

}

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBw-Wb_TEts_EXe6SyDqZAfx8NGM8YKuco",
      appId: "1:436040562921:android:c9cae0e1f3e29564e79878",
      messagingSenderId: "436040562921",
      projectId: "social-app-7ae48",
      storageBucket: "social-app-7ae48.appspot.com",
    ),
  )
      : await Firebase.initializeApp();

  await CacheHelper.init();
  ApiNames.uId = CacheHelper.getData(key: 'uId');

  Widget? widget;

  var uId = ApiNames.uId;
  uId = CacheHelper.getData(key: 'uId');
  print('uId = $uId');

  if(ApiNames.uId != null){
    print(ApiNames.uId);
    widget = Home();
  }else{
    widget = Splash();
  }

  var token = await FirebaseMessaging.instance.getToken();
  print("token ${token}");

  FirebaseMessaging.onMessage.listen((event) {
    print('on message');
    CustomToast.showSimpleToast(msg: "on message",color: Colors.green);
    print(event.data.toString());
    print(event.notification?.title);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print('on message opened app');
    CustomToast.showSimpleToast(msg: "on message opened app",color: Colors.green);
    print(event.data.toString());
  });

  FirebaseMessaging.onBackgroundMessage(
          (message) => firebaseMessagingBackgroundHandlers(message));
  runApp(const MyApp());


  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.startWidget});
  final Widget? startWidget;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: MainData.providers(context),
      child: MaterialApp(
        theme: MainData.lightTheme,
        darkTheme: MainData.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home: startWidget,
      ),
    );
  }
}
