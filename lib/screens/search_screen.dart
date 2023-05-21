import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  backButton(),
                  const SizedBox(
                    width: 10,
                  ),
                  favouriteButton(),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "Recent Favourites",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (1 / 1.3),
                  shrinkWrap: true,
                  children: List.generate(6, (index) {
                    return songGrid(context);
                  }),
                ),
              )
            ],
          ),
        ));
  }

  Column songGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .18,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Millions",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15),
          child: Text(
            "asdjbajshv asjhbass dshcbasib",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  Container favouriteButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.5),
      ),
      width: 50,
      height: 50,
      child: const Center(
          child: Icon(
        Icons.favorite_border,
        color: Colors.white,
      )),
    );
  }

  Container backButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(.5),
      ),
      width: 50,
      height: 50,
      child: const Center(
          child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      )),
    );
  }
}
