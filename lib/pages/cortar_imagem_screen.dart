import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Tela para recorte de imagem.
///
/// A [CortarImagemScreen] carrega uma imagem local (Gonzo) e permite
/// ao usuário recortá-la usando o pacote [crop_your_image].
class CortarImagemScreen extends StatefulWidget {
  @override
  State<CortarImagemScreen> createState() => _CortarImagemScreenState();
}

/// Estado da [CortarImagemScreen].
///
/// Gerencia o carregamento, exibição e recorte da imagem.
class _CortarImagemScreenState extends State<CortarImagemScreen> {
  /// Controlador para a área de recorte da imagem.
  final CropController _controller = CropController();

  /// Imagem original carregada da pasta `assets/images`.
  Uint8List? _imagemOriginal;

  /// Imagem recortada, gerada após a ação do usuário.
  Uint8List? _imagemCortada;

  @override
  void initState() {
    super.initState();
    _carregarImagem();
  }

  /// Carrega a imagem do Gonzo a partir dos assets.
  Future<void> _carregarImagem() async {
    final bytes = await rootBundle.load('assets/images/gonzo.png');
    setState(() => _imagemOriginal = bytes.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Recortar Imagem', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: _imagemOriginal == null
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: _imagemCortada != null
                ? Image.memory(_imagemCortada!)
                : Crop(
              image: _imagemOriginal!,
              controller: _controller,
              onCropped: (CropResult result) {
                switch (result) {
                  case CropSuccess(croppedImage: final imagem):
                    setState(() => _imagemCortada = imagem);
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
