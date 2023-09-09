import 'package:flutter/material.dart';
import 'package:flutter_shopping_ui_kit/utils/constant.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 45.0,
          left: 24.0,
          right: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter a product name eg. pension',
                  hintStyle: const TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(16),
                  fillColor: const Color(0xFFEEEEEE),
                  prefixIcon: Icon(
                    Icons.mic,
                    color: Colors.blueGrey[200],
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: imgList.length,
                itemBuilder: (context, pos) {
                  return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      height: 148,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    imgList[pos],
                                  ),
                                ),
                              ),
                              height: 350.0,
                            ),
                            Container(
                              height: 350.0,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  gradient: LinearGradient(
                                      begin: FractionalOffset.topCenter,
                                      end: FractionalOffset.bottomCenter,
                                      colors: [
                                        Colors.black26,
                                        Colors.black26,
                                      ],
                                      stops: [
                                        0.0,
                                        1.0
                                      ])),
                            ),
                            const Center(
                              child: Text(
                                "Kampanya",
                                style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
