class LogUtils {
  static void GGQ(dynamic? msg){
    if(msg != null){
      StringBuffer sb = new StringBuffer();
      sb.write('GGQ->:');
      sb.write(msg);
      print(sb.toString());
    }
  }

}