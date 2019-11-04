import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_first_app/demos/loationApp/providers/greate_places.dart';
import 'package:my_first_app/demos/shoppingApp/providers/products.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GroupPage'),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiper = (data['data']['slides'] as List).cast();
            return Column(children: <Widget>[
              SwiperDiy(swiperDataList: swiper,)
            ],);
          } else {
            return Text('loading ...');
          }
        },
      ),
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;

  SwiperDiy({this.swiperDataList});

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    print('pixle density:${ScreenUtil.pixelRatio}');
    print('pixle density:${ScreenUtil.screenHeight}');
    print('pixle density:${ScreenUtil.screenWidth}');

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context, index) {
          return Image.network("${swiperDataList[index]['image']}", fit: BoxFit.cover,);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}