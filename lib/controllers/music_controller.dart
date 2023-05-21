import 'package:audio/model/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  var musics = [
    MusicModel(
      musicId: 1,
      musicName: "Jeena Jeena",
      assetPath: "music/jeena_jeena.mp3",
      player: AudioPlayer(),
      singerName: "Atif Aslam",
      thumbnail: "",
    ),
    MusicModel(
      musicId: 2,
      musicName: "AnyOne",
      player: AudioPlayer(),
      singerName: "Justin Bieber",
      assetPath: "music/anyone.mp3",
      thumbnail: "",
    ),
    MusicModel(
      musicId: 3,
      musicName: "Lovely",
      player: AudioPlayer(),
      singerName: "Billie Eilish",
      assetPath: "music/Lovely.mp3",
      thumbnail: "",
    ),
  ].obs;

  var currentTab = 0.obs;

  var pageController = PageController().obs;

  changeTab(int index) {
    currentTab(index);
    changeTabView();
  }

  changeTabView() {
    pageController.value.animateToPage(
      currentTab.value,
      duration: const Duration(microseconds: 200),
      curve: Curves.bounceInOut,
    );
    update();
  }

  playOrPauseMusic(MusicModel music, int index) {
    final bool isPlaying = music.isPlaying;
    if (isPlaying) {
      music.player.pause();
    } else {
      music.player.play(AssetSource(music.assetPath));
    }
    musics[index] = music.copyWith(isPlaying: !isPlaying);
  }

  @override
  void onClose() {
    for (var element in musics) {
      element.player.dispose();
    }
    super.onClose();
  }
}
