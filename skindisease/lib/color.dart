class Customcolors{



 static hexColor(String color) {
    String newColor = '0xff' + color;
    newColor = newColor.replaceAll('#', '');
    int finalcolor = int.parse(newColor);
    return finalcolor;
  }



}