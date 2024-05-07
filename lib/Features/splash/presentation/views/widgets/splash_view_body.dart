import 'package:bookly_app/Features/home/presentaion/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('${AssetsData.logo}'),
        const SizedBox(
          height: 5,
        ),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (BuildContext context, _) {
            return SlideTransition(position: slidingAnimation,
                child: Text('Read Free Books ',textAlign: TextAlign.center,));
          },

        ),


      ],
    );
  }
  void initSlidingAnimation() {
    animationController=AnimationController(vsync: this,duration:const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin:const Offset(0, 5) ,end:Offset.zero ).animate(animationController);
    animationController.forward();
  }
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3),(){
      GoRouter.of(context).push(AppRouter.KHomeView);

    });
  }
}

