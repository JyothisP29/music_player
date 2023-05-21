import 'package:audioplayers/audioplayers.dart';

class MusicModel {
  final int musicId;
  final String musicName;
  final String assetPath;
  final String singerName;
  final String thumbnail;
  final AudioPlayer player;
  final bool isPlaying;

  MusicModel({
    required this.musicId,
    required this.assetPath,
    required this.musicName,
    required this.singerName,
    this.isPlaying = false,
    required this.thumbnail,
    required this.player,
  });

  MusicModel copyWith({bool? isPlaying}) {
    return MusicModel(
      musicId: musicId,
      assetPath: assetPath,
      musicName: musicName,
      singerName: singerName,
      isPlaying: isPlaying ?? this.isPlaying,
      thumbnail: thumbnail,
      player: player,
    );
  }
}
