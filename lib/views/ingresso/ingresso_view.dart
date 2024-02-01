import 'package:flutter/material.dart';

import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_icon.dart';

class IngressoView extends StatefulWidget {
  const IngressoView({super.key});

  @override
  State<IngressoView> createState() => _IngressoViewState();
}

class _IngressoViewState extends State<IngressoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Ingresso',
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        margin: const EdgeInsets.all(16),
        child: CustomPaint(
          painter: TicketPainter(
            borderColor: Colors.blue[800]!,
            bgColor: Colors.white,
            dottedLineColor: Colors.blue[800]!,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(
                        'https://recode.org.br/wp-content/uploads/2021/05/Museu-Fabre-em-Montpellier-1050x680-1.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.025,
                      left: MediaQuery.of(context).size.height * 0.03,
                      right: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Museu',
                          style: TextStyle(
                            color: Colors.blue[800]!,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * 0.023,
                          ),
                        ),
                        Text(
                          'Museu Municipal José Olavo Machado',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Localização',
                          style: TextStyle(
                            color: Colors.blue[800]!,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * 0.023,
                          ),
                        ),
                        Text(
                          'Av. Antônio Manoel, 789 - Centro, Santo Ângelo - RS, 98801-630',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Horário da visitação',
                          style: TextStyle(
                            color: Colors.blue[800]!,
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.height * 0.023,
                          ),
                        ),
                        Text(
                          '10h30min',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w300,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.03,
                right: MediaQuery.of(context).size.height * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.blue[800]!,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '12.02.2024',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Nome',
                              style: TextStyle(
                                color: Colors.blue[800]!,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Marta Susia',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Visitantes',
                              style: TextStyle(
                                color: Colors.blue[800]!,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '10',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: MediaQuery.of(context).size.height * 0.023,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CsIcon.icon(
                      icon: Icons.qr_code_2,
                      size: 120,
                      color: Colors.blue[800]!,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  final Color borderColor;
  final Color bgColor;
  final Color dottedLineColor;

  static const cornerGap = 10.0;
  static const cutoutRadius = 15.0;
  static const cutoutDiameter = cutoutRadius * 2;

  TicketPainter({required this.dottedLineColor, required this.bgColor, required this.borderColor});

  @override
  void paint(Canvas canvas, Size size) {
    final maxWidth = size.width;
    final maxHeight = size.height;

    final cutoutStartPos = maxHeight - maxHeight * 0.2;
    final leftCutoutStartY = cutoutStartPos;
    final rightCutoutStartY = cutoutStartPos - cutoutDiameter;
    final dottedLineY = cutoutStartPos - cutoutRadius;
    double dottedLineStartX = cornerGap + 5.0;
    final double dottedLineEndX = maxWidth - cornerGap - 5.0;
    const double dashWidth = 3.5;
    const double dashSpace = 2;

    final paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..color = bgColor;

    final paintBorder = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = borderColor;

    final paintDottedLine = Paint()
      ..color = dottedLineColor
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(cornerGap, 0);
    path.lineTo(maxWidth - cornerGap, 0);
    drawCornerArc(path, maxWidth, cornerGap);
    path.lineTo(maxWidth, rightCutoutStartY);
    drawCutout(path, maxWidth, rightCutoutStartY + cutoutDiameter);
    path.lineTo(maxWidth, maxHeight - cornerGap);
    drawCornerArc(path, maxWidth - cornerGap, maxHeight);
    path.lineTo(cornerGap, maxHeight);
    drawCornerArc(path, 0, maxHeight - cornerGap);
    path.lineTo(0, leftCutoutStartY);
    drawCutout(path, 0.0, leftCutoutStartY - cutoutDiameter);
    path.lineTo(0, cornerGap);
    drawCornerArc(path, cornerGap, 0);

    canvas.drawPath(path, paintBg);
    canvas.drawPath(path, paintBorder);

    while (dottedLineStartX < dottedLineEndX) {
      canvas.drawLine(
        Offset(dottedLineStartX, dottedLineY),
        Offset(dottedLineStartX + dashWidth, dottedLineY),
        paintDottedLine,
      );
      dottedLineStartX += dashWidth + dashSpace + 7;
    }
  }

  drawCutout(Path path, double startX, double endY) {
    path.arcToPoint(
      Offset(startX, endY),
      radius: const Radius.circular(cutoutRadius),
      clockwise: false,
    );
  }

  drawCornerArc(Path path, double endPointX, double endPointY) {
    path.arcToPoint(
      Offset(endPointX, endPointY),
      radius: const Radius.circular(cornerGap),
    );
  }

  @override
  bool shouldRepaint(TicketPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(TicketPainter oldDelegate) => false;
}
