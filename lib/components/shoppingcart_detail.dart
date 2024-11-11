import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ShoppingcartDetail extends StatelessWidget {
  const ShoppingcartDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(40.0)),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildDetailNameAndPrice(),
              _buildDetailRatingAndReviewCount(),
              _buildDetailColorOptions(),
              _buildDetailButton(context)
            ],
          ),
        ));
  }

  Widget _buildDetailNameAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Urban Soft AL 10.0',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$699',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          Icon(Icons.star, color: Colors.yellow),
          // Spacer() : row 위젯 기준으로 남은 여백을 다 차지함
          Spacer(),
          Text('Review '),
          Text(
            '(26)',
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Text('Color Options'),
          SizedBox(height: 10),
          Row(
            children: [
              // 재사용을 위해 함수로 설계
              _buildDetailIcons(Colors.black),
              _buildDetailIcons(Colors.green),
              _buildDetailIcons(Colors.orange),
              _buildDetailIcons(Colors.grey),
              _buildDetailIcons(Colors.white),
            ],
          )
        ],
      ),
    );
  }

  // 여러 번 추후 호출해야 한다.
  Widget _buildDetailIcons(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                shape: BoxShape.circle),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          // alert dialog 사용법
          // 플랫폼 별 준비가 되어 있음,
          // 1. showDialog 호출
          // 2. IOS --> showCupertinoDialog 함수 호출
          // 3.
          showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  actions: [
                    CupertinoDialogAction(
                      child: Text('확인'),
                      onPressed: () {
                        // 플러터 프레임워크가
                        // 화면 간에 이동 시에 위젯들을
                        // 스택구조로 관리해주는 객체이다.
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: Size(300, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          'Add to Cart',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
