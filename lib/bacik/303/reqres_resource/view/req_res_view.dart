import 'dart:developer';

import 'package:bloc_pattern_2/bacik/303/reqres_resource/view/req_res_view_detail.dart';
import 'package:bloc_pattern_2/bacik/303/reqres_resource/view_model/req_res_view_model.dart';
import 'package:flutter/material.dart';
import '../../../product/extension/global_extension.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({super.key});

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends ReqResViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator() : Text('empty'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Color(items[index].color?.colorConvertInteger ?? 0),
            child: ListTile(
              leading: Text(items[index].id.toString()),
              title: Text(items[index].name ?? ''),
              subtitle: Text(Constants().titles[index]),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return ReqResViewDetail(
                        title: Constants().titles[index],
                        image: Constants().images[index],
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class Constants {
  static const ceruleanTitle = 'Gözlük';
  final List<String> titles = [
    'Gözlük',
    'Araba',
    'Ikinci Dünya Savasi Ucagi',
    'Motorsiklet',
    'Macbook',
    'Battaniye',
  ];

  final List<String> images = [
    'https://contents.mediadecathlon.com/p2030783/k\$1112ea055c7486431a80526b26fe04b9/sq/seffaf-camli-yuzucu-gozlugu-l-boy-siyah-100-xbase.jpg',
    'https://res.cloudinary.com/tasit-com/image/upload/c_scale,w_756,h_434,dpr_2/f_webp,q_auto/v1665653440/400.000-tl-alti-2.-el-araba-clio.jpeg',
    'https://upload.wikimedia.org/wikipedia/commons/d/d5/Me_262_T-2-4012_side_view_on_ground.jpg',
    'https://productimages.hepsiburada.net/s/180/500/110000144320068.jpg',
    'https://resim.epey.com/439434/b_apple-macbook-air-13-3-mwtl2tu-a-6.jpg',
    'https://cdn03.ciceksepeti.com/cicek/kcm44580563-1/XL/luks-pelus-battaniye-kaliteli-parlak-uzun-omurlu-sireli-kcm44580563-1-0878c18f73914f16a63ffa0754b4f1f6.jpg',
  ];
}
