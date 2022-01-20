import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/constants.dart';

class Speaker {
  final String image;
  final String name;
  final String description;
  bool isFollowing;

  Speaker(
    this.image,
    this.name, {
    this.description = kLoremText1,
    this.isFollowing = false,
  });
}

List<Speaker> speakers = [
  Speaker(Assets.speaker1, "Daniel"),
  Speaker(Assets.speaker2, "Monalisa"),
  Speaker(Assets.speaker3, "Aileen"),
  Speaker(Assets.speaker4, "Rubic"),
  Speaker(Assets.speaker5, "Derrick"),
  Speaker(Assets.speaker6, "Glenn"),
  Speaker(Assets.speaker7, "Gilbert"),
  Speaker(Assets.speaker8, "Marian"),
  Speaker(Assets.speaker9, "Dave"),
  Speaker(Assets.speaker10, "Sammy"),
  Speaker(Assets.speaker11, "Lillie"),
  Speaker(Assets.speaker1, "Daniel"),
  Speaker(Assets.speaker2, "Monalisa"),
  Speaker(Assets.speaker3, "Aileen"),
  Speaker(Assets.speaker4, "Rubic"),
  Speaker(Assets.speaker5, "Derrick"),
  Speaker(Assets.speaker6, "Glenn"),
  Speaker(Assets.speaker7, "Gilbert"),
  Speaker(Assets.speaker8, "Marian"),
  Speaker(Assets.speaker9, "Dave"),
  Speaker(Assets.speaker10, "Sammy"),
  Speaker(Assets.speaker11, "Lillie"),
];
