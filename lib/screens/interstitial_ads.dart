import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAds extends StatefulWidget {
  const InterstitialAds({super.key});

  @override
  State<InterstitialAds> createState() => _InterstitialAdsState();
}

class _InterstitialAdsState extends State<InterstitialAds> {
  final adUnitId = Platform.isAndroid ? 'ca-app-pub-3940256099942544/1033173712' : 'ca-app-pub-3940256099942544/4411468910';

   InterstitialAd? _interstAd;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    interstitialloadingAd();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text('interstitialloadingAd'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if(isLoading){
                _interstAd!.show();
            }

          },
          child: Text('Before click, wait for 5 sec'),
        ),
      )
    );
  }

  void interstitialloadingAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstAd = ad;
          setState(() {
            isLoading = true;

          });
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('${error.message}');
          _interstAd!.dispose();
        },
      )
    );

  }
}