import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CountedButtonScreen extends StatefulWidget {
  static const String routeName = '/counted-button';
  final int number;
  const CountedButtonScreen({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  State<CountedButtonScreen> createState() => _CountedButtonScreenState();
}

class _CountedButtonScreenState extends State<CountedButtonScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counted Buttons'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.number,
          itemBuilder: (builder, index) {
            return CustomButton(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  final int index;
  const CustomButton({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (count == 4) {
            Fluttertoast.showToast(
                msg: 'You clicked Four time.\n Now it\'s diasble.',
                toastLength: Toast.LENGTH_LONG,
                textColor: Colors.red,
                gravity: ToastGravity.CENTER);
          } else {
            setState(() {
              count++;
            });
          }
        },
        child: Container(
          height: size.height * 0.08,
          width: size.width * 0.2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            color: buttonColor(),
          ),
          alignment: Alignment.center,
          child: Text(
            '${widget.index}',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  buttonColor() {
    var color = Colors.white;
    if (count == 1) color = Colors.yellow;
    if (count == 2) color = Colors.green;
    if (count == 3) color = Colors.grey;
    if (count == 4) color = Colors.red;

    return color;
  }
}
