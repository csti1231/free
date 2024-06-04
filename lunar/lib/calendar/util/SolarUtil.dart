import '../Solar.dart';

/// 阳历工具
/// @author 6tail
class SolarUtil {
  /// 星期
  static const List<String> WEEK = ['日', '一', '二', '三', '四', '五', '六'];

  /// 每月天数
  static const List<int> DAYS_OF_MONTH = [
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  /// 星座
  static const List<String> XING_ZUO = [
    '白羊',
    '金牛',
    '双子',
    '巨蟹',
    '狮子',
    '处女',
    '天秤',
    '天蝎',
    '射手',
    '摩羯',
    '水瓶',
    '双鱼'
  ];

  /// 日期对应的节日
  static const Map<String, String> FESTIVAL = {
    '1-1': '元旦节',
    '2-14': '情人节',
    '3-8': '妇女节',
    '3-12': '植树节',
    '3-15': '消费者权益日',
    '4-1': '愚人节',
    '5-1': '劳动节',
    '5-4': '青年节',
    '6-1': '儿童节',
    '7-1': '建党节',
    '8-1': '建军节',
    '9-10': '教师节',
    '10-1': '国庆节',
    '10-31': '万圣节前夜',
    '11-1': '万圣节',
    '12-24': '平安夜',
    '12-25': '圣诞节'
  };

  /// 几月第几个星期几对应的节日
  static const Map<String, String> WEEK_FESTIVAL = {
    '3-0-1': '全国中小学生安全教育日',
    '5-2-0': '母亲节',
    '6-3-0': '父亲节',
    '11-4-4': '感恩节'
  };

  /// 日期对应的非正式节日
  static const Map<String, List<String>> OTHER_FESTIVAL = {
    '1-8': ['周恩来逝世纪念日'],
    '1-10': ['中国人民警察节', '中国公安110宣传日'],
    '1-21': ['列宁逝世纪念日'],
    '1-26': ['国际海关日'],
    '2-2': ['世界湿地日'],
    '2-4': ['世界抗癌日'],
    '2-7': ['京汉铁路罢工纪念'],
    '2-10': ['国际气象节'],
    '2-19': ['邓小平逝世纪念日'],
    '2-21': ['国际母语日'],
    '2-24': ['第三世界青年日'],
    '3-1': ['国际海豹日'],
    '3-3': ['全国爱耳日'],
    '3-5': ['周恩来诞辰纪念日', '中国青年志愿者服务日'],
    '3-6': ['世界青光眼日'],
    '3-12': ['孙中山逝世纪念日'],
    '3-14': ['马克思逝世纪念日'],
    '3-17': ['国际航海日'],
    '3-18': ['全国科技人才活动日'],
    '3-21': ['世界森林日', '世界睡眠日'],
    '3-22': ['世界水日'],
    '3-23': ['世界气象日'],
    '3-24': ['世界防治结核病日'],
    '4-2': ['国际儿童图书日'],
    '4-7': ['世界卫生日'],
    '4-22': ['列宁诞辰纪念日'],
    '4-23': ['世界图书和版权日'],
    '4-26': ['世界知识产权日'],
    '5-3': ['世界新闻自由日'],
    '5-5': ['马克思诞辰纪念日'],
    '5-8': ['世界红十字日'],
    '5-11': ['世界肥胖日'],
    '5-25': ['525心理健康节'],
    '5-27': ['上海解放日'],
    '5-31': ['世界无烟日'],
    '6-5': ['世界环境日'],
    '6-6': ['全国爱眼日'],
    '6-8': ['世界海洋日'],
    '6-11': ['中国人口日'],
    '6-14': ['世界献血日'],
    '7-1': ['香港回归纪念日'],
    '7-7': ['中国人民抗日战争纪念日'],
    '7-11': ['世界人口日'],
    '8-5': ['恩格斯逝世纪念日'],
    '8-6': ['国际电影节'],
    '8-12': ['国际青年日'],
    '8-22': ['邓小平诞辰纪念日'],
    '9-3': ['中国抗日战争胜利纪念日'],
    '9-8': ['世界扫盲日'],
    '9-9': ['毛泽东逝世纪念日'],
    '9-14': ['世界清洁地球日'],
    '9-18': ['九一八事变纪念日'],
    '9-20': ['全国爱牙日'],
    '9-21': ['国际和平日'],
    '9-27': ['世界旅游日'],
    '10-4': ['世界动物日'],
    '10-10': ['辛亥革命纪念日'],
    '10-13': ['中国少年先锋队诞辰日'],
    '10-25': ['抗美援朝纪念日'],
    '11-12': ['孙中山诞辰纪念日'],
    '11-17': ['国际大学生节'],
    '11-28': ['恩格斯诞辰纪念日'],
    '12-1': ['世界艾滋病日'],
    '12-12': ['西安事变纪念日'],
    '12-13': ['国家公祭日'],
    '12-26': ['毛泽东诞辰纪念日'],
  };

  /// 是否闰年
  /// @param year 年
  /// @return true/false 闰年/非闰年
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// 获取某年某月有多少天
  ///
  /// @param year  年
  /// @param month 月
  /// @return 天数
  static int getDaysOfMonth(int year, int month) {
    if (1582 == year && 10 == month) {
      return 21;
    }
    int m = month - 1;
    int d = DAYS_OF_MONTH[m];
    //公历闰年2月多一天
    if (m == 1 && isLeapYear(year)) {
      d++;
    }
    return d;
  }

  /// 获取某年有多少天（平年365天，闰年366天）
  ///
  /// @param year 年
  /// @return 天数
  static int getDaysOfYear(int year) {
    if (1582 == year) {
      return 355;
    }
    return isLeapYear(year) ? 366 : 365;
  }

  /// 获取某天为当年的第几天
  ///
  /// @param year 年
  /// @param month 月
  /// @param day 日
  /// @return 第几天
  static int getDaysInYear(int year, int month, int day) {
    int days = 0;
    for (int i = 1; i < month; i++) {
      days += getDaysOfMonth(year, i);
    }
    int d = day;
    if (1582 == year && 10 == month) {
      if (day >= 15) {
        d -= 10;
      } else if (day > 4) {
        throw 'wrong solar year $year month $month day $day';
      }
    }
    days += d;
    return days;
  }

  /// 获取某年某月有多少周
  ///
  /// @param year  年
  /// @param month 月
  /// @param start 星期几作为一周的开始，1234560分别代表星期一至星期天
  /// @return 周数
  static int getWeeksOfMonth(int year, int month, int start) {
    return ((getDaysOfMonth(year, month) + Solar.fromYmd(year, month, 1).getWeek() - start) * 1.0 / WEEK.length).ceil();
  }

  /// 获取两个日期之间相差的天数（如果日期a比日期b小，天数为正，如果日期a比日期b大，天数为负）
  ///
  /// @param ay 年a
  /// @param am 月a
  /// @param ad 日a
  /// @param by 年b
  /// @param bm 月b
  /// @param bd 日b
  /// @return 天数
  static int getDaysBetween(int ay, int am, int ad, int by, int bm, int bd) {
    int n;
    int days;
    int i;
    if (ay == by) {
      n = getDaysInYear(by, bm, bd) -
          getDaysInYear(ay, am, ad);
    } else if (ay > by) {
      days = getDaysOfYear(by) - getDaysInYear(by, bm, bd);
      for (i = by + 1; i < ay; i++) {
        days += getDaysOfYear(i);
      }
      days += getDaysInYear(ay, am, ad);
      n = -days;
    } else {
      days = getDaysOfYear(ay) - getDaysInYear(ay, am, ad);
      for (i = ay + 1; i < by; i++) {
        days += getDaysOfYear(i);
      }
      days += getDaysInYear(by, bm, bd);
      n = days;
    }
    return n;
  }

}
