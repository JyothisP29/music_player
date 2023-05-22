import 'package:audio/controllers/music_controller.dart';
import 'package:audio/model/music_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongListWidget extends StatefulWidget {
  const SongListWidget({Key? key}) : super(key: key);

  @override
  State<SongListWidget> createState() => _SongListWidgetState();
}

class _SongListWidgetState extends State<SongListWidget> {
  final MusicController musicController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: musicController.musics.length,
        itemBuilder: (context, index) {
          final music = musicController.musics.elementAt(index);
          return song(music, index, musicController);
        },
      ),
    );
  }

  Widget song(MusicModel music, int index, MusicController controller) {
    return ListTile(
      leading: InkWell(
        onTap: () async {
          controller.playOrPauseMusic(music, index);
        },
        child:  Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              music.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
        ),
      ),
      title: Text(
        music.musicName,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        music.singerName,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: const Icon(
        Icons.favorite_border,
        color: Colors.white,
      ),
    );
  }
}
