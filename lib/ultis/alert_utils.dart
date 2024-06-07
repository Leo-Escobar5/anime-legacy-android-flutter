import 'package:flutter/material.dart';

void showNoConnectionAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Error"),
        content: Text("No tiene conexión con el servidor."),
        actions: <Widget>[
          TextButton(
            child: Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
              showMaintenanceAlert(context); // Llama a la alerta de mantenimiento después de cerrar esta alerta
            },
          ),
        ],
      );
    },
  );
}

void showMaintenanceAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Mantenimiento"),
        content: Text("La aplicación está en mantenimiento."),
        actions: <Widget>[
          TextButton(
            child: Text("Aceptar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
