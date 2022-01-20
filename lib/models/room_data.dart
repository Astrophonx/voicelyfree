import 'package:clubroom/models/speaker_data.dart';

class Room {
  final String category;
  final String title;
  final List<Speaker> speakers;
  final int audience;
  final double price;

  Room(this.category, this.title, this.speakers, this.audience, this.price);
}
