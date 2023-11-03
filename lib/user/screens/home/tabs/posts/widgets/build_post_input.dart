part of 'post_widgets_imports.dart';

class BuildPostInput extends StatelessWidget {
  const BuildPostInput({Key? key, required this.data}) : super(key: key);
  final PostsData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TextFormField(
        controller: data.textController,
        decoration: InputDecoration(
            hintText: "What is in your mind...",
            border: InputBorder.none
        ),
      ),
    );
  }
}
