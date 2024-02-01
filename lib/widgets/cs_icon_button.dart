import 'package:flutter/material.dart';

class CsIconButton extends StatelessWidget {
  ///Responsável por retornar um [IconButton] com algumas propriedades já predefinidas
  ///Podendo estar serem modificadas
  const CsIconButton({
    required this.icon,
    this.onPressed,
    this.colorIcon = Colors.white,
    this.sizeIcon = 26,
    this.tooltip,
    super.key,
  });

  final Widget icon;
  final void Function()? onPressed;
  final Color colorIcon;
  final double sizeIcon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      //Campos obrigatórios
      icon: icon,
      onPressed: onPressed,

      //Campos opcionais
      color: colorIcon,
      iconSize: sizeIcon,
      tooltip: tooltip,

      //Default
      visualDensity: VisualDensity.comfortable,
      padding: const EdgeInsets.all(0),
    );
  }
}
