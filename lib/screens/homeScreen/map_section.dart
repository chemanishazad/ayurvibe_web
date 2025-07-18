import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:url_launcher/url_launcher.dart';

class ContactMapSection extends StatelessWidget {
  ContactMapSection({Key? key}) : super(key: key) {
    const String viewID = 'google-maps-iframe';
    const String mapsSrc =
        "https://www.google.com/maps/embed/v1/place?key=AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08&q=12.879659,80.205193&zoom=16";

    // Only register once
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewID,
      (int viewId) =>
          IFrameElement()
            ..src = mapsSrc
            ..style.border = '0'
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.position =
                'absolute' // added
            ..style.top = '0'
            ..style.left = '0',
    );
  }

  @override
  Widget build(BuildContext context) {
    final double mapHeight =
        MediaQuery.of(context).size.width < 700 ? 300 : 400;

    return Container(
      height: mapHeight,
      width: double.infinity,
      child: Stack(
        children: const [
          Positioned.fill(
            child: HtmlElementView(viewType: 'google-maps-iframe'),
          ),
        ],
      ),
    );
  }
}
