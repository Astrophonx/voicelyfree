import 'package:clubroom/components/curved_image.dart';
import 'package:clubroom/models/speaker_data.dart';
import 'package:flutter/material.dart';

class HostTile extends StatefulWidget {
  final Speaker speaker;
  final bool isMe;

  HostTile(
    this.speaker, {
    this.isMe = false,
  });

  @override
  _HostTileState createState() => _HostTileState();
}

class _HostTileState extends State<HostTile>
    with SingleTickerProviderStateMixin {
  bool toShow = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.width * 0.1;
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).cardColor,
        ),
        child: AnimatedSize(
          duration: Duration(milliseconds: 300),
          vsync: this,
          child: toShow
              ? ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  dense: true,
                  leading: CurvedImage(
                    widget.speaker.image,
                    height: height,
                    radius: 17,
                  ),
                  title: Text(widget.speaker.name),
                  trailing: widget.isMe
                      ? SizedBox.shrink()
                      : IconButton(
                          icon: Icon(Icons.close),
                          color: Theme.of(context).disabledColor,
                          onPressed: () {
                            setState(() {
                              toShow = false;
                            });
                          },
                        ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
