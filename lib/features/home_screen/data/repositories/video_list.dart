import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:pagination/features/home_screen/data/models/video_content.dart';

Future<Videos> fetchSomeVideos() async {

  final dio = Dio();
  Videos allVideos = Videos(contents: []);
  const url = 'https://youtube-search-and-download.p.rapidapi.com/trending';
  try {
    final anResponse = await dio.get(url,
        options: Options(
          headers: {
            'X-RapidAPI-Key':
                '200c82b907msh24597d44ca3e98dp1449abjsn7155f67276f3',
            'X-RapidAPI-Host': 'youtube-search-and-download.p.rapidapi.com',
            "hl": "en",
            "gl": "in",
          },
        ));
    if (anResponse.statusCode == 200) {
      final datas = anResponse.data;
      log(anResponse.statusMessage.toString());
      final toModelClass = Videos.fromJson(datas);
      return toModelClass;
    }
    return allVideos;
  } catch (e) {
    log("$e, something went wrong");
    return allVideos;
  }
  
}
