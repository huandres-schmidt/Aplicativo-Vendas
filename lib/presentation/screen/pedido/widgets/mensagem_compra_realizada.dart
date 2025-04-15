import 'package:flutter/material.dart';
import '../../../../data/model/venda_model.dart';
import '../../empresa_home/empresa_home_screen.dart';
import 'nota_fiscal_pedido.dart';

class MensagemCompraRealizada extends StatelessWidget {
  final VendaModel venda;

  MensagemCompraRealizada({
    required this.venda,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 120,
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Compra Realizada com Sucesso',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              subtitle: Center(
                child: Text(
                  'Obrigado por escolher Aurora Coop',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmpresaHomeScreen(),
                    ),
                  ),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Fechar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton.icon(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          NotaFiscalPedido(venda: venda)),
                  icon: Icon(
                    Icons.note,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Ver nota fiscal',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
