import 'package:clubroom/assets/assets.dart';
import 'package:clubroom/components/emoji_button.dart';
import 'package:clubroom/models/room_type_data.dart';
import 'package:flutter/material.dart';
import 'package:clubroom/generated/l10n.dart';

class RoomTypeRow extends StatefulWidget {
  @override
  _RoomTypeRowState createState() => _RoomTypeRowState();
}

class _RoomTypeRowState extends State<RoomTypeRow> {
  int _selectedRoomType = 0;

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    final List<RoomType> roomTypes = [
      RoomType(Assets.publicRoom, s.public),
      RoomType(Assets.socialRoom, s.social),
      RoomType(Assets.privateRoom, s.private),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        roomTypes.length,
        (index) => EmojiButton(
          color: _selectedRoomType == index
              ? theme.dividerColor
              : theme.scaffoldBackgroundColor.withOpacity(0.3),
          image: roomTypes[index].image,
          height: size.width / 5.5,
          width: size.width / 4,
          imageHeight: index == 1 ? 40 : 52,
          end: index == 2 ? 28 : 16,
          start: index == 2 ? 28 : 16,
          bottom: size.width / 8.2,
          text: roomTypes[index].type,
          alignment: Alignment.bottomCenter,
          onTap: () {
            setState(() {
              _selectedRoomType = index;
            });
          },
        ),
      ),
    );
  }
}
