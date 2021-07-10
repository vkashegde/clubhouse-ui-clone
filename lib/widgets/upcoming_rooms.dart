import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class UpcomingRooms extends StatelessWidget {
  final List<Room> upcomingRooms;
  const UpcomingRooms({Key? key, required this.upcomingRooms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 32, top: 4, bottom: 4),
        child: Column(
          children: upcomingRooms
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: e.club.isNotEmpty ? 2 : 0),
                        child: Text(e.time),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (e.club.isNotEmpty)
                              Flexible(
                                child: Text(
                                  '${e.club} 🏠'.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            Flexible(
                                child: Text(
                              e.name,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
