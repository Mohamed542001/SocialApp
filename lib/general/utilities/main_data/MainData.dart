part of 'MainDataImports.dart';

class MainData {
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: Color(0xFF262424),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color(0xFF262424),
        ),
        backgroundColor: Color(0xFF262424),
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: AppColors.black  ,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 4,
          color: Colors.white,
          height: 1.3),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.blueGrey,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.white10,
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: const TextStyle(
            fontFamily: 'Janna',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
      subtitle1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black,
          height: 1.3),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      elevation: 30,
      backgroundColor: AppColors.primary,
    ),
  );

  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit()..getUserData(),
        ),

      ];
}
