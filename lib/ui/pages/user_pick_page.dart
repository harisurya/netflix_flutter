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
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/netflix_logo.png"))),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, right: defaultMargin),
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  ),
                )),
            Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Who's Watching?",
                      style: whiteTextFont.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 20),
                    displayUserBox()
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget displayUserBox() {
    List<Widget> widgets = [];

    widgets.add(const UserBox(userName: "Haveiss", pic: "haveiss_pic.png"));
    widgets.add(const UserBox(userName: "Gugum", pic: "gugum_pic.png"));
    widgets.add(const UserBox(userName: "Hari", pic: "hari_pic.png"));
    widgets.add(const UserBox(userName: "Cecem", pic: "cecem_pic.png"));
    widgets.add(const UserBox(userName: "Kids", pic: "kids_pic.png"));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 30,
        runSpacing: 20,
        children: widgets,
      ),
    );
  }
}
