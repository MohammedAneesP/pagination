import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/features/home_screen/data/repositories/video_list.dart';

part 'pagination_bloc_event.dart';
part 'pagination_bloc_state.dart';

List<dynamic> videoList = [];
List<dynamic> forWholeVideos = [];
List<dynamic> forTitles = [];
ValueNotifier<bool> anBool = ValueNotifier(false);
ValueNotifier<bool> hasNoMore = ValueNotifier(false);

class PaginationBlocBloc
    extends Bloc<PaginationBlocEvent, PaginationBlocState> {
  PaginationBlocBloc() : super(PaginationBlocInitial()) {
    on<AddNumbers>((event, emit) async {
      log("firstbloc calling");

      final toAllVideoClass = await fetchSomeVideos();
      log(toAllVideoClass.contents.first.video.thumbnails[0].url);
      forWholeVideos.addAll(toAllVideoClass.contents);
      try {
        if (forWholeVideos.isEmpty) {
          return emit(FirstList(anlist: const []));
        } else {
          int count = 0;
          for (var element in forWholeVideos) {
            if (count < 6) {
              log("--------${element.video.title.toString()}----");
              forTitles.add(element.video.title);
              videoList.add(element);
              count++;
            } else {
              break;
            }
          }
          return emit(FirstList(anlist: videoList));
        }
      } catch (e) {
        log(e.toString());
      }
    });
    on<AddNewNumbers>((event, emit) async {
      log("Pagination event");
      anBool.value = true;

      int count = 0;
      for (var element in forWholeVideos) {
        
        if (count < 7) {
          if (!forTitles.contains(element.video.title.toString())) {
            forTitles.add(element.video.title.toString());
            videoList.add(element);
            count++;
          }
        } else {
          break;
        }
      }
      anBool.value = false;
      if (videoList.length > 50) {
        hasNoMore.value = true;
        log(videoList.length.toString());
        log(hasNoMore.value.toString());
      }
      return emit(FirstList(anlist: videoList));
    });
  }
}
