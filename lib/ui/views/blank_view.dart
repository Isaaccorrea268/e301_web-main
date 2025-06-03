import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Dashboard View',style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Sales Statistics',
            child: Text('#TeamSistemas')
          ),
        ],
      ),
    );
  }
}