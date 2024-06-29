import 'dart:io';

import 'package:api_9_google_ads/screens/interstitial_ads.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final adUnitId = Platform.isAndroid ? 'ca-app-pub-3940256099942544/6300978111' : 'ca-app-pub-3940256099942544/2934735716';


  BannerAd? _bannerAd;

  bool isLoading = false;




  @override
  void initState() {
    super.initState();
    loadingAd();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.amber,

            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const InterstitialAds()));

                    },
                    child: const Text('Interstitial Ads'),
                  ),

              ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const InterstitialAds()));

                    },
                    child: const Text('Rewarded Ads'),
                  ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: isLoading ? AdWidget(ad: _bannerAd!) : const SizedBox()),



        ],
      ),
    );
  }

  void loadingAd(){
    _bannerAd = BannerAd(
      size: const AdSize(width: 300, height: 50),
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            isLoading = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          print('Error ${error.message}');
          ad.dispose();
        },
      ),
      request: const AdRequest()
    )..load();
  }







}