import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reslow/models/coupon_model.dart';
import 'package:reslow/utils/dio_client.dart';
import 'package:reslow/widgets/common/search_bar.dart';
import 'package:reslow/widgets/common/category_tap_bar.dart';
import 'package:reslow/widgets/market/item_info.dart';
import 'package:reslow/models/market_item.dart';

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  List<MarketItem> itemList = [];
  final DioClient dioClient = DioClient();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isLast = false;
  int category = 0;
  int page = 0;
  String searchText = "";
  bool isFirst = true;

  void _getCategory(int index) {
    category = index;
    fetchData(false);
  }

  void _getSearchText(String text) {
    searchText = text;
    fetchData(false);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchData(false);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >
            _scrollController.position.maxScrollExtent * 0.8 &&
        !isLast &&
        !isLoading) {
      isLoading = true;
      page += 1;
      await fetchData(true);
      isLoading = false;
    }
  }

  Future<void> fetchData(bool isInfinite) async {
    if (!isInfinite) {
      setState(() {
        isFirst = true;
      });
      page = 0;
      isLast = false;
    }

    Map<String, dynamic> queryParams = {
      'page': page,
      'size': 4,
      'category': category == 0 ? '' : category,
      'keyword': searchText,
    };

    print(page);
    print(queryParams);

    Response response =
        await dioClient.dio.get('/products/', queryParameters: queryParams);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.data;
      print(jsonData);
      if (isInfinite) {
        if (jsonData.isEmpty) {
          isLast = true;
          print('empty');
        } else {
          setState(() {
            itemList.addAll(List<MarketItem>.from(
                jsonData.map((itemJson) => MarketItem.fromJson(itemJson))));
            // 높이를 처음으로 변경하기
          });
        }
      } else {
        setState(() {
          isFirst = false;
          itemList = List<MarketItem>.from(
              jsonData.map((itemJson) => MarketItem.fromJson(itemJson)));
        });
      }
    } else {
      print('HTTP request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: MySearchBar(searchcallback: _getSearchText)),
        CategoryTapBar(
          callback: _getCategory,
          initNumber: category,
        ),
        isFirst
            ? const Center(child: CircularProgressIndicator())
            : itemList.isEmpty
                ? const Expanded(
                    child: Center(
                      child: Text('검색 내역이 없습니다.'),
                    ),
                  )
                : Expanded(
                    child: RefreshIndicator(
                    child: ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          itemCount: itemList.length,
                          itemBuilder: (context, idx) {
                            return ItemInfo(
                              mediaWidth: MediaQuery.of(context).size.width,
                              mediaHeight: MediaQuery.of(context).size.height,
                              item: itemList[idx],
                              key: Key(itemList[idx].productNo.toString()),
                            );
                          },
                        )),
                    onRefresh: () async {
                      fetchData(false);
                    },
                  )),
      ],
    );
  }
}
