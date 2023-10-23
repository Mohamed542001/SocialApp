part of 'SplashImports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 1500),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => const Login(),
            ),
            (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        color: AppColors.primary,
        child: Center(
          child: AnimationContainer(
              index: 0,
              vertical: true,
              duration: const Duration(milliseconds: 2000),
              distance: MediaQuery.of(context).size.height * .3,
              child: Hero(
                tag: Res.interconnect,
                child: Image.asset(
                  Res.interconnect,
                  color: AppColors.white,
                  width: 350,
                  height: 260,
                ),
              )),
        ),
      ),
    );
  }
}
