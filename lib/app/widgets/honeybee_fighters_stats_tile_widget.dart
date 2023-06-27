import 'package:flutter/material.dart';
import 'package:honeybee/app/widgets/honeybee_degradee_horizontal_line_separator.dart';

class FightersStatsTile extends StatelessWidget {
  const FightersStatsTile({
    super.key,
    required this.dataTitle,
    required this.fighter1DataResult,
    required this.fighter2DataResult,
  });

  final String dataTitle;
  final String fighter1DataResult;
  final String fighter2DataResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  fighter1DataResult,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 120,
                  child: Center(
                    child: Text(
                      dataTitle.toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Text(
                  fighter2DataResult,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const HoneyBeeHorizontalLineSeparator(),
        ],
      ),
    );
  }
}
