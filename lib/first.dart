import 'package:flutter/material.dart';

class BottomSheetScreen extends StatefulWidget {
  const BottomSheetScreen({super.key});

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomSheet"),
      ),
      body: Column(
        children: [
          Text("THE AGE BELONG BETWEEN  ${_currentRangeValues}"),
          OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, builderState) {
                        return RangeSlider(
                          values: _currentRangeValues,
                          max: 100,
                          divisions: 5,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            builderState(() {});
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        );
                      });
                    });
              },
              child: Text("SHOW RANGE"))
        ],
      ),
      bottomSheet: BottomSheet(
        builder: (context) {
          return Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("This is bottomsheet"),
            ),
          );
        },
        onClosing: () {},
      ),
    );
  }
}
