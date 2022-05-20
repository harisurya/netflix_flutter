part of 'shared.dart';

PageEvent prevPageEvent = GoToSplashPage();

String apiKey = '244091549747d66374332b90f82293b8';
String imageBaseURL = 'https://image.tmdb.org/t/p/w780';

http.Client client = http.Client();
String currentUser = "";
String currentUserPic = "";

