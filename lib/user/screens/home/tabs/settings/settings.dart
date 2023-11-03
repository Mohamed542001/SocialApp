part of 'settings_imports.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state) {
          var model = HomeCubit.get(context).userModel;
          return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              BuildCover(model: model,),
              BuildUserInfo(),
              BuildEditButton(),
            ],
          ),
        );
        },
      ),
    );
  }
}
