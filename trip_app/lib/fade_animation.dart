import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
enum AniProps{opacity,translateY}
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity,Tween(begin: 0.0,end: 1.0))
    ..add(
        AniProps.translateY,Tween(begin: 120.0,end: 0.0),
    Duration(microseconds:500 ),
    Curves.easeOut
    );


    return TweenAnimationBuilder(tween: tween, duration: duration, builder: builder)Animation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AniProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}