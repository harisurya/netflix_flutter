part of 'widgets.dart';

class MenuWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final Color fontColor;
  final Color iconColor;
  final bool isRounded;
  final Color roundedColor;

  const MenuWithIcon(
      {Key? key,
      required this.title,
      required this.icon,
      this.iconSize = 32,
      this.isRounded = false,
      required this.fontColor,
      required this.iconColor,
      this.roundedColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isRounded ? roundedColor : Colors.transparent),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        style: whiteTextFont.copyWith(color: fontColor),
      )
    ]);
  }
}
