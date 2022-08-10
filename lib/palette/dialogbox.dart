import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

dialogBox(BuildContext context, yes) {
  return showDialog(
    context: context,
    builder: (contex) => AlertDialog(
        title: const Text('¿Repetir examen?'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  yes();
                },
                child: const Text('Dale')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Nideco')),
          ],
        )),
  );
}

chooseAanswer(BuildContext context) {
  return showDialog(
    context: context,
    builder: (contex) => const AlertDialog(
      title: Text('Marca algo, lo que sea'),
    ),
  );
}
