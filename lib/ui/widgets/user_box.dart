part of 'widgets.dart';

class UserBox extends StatelessWidget {
  final String userName;
  final String pic;

  const UserBox({Key? key, required this.userName, required this.pic})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        currentUser = userName;
        currentUserPic = pic;
        context.read<PageBloc>().add(GoToHomePage());
      },
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: AssetImage("assets/$pic"))),
          ),
          const SizedBox(height: 10),
          Text(userName, style: whiteTextFont)
        ],
      ),
    );
  }
}
