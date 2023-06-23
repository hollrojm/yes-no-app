import 'package:flutter/material.dart';

class MessagefieldBox extends StatelessWidget {
  const MessagefieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          print('valor de la caja de texto $textValue');
          textController.clear();
        },
      ),
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value: $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
