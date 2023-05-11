import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reslow/pages/knowhow/knowhowcomment.dart';
import 'package:reslow/pages/knowhow/knowhowdetail.dart';
import 'package:reslow/widgets/common/custom_app_bar.dart';
import 'package:reslow/widgets/common/profile_small.dart';
import 'package:reslow/widgets/knowhow/knowhow_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mylikeknowhow extends StatefulWidget {
  const Mylikeknowhow({Key? key}) : super(key: key);

  @override
  _MylikeknowhowState createState() => _MylikeknowhowState();
}

List<dynamic> content = [];

int _selectedindex = -1;

class _MylikeknowhowState extends State<Mylikeknowhow> {
  Dio dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    _requestMyLikeKnowhow();
    super.initState();
  }

  void _requestMyLikeKnowhow() async {
    try {
      final token = await _getTokenFromSharedPreferences();
      print("token $token");
      final response =
          await dio.get('http://k8b306.p.ssafy.io:8080/knowhows/likes',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }),
              queryParameters: {"page": 0, "size": 10}).then(
        (value) {
          print("여기${value.data}");
          setState(() {
            content = value.data["content"];
          });
        },
      );
    } on DioError catch (e) {
      print('error: $e');
    }
  }

  Future<String?> _getTokenFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future<void> _requestKnowhowLike(
      int KnowhowNo, bool isLike, int index) async {
    try {
      if (isLike) {
        final token = await _getTokenFromSharedPreferences();
        print("token $token");
        final response = await dio
            .post('http://k8b306.p.ssafy.io:8080/knowhows/${KnowhowNo}/like',
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }))
            .then((value) {
          setState(() {
            content[index]["likeCnt"] = value.data["count"];
          });
        });
        print(response);
      } else {
        final token = await _getTokenFromSharedPreferences();
        print("token $token");
        final response = await dio
            .delete('http://k8b306.p.ssafy.io:8080/knowhows/${KnowhowNo}/like',
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }))
            .then((value) {
          setState(() {
            content[index]["likeCnt"] = value.data["count"];
          });
        });
        print(response);
      }
    } on DioError catch (e) {
      print('likeerror: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              title: "내가 찜한 글",
            ),
            body: Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: const Color(0xffDBDBDB)),
              Expanded(
                  child: ListView.builder(
                      itemCount: content.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(4, 0, 16, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ProfileSmall(
                                        url: content[index]["profilePic"],
                                        name: content[index]["writer"]),
                                    Image.asset(
                                      "assets/image/share.png",
                                      width: 24,
                                    )
                                  ],
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: const Color(0xffDBDBDB)),
                            InkWell(
                                onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => KnowHowDetail(
                                              knowhowNo: content[index]
                                                  ["knowhowNo"]),
                                        ),
                                      )
                                    },
                                child: Column(children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.all(0),
                                      child: Center(
                                          child: Column(children: [
                                        Center(
                                            child: KnowHowGrid(
                                                images: content[index]
                                                    ["pictureList"],
                                                imageLTH: content[index]
                                                    ["pictureCnt"]))
                                      ]))),
                                  Container(
                                      margin: const EdgeInsets.all(16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.6,
                                                child: Text(
                                                  content[index]["title"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        content[index]["like"] =
                                                            !content[index]
                                                                ["like"];
                                                      });
                                                      _requestKnowhowLike(
                                                          content[index]
                                                              ["knowhowNo"],
                                                          content[index]
                                                              ["like"],
                                                          index);
                                                    },
                                                    child: Row(children: [
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 0, 8, 0),
                                                          child: Image.asset(
                                                            (content[index][
                                                                        "like"] ??
                                                                    false)
                                                                ? "assets/image/full_heart.png"
                                                                : "assets/image/heart.png",
                                                            width: 24,
                                                          )),
                                                      Text(
                                                        "${content[index]["likeCnt"]}",
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    ])),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () => {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  Knowhowcomment(
                                                                      knowhowid:
                                                                          content[index]
                                                                              [
                                                                              "knowhowNo"]),
                                                            ),
                                                          )
                                                        },
                                                    child: Row(children: [
                                                      Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 0, 8, 0),
                                                          child: Image.asset(
                                                            "assets/image/comment.png",
                                                            width: 24,
                                                          )),
                                                      Text(
                                                        "${content[index]["commentCnt"]}",
                                                        style: const TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    ])),
                                              ],
                                            )
                                          ])),
                                ])),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 8,
                                color: const Color(0xffDBDBDB)),
                          ],
                        );
                      })),
            ])));
  }
}
