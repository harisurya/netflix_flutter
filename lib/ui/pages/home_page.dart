part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedMovieId = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: blackColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 65),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      FutureBuilder(
                          future: MovieServices.getUpComingMovies(1),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              List<Movie> movies = snapshot.data as List<Movie>;

                              int index = Random().nextInt(movies.length - 1);
                              Movie movie = movies[index];

                              return Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: 500,
                                  height: MediaQuery.of(context).size.height *
                                          2 /
                                          3 -
                                      50,
                                  decoration: BoxDecoration(
                                      color: blackColor,
                                      image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              imageBaseURL + movie.posterPath),
                                          fit: BoxFit.cover)),
                                ),
                              );
                            } else {
                              return const LoadingCircle();
                            }
                          })),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/netflix_icon.png"))),
                            ),
                            Row(
                              children: [
                                Icon(Icons.search, size: 32, color: whiteColor),
                                const SizedBox(width: 20),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<PageBloc>()
                                        .add(GoToUserPickPage());
                                  },
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/$currentUserPic"))),
                                  ),
                                ),
                                SizedBox(width: defaultMargin),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuWithIcon(
                                  title: "My List",
                                  icon: Icons.add,
                                  fontColor: greyColor,
                                  iconColor: whiteColor),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.play_arrow, size: 28),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Play",
                                        style: blackTextFont.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ],
                                  )),
                              MenuWithIcon(
                                  title: "Info",
                                  icon: Icons.info_outlined,
                                  fontColor: greyColor,
                                  iconColor: whiteColor)
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: defaultMargin),
                      child: Text(
                        "Continue Watching for $currentUser",
                        style: whiteTextFont.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    displayContinueMovie(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: defaultMargin),
                      child: Text(
                        "Trending Now",
                        style: whiteTextFont.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    displayTrendingMovie(),
                    const SizedBox(height: 150)
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      height: (selectedMovieId > 0) ? 300 : 0,
                      decoration: BoxDecoration(color: Colors.grey.shade900),
                      child: (selectedMovieId > 0)
                          ? DetailMoviePopup(
                              movieId: selectedMovieId,
                              onClose: () {
                                setState(() {
                                  selectedMovieId = 0;
                                });
                              })
                          : const SizedBox(),
                    ),
                    (selectedMovieId > 0)
                        ? const SizedBox()
                        : Container(
                            height: 65,
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MenuWithIcon(
                                    title: "Home",
                                    icon: Icons.home,
                                    iconSize: 28,
                                    fontColor: whiteColor,
                                    iconColor: whiteColor),
                                MenuWithIcon(
                                    title: "Games",
                                    iconSize: 28,
                                    icon: Icons.sports_esports_outlined,
                                    fontColor: greyColor,
                                    iconColor: greyColor),
                                MenuWithIcon(
                                    title: "News & Hot",
                                    iconSize: 28,
                                    icon: Icons.newspaper,
                                    fontColor: greyColor,
                                    iconColor: greyColor),
                                MenuWithIcon(
                                    title: "Downloads",
                                    iconSize: 28,
                                    icon: Icons.get_app_rounded,
                                    fontColor: greyColor,
                                    iconColor: greyColor),
                              ],
                            ),
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget displayContinueMovie() {
    return FutureBuilder(
      future: MovieServices.getMovies(1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> widgets = [];

          List<Movie> movies = snapshot.data as List<Movie>;
          widgets.add(SizedBox(
            width: defaultMargin,
          ));
          for (Movie movie in movies) {
            widgets.add(MovieBox(
                posterurl: movie.posterPath,
                movieRate: movie.voteAverage,
                isContinueWatching: true,
                onTapInfo: () {
                  setState(() {
                    selectedMovieId = movie.id;
                  });
                }));
          }
          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(children: widgets));
        } else {
          return const LoadingCircle();
        }
      },
    );
  }

  Widget displayTrendingMovie() {
    return FutureBuilder(
      future: MovieServices.getUpComingMovies(1),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget> widgets = [];

          List<Movie> movies = snapshot.data as List<Movie>;
          widgets.add(SizedBox(
            width: defaultMargin,
          ));
          for (Movie movie in movies) {
            widgets.add(GestureDetector(
              onTap: () {
                setState(() {
                  selectedMovieId = movie.id;
                });
              },
              child: MovieBox(
                  posterurl: movie.posterPath,
                  movieRate: movie.voteAverage,
                  onTapInfo: () {}),
            ));
          }
          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: Row(children: widgets));
        } else {
          return const LoadingCircle();
        }
      },
    );
  }
}
