import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    // final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlineImputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      enabledBorder: outlineImputBorder,
      focusedBorder: outlineImputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          if ((textController.value.text.trim()).isEmpty) return;
          final textValue = textController.value.text; //Toma el valor del texto
          textController.clear();
          onValue(textValue.trim());
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
        
          //Comportamiento de Texto form en aplicacion

          onTapOutside: (event) {
            focusNode.unfocus();
          },
          focusNode: focusNode,
          controller: textController,
          decoration: inputDecoration,
          onChanged:(value) => chatProvider.moveScrollToBottom() ,
          onTap: () => chatProvider.moveScrollToBottom(),
          onFieldSubmitted: (value) {
            if ((value.trim()).isEmpty) {
              focusNode.requestFocus();
              return;
            }
            onValue(value.trim());
            textController.clear();
            focusNode.requestFocus();
          }),
    );
  }
}
