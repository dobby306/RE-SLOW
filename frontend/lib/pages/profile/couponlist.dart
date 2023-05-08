import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reslow/utils/dio_client.dart';
import 'package:reslow/widgets/common/custom_app_bar.dart';

class Couponlist extends StatefulWidget {
  @override
  _CouponlistState createState() => _CouponlistState();
}

class _CouponlistState extends State<Couponlist> {
  final DioClient dioClient = DioClient();
  List<Coupon> coupons = [];

  Future<void> fetchData() async {
    Map<String, dynamic> queryParams = {
      'page': 0,
      'size': 10,
      'sort': 'number.desc', // What should I put for the field???
    };
    Response response =
        await dioClient.dio.get('/coupons/my', queryParameters: queryParams);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = {"content": response.data};
      print(jsonData);

      setState(() {
        // Update the state with the fetched data
        // 데이터의 콘텐트의 쿠폰
        coupons = List<Coupon>.from(
            jsonData['content'].map((itemJson) => Coupon.fromJson(itemJson)));
        // jsonData 안에서 키값 확인하고 바꾸기
      });
    } else {
      // Handle any errors or display an error message
      print('HTTP request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: '보유 쿠폰'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: ListView.builder(
                itemCount: coupons.length,
                itemBuilder: (BuildContext context, int index) {
                  Coupon coupon = coupons[index];
                  return Card(
                    color: Colors.green.shade200,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      child: ListTile(
                        title: Text('${coupon.discountAmount}% off'),
                        subtitle:
                            Text('${coupon.startDate} ~ ${coupon.endDate}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// class CouponList extends StatelessWidget {
//   final List<Coupon> coupons;
//   final DioClient dioClient = DioClient();

//   CouponList({required this.coupons});

//   Future<void> fetchData () async {
//         Response response =
//         await dioClient.dio.get('/coupons/my');

//     if (response.statusCode == 200) {
//       Map<String, dynamic> jsonData = response.data;
//       print(jsonData);

//       // setState(() {
//       //   // Update the state with the fetched data
//       //   itemList = List<MarketItem>.from(jsonData['content']
//       //       .map((itemJson) => MarketItem.fromJson(itemJson)));
//       // });
//     } else {
//       // Handle any errors or display an error message
//       print('HTTP request failed with status: ${response.statusCode}');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   List<Coupon> coupons = [
//   //     Coupon(discountAmount: 22, startDate: '2023-07-01', endDate: '2023-07-31'),
//   //     Coupon(discountAmount: 33, startDate: '2023-08-01', endDate: '2023-08-31'),
//   //   ];

//     return SafeArea(
//         child: Scaffold(
//       appBar: CustomAppBar(title: '보유 쿠폰'),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Container(
//             height: MediaQuery.of(context).padding.top,
//           ),
//           Expanded(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//               child: ListView.builder(
//                 itemCount: coupons.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Coupon coupon = coupons[index];
//                   return Card(
//                     color: Colors.green.shade200,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//                       child: ListTile(
//                         title: Text('${coupon.discountAmount}% off'),
//                         subtitle:
//                             Text('${coupon.startDate} ~ ${coupon.endDate}'),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

class Coupon {
  final int discountAmount;
  final String startDate;
  final String endDate;

  Coupon(
      {required this.discountAmount,
      required this.startDate,
      required this.endDate});

  factory Coupon.fromJson(Map<String, dynamic> responseData) {
    return Coupon(
        discountAmount: responseData['discountAmount'], // 수정
        startDate: responseData['startDate'],
        endDate: responseData['endDate']);
  }
}