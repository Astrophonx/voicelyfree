import 'package:clubroom/assets/assets.dart';

class Club {
  final String image;
  final String name;
  final int numberOfMembers;
  final int numberOfFollowers;

  String get formattedFollowers {
    if (numberOfFollowers > 1000)
      return (numberOfFollowers / 1000).toStringAsFixed(1) + "k";
    else
      return numberOfFollowers.toString();
  }

  Club(this.image, this.name, this.numberOfMembers, this.numberOfFollowers);
}

List<Club> clubs = [
  Club(Assets.club1, "Jackson Clubs", 124, 3700),
  Club(Assets.club2, "Jack n Jokes", 40, 4900),
  Club(Assets.club3, "Jack Jester", 9, 321),
  Club(Assets.club4, "Jack Hackers", 24, 22000),
  Club(Assets.club5, "Jack Hosts", 46, 129),
  Club(Assets.club6, "Jack Games", 12, 1600),
  Club(Assets.club7, "JacksonPirate", 35, 998),
];
