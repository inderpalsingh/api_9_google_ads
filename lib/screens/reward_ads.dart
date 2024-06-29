import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAds extends StatefulWidget {
  const RewardAds({super.key});

  @override
  State<RewardAds> createState() => _RewardAdsState();
}

class _RewardAdsState extends State<RewardAds> {
  final adUnitId = Platform.isAndroid ? 'ca-app-pub-3940256099942544/5224354917' : 'ca-app-pub-3940256099942544/1712485313';

   RewardedAd? _rewardedAd;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    rewardloadingAd();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(title: Text('RewardedAd'),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if(isLoading){
                _rewardedAd!.show(onUserEarnedReward: (ad, reward) {

                },);
            }

          },
          child: Text('Before click, wait for 5 sec'),
        ),
      )
    );
  }

  void rewardloadingAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          setState(() {
            isLoading = true;
          });
        },
        onAdFailedToLoad: (error) {
          print('${error.message}');
        },
      )
    );

  }
}