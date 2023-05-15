import 'dart:async';
import 'package:busca_cep/presentation/core/paleta_de_cores.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VerMapa extends StatefulWidget {
  const VerMapa({super.key, required this.longitude, required this.latitude});

  final double longitude;
  final double latitude;

  @override
  State<VerMapa> createState() => _VerMapaState();
}

class _VerMapaState extends State<VerMapa> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PaletaDeCores.azulClaro,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            "Ver Mapa".toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          zoom: 20.0,
          target: LatLng(widget.latitude, widget.longitude),
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
