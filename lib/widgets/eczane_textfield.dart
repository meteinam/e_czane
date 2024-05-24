import 'package:e_czane/style/color.dart';
import 'package:flutter/material.dart';

class EczaneTextField extends StatelessWidget {
  final String? hint; // ipucu mesajı
  final TextEditingController? controller; // textfield kontrolcüsü
  final TextInputType? keyboardType; // klavye tipi
  final bool? isObscured; // şifre mi değil mi
  final String? obscuringCharacter; // şifre karakteri
  final Color? bgColor;
  final void Function(String)? onChanged; // değiştiğinde

  /// arkaplan rengi
  final double width; // genişlik
  final double height; // yükseklik
  const EczaneTextField({
    super.key,
    this.hint,
    this.controller,
    this.keyboardType,
    this.isObscured,
    this.obscuringCharacter,
    this.bgColor,
    required this.width,
    required this.height,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.transparent,
        ),
        color: bgColor ?? eczaneLightGrey,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged ?? (value) {},
        keyboardType: keyboardType,
        obscureText: isObscured ?? false,
        obscuringCharacter: obscuringCharacter ?? "*",
        style: const TextStyle(fontFamily: 'inter', fontSize: 25),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'inter', fontSize: 20),
          border: OutlineInputBorder(
            gapPadding: 5,
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: eczaneLightGrey,
        ),
      ),
    );
  }
}
