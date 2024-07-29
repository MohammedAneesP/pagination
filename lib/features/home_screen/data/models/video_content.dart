// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

Videos videosFromJson(String str) => Videos.fromJson(json.decode(str));

String videosToJson(Videos data) => json.encode(data.toJson());

class Videos {
    final List<Content> contents;

    Videos({
        required this.contents,
    });

    factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        contents: List<Content>.from(json["contents"].map((x) => Content.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contents": List<dynamic>.from(contents.map((x) => x.toJson())),
    };
}

class Content {
    final Video video;

    Content({
        required this.video,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        video: Video.fromJson(json["video"]),
    );

    Map<String, dynamic> toJson() => {
        "video": video.toJson(),
    };
}

class Video {
    final String channelId;
    final String channelName;
    final String lengthText;
    final String publishedTimeText;
    final List<Thumbnail> thumbnails;
    final String title;
    final String videoId;
    final String viewCountText;

    Video({
        required this.channelId,
        required this.channelName,
        required this.lengthText,
        required this.publishedTimeText,
        required this.thumbnails,
        required this.title,
        required this.videoId,
        required this.viewCountText,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        channelId: json["channelId"],
        channelName: json["channelName"],
        lengthText: json["lengthText"],
        publishedTimeText: json["publishedTimeText"],
        thumbnails: List<Thumbnail>.from(json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
        title: json["title"],
        videoId: json["videoId"],
        viewCountText: json["viewCountText"],
    );

    Map<String, dynamic> toJson() => {
        "channelId": channelId,
        "channelName": channelName,
        "lengthText": lengthText,
        "publishedTimeText": publishedTimeText,
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
        "title": title,
        "videoId": videoId,
        "viewCountText": viewCountText,
    };
}

class Thumbnail {
    final int height;
    final String url;
    final int width;

    Thumbnail({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}
