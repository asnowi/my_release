class LogUtils {

  static void GGQ(Object? obj){
    if(obj != null){
      StringBuffer sb = new StringBuffer();
      sb.write('GGQ->:');
      sb.write(obj);
      print(sb.toString());
    }
  }

}