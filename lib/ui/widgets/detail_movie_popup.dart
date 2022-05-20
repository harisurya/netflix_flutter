part of 'widgets.dart';

class DetailMoviePopup extends StatelessWidget {
  final int movieId;
  final Function onClose;
  const DetailMoviePopup(
      {Key? key, required this.movieId, required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieServices.getDetails(movieId: movieId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MovieDetail detail = snapshot.data as MovieDetail;
          return Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, bottom: 10),
                      child: MovieBox(
                        posterurl: detail.posterPath,
                        widthBox: 110,
                        heightBox: 150,
                        movieRate: detail.voteAverage,
                        onTapInfo: () {},
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: defaultMargin),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(detail.title,
                                style: whiteTextFont.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              detail.genresAndlanguage,
                              style: greyTextFont.copyWith(fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              detail.overview,
                              style: whiteTextFont.copyWith(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              maxLines: 5,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuWithIcon(
                          title: "Play",
                          icon: Icons.play_arrow,
                          isRounded: true,
                          iconSize: 28,
                          iconColor: blackColor,
                          fontColor: greyColor,
                          roundedColor: whiteColor),
                      MenuWithIcon(
                          title: "Download",
                          icon: Icons.get_app,
                          isRounded: true,
                          iconSize: 28,
                          iconColor: whiteColor,
                          fontColor: greyColor,
                          roundedColor: Colors.grey.shade700),
                      MenuWithIcon(
                          title: "My List",
                          icon: Icons.add,
                          isRounded: true,
                          iconSize: 28,
                          iconColor: whiteColor,
                          fontColor: greyColor,
                          roundedColor: Colors.grey.shade700),
                      MenuWithIcon(
                          title: "Share",
                          icon: Icons.share_outlined,
                          isRounded: true,
                          iconSize: 28,
                          iconColor: whiteColor,
                          fontColor: greyColor,
                          roundedColor: Colors.grey.shade700)
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Divider(color: greyColor),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outlined,
                            size: 28,
                            color: whiteColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Detail & More",
                            style: whiteTextFont.copyWith(fontSize: 16),
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: whiteColor,
                        size: 28,
                      )
                    ],
                  ),
                )
              ]),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      onClose();
                    },
                    child: Container(
                      margin: EdgeInsets.all(defaultMargin),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade700),
                      child: Icon(Icons.close, color: whiteColor),
                    ),
                  ))
            ],
          );
        } else {
          return const LoadingCircle();
        }
      },
    );
  }
}
