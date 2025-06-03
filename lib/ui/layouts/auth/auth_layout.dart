import 'package:e301_web/ui/layouts/widgets/background_image.dart';
import 'package:e301_web/ui/views/custom_title.dart';
import 'package:e301_web/ui/views/links_bars.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            //if(size.width>1000)?_DesktopBody(child: child):_MobileBody(child: child),
            if(size.width>700)
              _DesktopBody(child: child)
            else
              _MobileBody(child: child),
        
            //LinksBar
            LinksBars(),
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.9,
      //color: Colors.amber,
      child: Row(
        children: [
          //Imagen
          BackgroundImage(),
          //View
          Expanded(
            child: Container(
              width: 500,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  CustomTitle(),
                  SizedBox(height: 50),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({ required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 20,),
          CustomTitle(),
          Container(
            width: double.infinity,
            height: 450,
            child: child,
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: BackgroundImage(),
          ),
        ],
      ),
    );
  }
}
