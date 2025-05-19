import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CortarImagemScreen extends StatefulWidget {
  @override
  State<CortarImagemScreen> createState() => _CortarImagemScreenState();
}

class _CortarImagemScreenState extends State<CortarImagemScreen> {
  final CropController _controller = CropController();
  Uint8List? _imagemOriginal;
  Uint8List? _imagemCortada;

  @override
  void initState() {
    super.initState();
    _carregarImagem();
  }

  Future<void> _carregarImagem() async {
    final bytes = await rootBundle.load('assets/images/gonzo.png');
    setState(() => _imagemOriginal = bytes.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cortar Imagem', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body:
          _imagemOriginal == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Expanded(
                    child:
                        _imagemCortada != null
                            ? Image.memory(_imagemCortada!)
                            : Crop(
                              image: _imagemOriginal!,
                              controller: _controller,
                              onCropped: (CropResult result) {
                                switch (result) {
                                  case CropSuccess(croppedImage:final imagem):
                                    setState(
                                      () => _imagemCortada = imagem,
                                    );
                                  case CropFailure(:final cause):
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Erro ao cortar a imagem: $cause',
                                        ),
                                      ),
                                    );
                                }
                              },
                            ),
                  ),
                  if (_imagemCortada == null)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton.icon(
                        onPressed: () => _controller.crop(),
                        icon: Icon(Icons.check),
                        label: Text('Recortar'),
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.deepOrangeAccent,
                            style: BorderStyle.solid,
                          ),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepOrangeAccent,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          minimumSize: Size(200, 100),
                          textStyle: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                ],
              ),
    );
  }
}
