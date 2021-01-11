import 'package:core_values/bloc/core_values/core_values_cubit.dart';
import 'package:core_values/ui/add_value/add_dialog_save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddValueDialog extends StatefulWidget {
  @override
  _AddValueDialogState createState() => _AddValueDialogState();
}

class _AddValueDialogState extends State<AddValueDialog> {
  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Dialog(
      child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: close,
              )),
          Container(
            width: size.width * 0.75,
            height: size.height * 0.3,
            padding: const EdgeInsets.fromLTRB(10, 25, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add your value'),
                TextFormField(
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.lightGreenAccent,
                  controller: controller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    hintText: 'Never say never',
                  ),
                ),
                AddDialogSaveButton(onPressed:onPressed)
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPressed() {
    if (controller.text.isNotEmpty)
      BlocProvider.of<CoreValuesCubit>(context).addValue(controller.text);
    close();
  }

  void close() {
    Navigator.pop(context);
    controller.clear();
  }
}
