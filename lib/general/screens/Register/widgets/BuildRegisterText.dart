part of 'RegisterWidgetsImports.dart';

class BuildRegisterText extends StatelessWidget {
  const BuildRegisterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Register now to browse our social media',
            style: TextStyle(
                fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
