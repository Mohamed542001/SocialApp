part of 'LoginImports.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    LoginData loginData = LoginData();
    
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderLogo(),
                  const BuildLoginText(),
                  BuildLoginForm(loginData: loginData,),
                  BuildLoginButton(loginData: loginData),
                  const BuildNotHaveAcc(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
