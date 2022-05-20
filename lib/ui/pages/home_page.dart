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
            Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 2 / 3,
                          decoration: BoxDecoration(
                              color: blackColor,
                              image: const DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      "https://www.themoviedb.org/t/p/w1280/7W0G3YECgDAfnuiHG91r8WqgIOe.jpg"),
                                  fit: BoxFit.cover))),
                      const SizedBox(height: 10),
                      Text(
                        "Feel-Good, Goofy, Kids Music, Notable Soundtrack, Musical",
                        style: whiteTextFont.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Icon(
                                Icons.add,
                                size: 32,
                                color: whiteColor,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "My List",
                                style: whiteTextFont,
                              )
                            ]),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(children: [
                                const Icon(
                                  Icons.play_arrow,
                                  size: 32,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Play",
                                  style: blackTextFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                            Column(children: [
                              Icon(
                                Icons.info_outline_rounded,
                                size: 32,
                                color: whiteColor,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Info",
                                style: whiteTextFont,
                              )
                            ]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(left: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Continue watching for $currentUser",
                            style: whiteTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      displayMovieList(),
                      const SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.only(left: defaultMargin),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Trending Now",
                            style: whiteTextFont.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      displayUpComingMovies(),
                      const SizedBox(height: 100),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/netflix_icon.png"))),
                    ),
                    Row(children: [
                      Icon(Icons.search_rounded, color: whiteColor),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(GoToUserPickPage());
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage("assets/$currentUserPic"))),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  height: (selectedMovieId > 0)
                      ? MediaQuery.of(context).size.height * 1 / 2.5
                      : 0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  child: (selectedMovieId > 0)
                      ? DetailMoviePopup(
                          movieId: selectedMovieId,
                          onClose: () {
                            setState(() {
                              selectedMovieId = 0;
                            });
                          })
                      : const SizedBox()),
            ),
            (selectedMovieId > 0)
                ? const SizedBox()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      elevation: 2.0,
                      child: Container(
                          height: 65,
                          color: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuWithIcon(
                                  iconSize: 28,
                                  title: "Home",
                                  icon: Icons.home,
                                  iconColor: whiteColor,
                                  fontColor: whiteColor),
                              MenuWithIcon(
                                iconSize: 28,
                                title: "Games",
                                icon: Icons.sports_esports_outlined,
                                iconColor: greyColor,
                                fontColor: greyColor,
                              ),
                              MenuWithIcon(
                                iconSize: 28,
                                title: "News & Hot",
                                icon: Icons.movie_creation_outlined,
                                iconColor: greyColor,
                                fontColor: greyColor,
                              ),
                              MenuWithIcon(
                                iconSize: 28,
                                title: "Downloads",
                                icon: Icons.get_app_rounded,
                                iconColor: greyColor,
                                fontColor: greyColor,
                              )
                            ],
                          )),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget displayMovieList() {
    return FutureBuilder(
        future: MovieServices.getMovies(1),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data as List<Movie>;

            List<Widget> widgets = [];
            widgets.add(SizedBox(width: defaultMargin));
            for (Movie movie in movies) {
              widgets.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieBox(
                    posterurl: movie.posterPath,
                    movieRate: movie.voteAverage,
                    isContinueWatching: true,
                    onTapInfo: () {
                      setState(() {
                        selectedMovieId = movie.id;
                      });
                    },
                  ),
                ],
              ));
            }
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(children: widgets));
          } else {
            return const LoadingCircle();
          }
        }));
  }

  displayUpComingMovies() {
    return FutureBuilder(
        future: MovieServices.getUpComingMovies(1),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Movie> movies = snapshot.data as List<Movie>;

            List<Widget> widgets = [];
            widgets.add(SizedBox(width: defaultMargin));
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
                    onTapInfo: () {},
                  )));
            }
            return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                child: Row(children: widgets));
          } else {
            return const LoadingCircle();
          }
        }));
  }
}
