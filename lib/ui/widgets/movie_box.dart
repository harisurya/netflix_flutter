part of 'widgets.dart';

class MovieBox extends StatelessWidget {
  final String posterurl;
  final double widthBox;
  final double heightBox;
  final double movieRate;
  final bool isContinueWatching;
  final Function onTapInfo;
  const MovieBox(
      {Key? key,
      required this.posterurl,
      this.widthBox = 130,
      this.heightBox = 170,
      required this.movieRate,
      this.isContinueWatching = false,
      required this.onTapInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: widthBox,
            height: heightBox,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(5),
                    topRight: const Radius.circular(5),
                    bottomLeft: Radius.circular(isContinueWatching ? 0 : 5),
                    bottomRight: Radius.circular(isContinueWatching ? 0 : 5)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(imageBaseURL + posterurl),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                movieRate > 7.0
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 25,
                            height: 32,
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Column(
                              children: [
                                Text(
                                  "TOP",
                                  style: whiteTextFont.copyWith(
                                      fontWeight: FontWeight.bold, fontSize: 7),
                                ),
                                Text(
                                  "10",
                                  style: whiteTextFont.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                ),
                              ],
                            )),
                      )
                    : const SizedBox(),
                isContinueWatching
                    ? Container(
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.2)),
                        child: Center(
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black.withOpacity(0.4),
                                  border:
                                      Border.all(color: whiteColor, width: 2)),
                              child: Icon(
                                Icons.play_arrow,
                                color: whiteColor,
                                size: 32,
                              )),
                        ),
                      )
                    : const SizedBox(),
              ],
            )),
        isContinueWatching
            ? Row(
                children: [
                  Container(
                    height: 3,
                    width: 130 - (movieRate * 10),
                    color: Colors.red,
                  ),
                  Container(
                    height: 3,
                    width: 130 - (130 - (movieRate * 10)),
                    color: Colors.grey,
                  )
                ],
              )
            : const SizedBox(),
        isContinueWatching
            ? Container(
                height: 40,
                width: 130,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.grey.shade900),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            onTapInfo();
                          },
                          child: Icon(Icons.info_outline_rounded,
                              color: whiteColor)),
                      Icon(
                        Icons.more_vert,
                        color: whiteColor,
                      )
                    ]),
              )
            : const SizedBox()
      ],
    );
  }
}
