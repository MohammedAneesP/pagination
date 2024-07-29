
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnVideoTile extends StatelessWidget {
  const AnVideoTile({
    super.key,
    required this.theVideo,
    required this.height,
    required this.imageUrl,
    required this.videoTitleSubString,
    required this.subStringedd,
  });

  final dynamic theVideo;
  final Size height;
  final String imageUrl;
  final String videoTitleSubString;
  final String subStringedd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: height.height * 0.36,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Stack(
                children: [
                  Container(
                    height: height.height * .25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: height.height * 0.21,
                    left: height.width * 0.87,
                    child: Container(
                      width: height.width * 0.095,
                      decoration: const BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Center(
                        child: Text(
                          theVideo.lengthText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(
              height: height.height * 0.1,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: height.width * 0.16,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: height.width * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: 2,
                          videoTitleSubString,
                          
                          style: const TextStyle(
                             fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Text("$subStringedd - ",
                                style: const TextStyle(fontSize: 13)),
                            Text("${theVideo.viewCountText} - ",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13)),
                            Text(theVideo.publishedTimeText,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
