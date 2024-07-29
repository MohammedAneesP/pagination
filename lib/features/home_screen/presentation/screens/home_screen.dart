import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/features/home_screen/presentation/bloc/pagination_bloc_bloc.dart';
import 'package:pagination/features/home_screen/presentation/screens/widgets/an_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController anController;

  scrollListener() async {
    if (anController.position.pixels >= anController.position.maxScrollExtent &&
        anBool.value == false &&
        hasNoMore.value == false) {
      BlocProvider.of<PaginationBlocBloc>(context).add(AddNewNumbers());
    }
  }

  @override
  void initState() {
    BlocProvider.of<PaginationBlocBloc>(context).add(AddNumbers());
    anController = ScrollController();
    if (anBool.value == false && hasNoMore.value == false) {
      anController.addListener(scrollListener);
      anBool.value == true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PaginationBlocBloc, PaginationBlocState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (FirstList):
                final theValue = state as FirstList;
                log("entire list rebuilding");
                return CustomScrollView(
                  controller: anController,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(2.0),
                      sliver: SliverList.builder(
                        itemBuilder: (context, index) {
                          if (index < theValue.anlist.length) {
                            String imageUrl = theValue
                                .anlist[index].video.thumbnails[1].url
                                .toString();
                            String channelName =
                                theValue.anlist[index].video.channelName;
                            String subStringedd = "";

                            String videoTitle =
                                theValue.anlist[index].video.title;
                            String videoTitleSubString = "";
                            if (videoTitle.length <= 85) {
                              videoTitleSubString = videoTitle;
                            } else {
                              videoTitleSubString = videoTitle.substring(0, 85);
                            }

                            if (channelName.length <= 7) {
                              subStringedd = channelName;
                            } else {
                              subStringedd = channelName.substring(0, 8);
                            }

                            return AnVideoTile(
                              theVideo: theValue.anlist[index].video,
                              height: kHeight,
                              imageUrl: imageUrl,
                              videoTitleSubString: videoTitleSubString,
                              subStringedd: subStringedd,
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                child: hasNoMore.value == true
                                    ? const Text("No More")
                                    : const CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                        itemCount: theValue.anlist.length + 1,
                      ),
                    ),
                  ],
                );
              default:
                return const Center(
                  child: Text("Fetching"),
                );
            }
          },
        ),
      ),
    );
  }
}
