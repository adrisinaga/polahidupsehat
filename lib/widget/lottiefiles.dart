import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottieFilesHeartBeart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: LottieBuilder.network(
        'https://assets10.lottiefiles.com/packages/lf20_zmwhgnkf.json',
      ),
    );
  }
}

class LottieFilesRateBeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width/1.2,
      height: Get.height/4,
      child: LottieBuilder.network(
        'https://assets7.lottiefiles.com/private_files/lf30_ephWCK.json',
      ),
    );
  }
}


class LottieFilesLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: LottieBuilder.network(
        'https://assets7.lottiefiles.com/packages/lf20_jSRN8A.json',
      ),
    );
  }
}




class LottieFilesHitungKalori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width/1.7,
      height: Get.height/7,
      child: LottieBuilder.network(
        'https://assets2.lottiefiles.com/packages/lf20_n8GX5U.json',
      ),
    );
  }
}

class LottieFilesBeverages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: LottieBuilder.network(
        'https://assets2.lottiefiles.com/packages/lf20_tll0j4bb.json',
      ),
    );
  }
}

class LottieFilesPolaMakan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: LottieBuilder.network(
        'https://assets2.lottiefiles.com/packages/lf20_7CAQeC.json',
      ),
    );
  }
}



class LottieFilesGym extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: LottieBuilder.network(
        'https://assets5.lottiefiles.com/packages/lf20_qmrxbp0w.json',
      ),
    );
  }
}