import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Icons View', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'apps_outage',

                width: 170,
                child: Center(child: Icon(Icons.apps_outage)),
              ),
              WhiteCard(
                title: 'add_road',

                width: 170,
                child: Center(child: Icon(Icons.add_road)),
              ),
              WhiteCard(
                title: 'access_alarm',

                width: 170,
                child: Center(child: Icon(Icons.access_alarm)),
              ),
              WhiteCard(
                title: 'badge',

                width: 170,
                child: Center(child: Icon(Icons.badge)),
              ),
              WhiteCard(
                title: 'wifi_calling_3_rounded',

                width: 170,
                child: Center(child: Icon(Icons.wifi_calling_3_rounded)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
