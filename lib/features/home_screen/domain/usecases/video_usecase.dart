import 'package:pagination/features/home_screen/data/models/video_content.dart';
import 'package:pagination/features/home_screen/domain/repositories/video_domain_repo.dart';

class GetAllVideosUsecase {
  
  final VideoDomainRepo repository;
  GetAllVideosUsecase({required this.repository});

  Future<Videos> videoDomainUsecase() async {
    return await repository.getAllVideos();
  }
}
