class CustomColors{
 static color(String hexa){
    String newcolor = '0xff' + hexa;
    newcolor = newcolor.replaceAll('#', '');
    return int.parse(newcolor);}

}