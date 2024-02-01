// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:museu_panoramico/configs/assets/assets_path.dart';
import 'package:museu_panoramico/widgets/cs_app_bar.dart';
import 'package:museu_panoramico/widgets/cs_icon.dart';
import 'package:museu_panoramico/widgets/cs_icon_button.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class PanoramicoView extends StatefulWidget {
  const PanoramicoView({Key? key}) : super(key: key);

  @override
  State<PanoramicoView> createState() => _PanoramicoViewState();
}

class _PanoramicoViewState extends State<PanoramicoView> {
  double _lon = 0;
  double _lat = 0;
  double _tilt = 0;
  int _panoId = 0;

  List<Image> panoImages = [
    Image.asset(AssetsPath.PANORAMA),
    Image.asset(AssetsPath.PANORAMA_DOIS),
    Image.asset(AssetsPath.PANORAMA_TRES),
  ];

  @override
  Widget build(BuildContext context) {
    Widget panorama;
    switch (_panoId % panoImages.length) {
      case 0:
        panorama = PanoramaViewer(
          animSpeed: 0,
          sensorControl: SensorControl.orientation,
          hotspots: [
            Hotspot(
              latitude: -42.0,
              longitude: -6.0,
              width: 80,
              height: 80,
              widget: CsIconButton(
                icon: const CsIcon.icon(
                  icon: Icons.arrow_upward,
                  size: 80,
                  color: Colors.white,
                ),
                onPressed: () => setState(() => _panoId++),
              ),
            ),
          ],
          child: Image.asset(AssetsPath.PANORAMA),
        );
        break;
      case 2:
        panorama = PanoramaViewer(
          animSpeed: 0.1,
          sensorControl: SensorControl.orientation,
          hotspots: [
            Hotspot(
              latitude: -50.0,
              longitude: -75.0,
              width: 80,
              height: 80,
              widget: CsIconButton(
                icon: const CsIcon.icon(
                  icon: Icons.arrow_upward,
                  size: 80,
                  color: Colors.white,
                ),
                onPressed: () => setState(
                  () {
                    _panoId++;
                    if (_panoId > panoImages.length - 1) {
                      _panoId = 0;
                    }
                  },
                ),
              ),
            ),
          ],
          child: Image.asset(AssetsPath.PANORAMA_TRES),
        );
        break;
      default:
        panorama = PanoramaViewer(
          animSpeed: 0.1,
          sensorControl: SensorControl.orientation,
          hotspots: [
            Hotspot(
              latitude: -45,
              longitude: 42.0,
              width: 80,
              height: 80,
              widget: CsIconButton(
                icon: const CsIcon.icon(
                  icon: Icons.arrow_upward,
                  size: 80,
                  color: Colors.white,
                ),
                onPressed: () => setState(
                  () {
                    _panoId++;
                    if (_panoId > panoImages.length - 1) {
                      _panoId = 0;
                    }
                  },
                ),
              ),
            ),
          ],
          child: panoImages[_panoId],
        );
    }
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Museu',
      ),
      body: Stack(
        children: [
          panorama,
        ],
      ),
    );
  }
}
