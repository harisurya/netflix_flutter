part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    if (prevPageEvent is! GoToSplashPage) {
      prevPageEvent = GoToSplashPage();
      context.watch<PageBloc>().add(GoToSplashPage());
    }

    return BlocBuilder<PageBloc, PageState>(builder: (_, pageState) {
      if (pageState is OnUserPickPage) {
        return const UserPickPage();
      } else if (pageState is OnHomePage) {
        return const HomePage();
      } else if (pageState is OnMovieDetailPage) {
        return const MovieDetailPage();
      } else {
        return const SplashPage();
      }
    });
  }
}
