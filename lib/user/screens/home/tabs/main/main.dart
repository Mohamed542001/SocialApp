part of 'main_imports.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          BuildMainHeader(),
          ListView.separated(
            separatorBuilder: (context,i)=>SizedBox(
              height: 8,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context,i)=>BuildPostView(),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
