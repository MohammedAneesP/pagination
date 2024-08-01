import 'package:pagination/features/home_screen/data/models/video_content.dart';

abstract class VideoDomainRepo{
  Future<Videos> getAllVideos();
}