extension StringExtension on String {

  String removeP() {
    var status = this.replaceAll("<p>", "");
    var status1 = status.replaceAll("</p>", "\n");
    
    return status1;
  }
}