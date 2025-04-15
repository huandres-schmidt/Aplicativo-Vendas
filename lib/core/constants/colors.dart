import 'package:flutter/material.dart';

class ColorsConstants {
  static const amareloLogo = Color(0XFFFFD200);
  static const laranjaLogo = Color(0XFFFF6C00);
  static const vermelhoLogo = Color(0XFFDC001C);
  static const laranjaClaro = Color(0XFFffe8d9);
  static const cinzaClaro = Color(0XFFf1f1f1);

  static const laranjaPrincipal = Color(0xffE87722);
  static const verdePrincipal = Color(0xff0B781C);
  static const vermelhoPrincipal = Color(0xffE4000A);
  static const textTitulo = Color(0xff292929);
  static const textInterno = Color(0xff494949);
  static const textSegundario = Color(0xff595959);
  static const textAuxiliar = Color(0xff797979);
  static const bordaCard = Color(0xffEBEBEB);
  static const fundoTela = Color(0xffF8F8F8);
  static const fundoTelaDark = Color(0xff2C2C2C);
  static const fundoCard = Color(0xffFFFFFF);

  static const colorSchema = ColorScheme(
    primary: ColorsConstants.laranjaPrincipal,
    brightness: Brightness.light,
    onPrimary: ColorsConstants.laranjaPrincipal,
    secondary: Colors.grey,
    background: Colors.white,
    onBackground: Color(0xff292929),
    onSurface: Color(0xff292929),
    surface: Colors.white,
    onSecondary: Colors.grey,
    error: Colors.red,
    onError: Colors.red,
    surfaceTint: Colors.white,
  );
}
