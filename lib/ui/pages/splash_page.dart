part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    context.read<PageBloc>().add(GoToUserPickPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blackColor,
        child: Center(
            child: Container(
          width: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/netflix_logo.png"))),
        )),
      ),
    );
  }
}
