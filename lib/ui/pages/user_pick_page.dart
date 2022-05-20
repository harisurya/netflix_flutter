part of 'pages.dart';

class UserPickPage extends StatefulWidget {
  const UserPickPage({Key? key}) : super(key: key);

  @override
  State<UserPickPage> createState() => _UserPickPageState();
}

class _UserPickPageState extends State<UserPickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/netflix_logo.png")))),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 35, right: 5),
            child: Icon(
              Icons.edit,
              color: whiteColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.only(top: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Who's watching ?",
                  style: whiteTextFont.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),
                displayUserBoxes(),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget displayUserBoxes() {
    List<Widget> widgets = [];

    widgets.add(const UserBox(
      userName: "Haveiss",
      pic: "haveiss_pic.png",
    ));
    widgets.add(const UserBox(
      userName: "Gugum",
      pic: "gugum_pic.png",
    ));
    widgets.add(const UserBox(
      userName: "Hari",
      pic: "hari_pic.png",
    ));
    widgets.add(const UserBox(
      userName: "Cecem",
      pic: "cecem_pic.png",
    ));
    widgets.add(const UserBox(
      userName: "Kids",
      pic: "kids_pic.png",
    ));

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Wrap(runSpacing: 20, spacing: 30, children: widgets));
  }
}
