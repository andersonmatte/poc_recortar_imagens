# PoC Recortar Imagem

# Flutter Image Cropper Screen

Este projeto é um exemplo básico de como utilizar a biblioteca [`crop_your_image`](https://pub.dev/packages/crop_your_image) no Flutter para recortar imagens de forma interativa.

---

## Funcionalidade

A biblioteca `crop_your_image` permite criar uma área de recorte com controles intuitivos, possibilitando ao usuário:

- Selecionar e exibir uma imagem local.
- Ajustar e recortar uma área da imagem.
- Visualizar o resultado recortado.
- Suporte a feedback visual e manipulação via `CropController`.

---

## Tela de Recorte

- A imagem original é exibida com moldura de recorte ajustável.
- Um botão **Recortar** inicia o processo.
- Ao finalizar, a imagem recortada é exibida.
- Layout limpo, responsivo e com cores no padrão laranja do projeto.

---

![alt text](https://github.com/andersonmatte/poc_cortar_imagem/blob/master/assets/prints/print.png)

## Como usar

1. Adicione a dependência no seu `pubspec.yaml`:

```yaml
dependencies:
  crop_your_image: ^2.0.0
