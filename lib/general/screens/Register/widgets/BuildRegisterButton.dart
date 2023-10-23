part of 'RegisterWidgetsImports.dart';

class BuildRegisterButton extends StatelessWidget {
  const BuildRegisterButton({
    Key? key,
    required this.registerData,
  }) : super(key: key);
  final RegisterData registerData;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            CustomToast.showSimpleToast(msg: state.error, color: Colors.red);
          }

          if (state is RegisterSuccessState) {
            CustomToast.showSimpleToast(
              msg: "Account has been created",
              color: Colors.green,
            );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Login(),
              ),
            );
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ConditionalBuilder(
            condition: state is! RegisterLoadingState,
            builder: (context) => DefaultButton(
              onTap: () {
                if (registerData.formKey.currentState!.validate()) {
                  RegisterCubit.get(context).userRegister(
                    name: registerData.userNameController.text,
                    phone: registerData.phoneController.text,
                    email: registerData.emailController.text,
                    password: registerData.passwordController.text,
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
