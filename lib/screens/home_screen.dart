import 'package:audio/controllers/music_controller.dart';
import 'package:audio/screens/widgets/song_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _list = [
    "Trending right now",
    "Rock",
    "Hip hop",
    "Melody",
    "Bass"
  ];

  @override
  Widget build(BuildContext context) {
    final MusicController musicController = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                moreButton(),
                const SizedBox(
                  width: 10,
                ),
                searchBar()
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Text(
                  "Trending right now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            carouselBoxes(),
            const SizedBox(
              height: 20,
            ),
            tabs(musicController),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(
                () => PageView(
                  onPageChanged: musicController.changeTab,
                  pageSnapping: true,
                  controller: musicController.pageController.value,
                  children: const [
                    SongListWidget(),
                    SongListWidget(),
                    SongListWidget(),
                    SongListWidget(),
                    SongListWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabs(MusicController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: SizedBox(
        height: 30,
        width: double.infinity,
        child: GetBuilder<MusicController>(
          builder: (context) {
            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              primary: true,
              itemBuilder: (context, index) {
                final bool isCurrentTab = controller.currentTab.value == index;
                return Row(
                  children: [
                    InkWell(
                      onTap: () => controller.changeTab(index),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: isCurrentTab ? Colors.blue : Colors.black,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                _list.elementAt(index),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 12,
                );
              },
              itemCount: _list.length,
            );
          }
        ),
      ),
    );
  }

  Widget carouselBoxes() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent,
                ),
                width: 250,
                height: 50,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 105,
                    ),
                    Container(
                      width: 230,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey.withOpacity(.5),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "The Dark Side",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "M G Sreekumar",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ],
                            ),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget searchBar() {
    return Expanded(
      child: Container(
        // margin: const EdgeInsets.only(right: 30, left: 0),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          keyboardType: TextInputType.text,
          autofillHints: const [AutofillHints.username],
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.zero,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(.5), width: 0)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(.5), width: 0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(.5), width: 0)),
            hintText: 'Search',
            hintStyle: const TextStyle(
              fontSize: 18.0,
              color: Color(0xffB1BBC6),
            ),
            fillColor: Colors.grey.withOpacity(.5),
            filled: true,
          ),
        ),
      ),
    );
  }

  Container moreButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.5),
      ),
      width: 50,
      height: 50,
      child: const Center(
          child: Icon(
        Icons.more_vert_rounded,
        color: Colors.white,
      )),
    );
  }
}
