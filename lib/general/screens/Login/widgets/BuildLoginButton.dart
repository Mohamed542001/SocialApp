part of 'LoginWidgetsImports.dart';

class BuildLoginButton extends StatelessWidget {
  const BuildLoginButton({
    Key? key,
    required this.loginData,
  }) : super(key: key);
  final LoginData loginData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            CustomToast.showSimpleToast(msg: state.error, color: Colors.red);
          }

          if (state is LoginSuccessState) {
            CustomToast.showSimpleToast(
              msg: "Login Success",
              color: Colors.green,
            );
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Home()),
                  );
            });
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConditionalBuilder(
            condition: state is! LoginLoadingState,
            builder: (context) => DefaultButton(
              onTap: () {
                if (loginData.formKey.currentState!.validate()) {
                  LoginCubit.get(context).userLogin(
                    email: loginData.emailController.text.trim(),
                    password: loginData.passwordController.text.trim(),
                  );
                }
              },
              margin: const EdgeInsets.all(0),
              title: 'Login',
              width: double.infinity,
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
