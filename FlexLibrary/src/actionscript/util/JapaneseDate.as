package actionscript.util {

	public class JapaneseDate {

		private static const JP_ERA:Array = ["明治", "大正", "昭和", "平成"];

		private var _date:Date;

		public function JapaneseDate(yearOrTimevalue:*=null, month:*=null, date:*=null, hour:*=null, min:*=null, sec:*=null, ms:*=null) {
			if(!yearOrTimevalue && !month && !date && !hour && !min && !sec && !ms) _date = new Date();
			else if(yearOrTimevalue && !month && !date && !hour && !min && !sec && !ms) _date = new Date(yearOrTimevalue);
			else _date = new Date(yearOrTimevalue, month, date, hour, min, sec, ms);
		}

		public static function getJapaneseEra(value:Date):String {

			var year_ad:int = value.getFullYear();
			var month:int = value.getMonth();
			var date:int = value.getDate();

			var year_jp:String;

			if(year_ad > 1989 || (year_ad == 1989 && ((month > 0) || (month == 0 && date >= 8)))) {
				year_jp = JP_ERA[3];
			} else if(year_ad > 1926 || (year_ad == 1926 && (month == 11 && date >= 25))) {
				year_jp = JP_ERA[2];
			} else if(year_ad > 1912 || (year_ad == 1912 && ((month > 6) || (month == 6 && date >= 30)))) {
				year_jp = JP_ERA[1];
			} else if(year_ad > 1868 || (year_ad == 1868 && ((month > 8) || (month == 8 && date >= 8)))) {
				year_jp = JP_ERA[0];
			}

			var num:Number;
			if(JP_ERA[3] == year_jp) {
				num = year_ad - 1989 + 1;
				if(num == 1) year_jp += "元年";
				else 		 year_jp += num + "年";
			} else if(JP_ERA[2] == year_jp) {
				num = year_ad - 1926 + 1;
				if(num == 1) year_jp += "元年";
				else 		 year_jp += num + "年";
			} else if(JP_ERA[1] == year_jp) {
				num = year_ad - 1912 + 1;
				if(num == 1) year_jp += "元年";
				else 		 year_jp += num + "年";
			} else if(JP_ERA[0] == year_jp) {
				num = year_ad - 1868 + 1;
				if(num == 1) year_jp += "元年";
				else 		 year_jp += num + "年";
			}

			return year_jp;
		}

		public function getTime():Number {
			return _date.getTime();
		}

		public function getFullYearJp():String {
			return getJapaneseEra(_date);
		}

		public function getFullYear():Number {
			return _date.getFullYear();
		}

		public function getMonth():Number {
			return _date.getMonth();
		}

		public function getDate():Number {
			return _date.getDate();
		}

		public function getHours():Number {
			return _date.getHours();
		}

		public function getMinutes():Number {
			return _date.getMinutes();
		}

		public function getSeconds():Number {
			return _date.getSeconds();
		}

		public function getMilliseconds():Number {
			return _date.getMilliseconds();
		}

		public function setTime(t:*=null):void {
			_date.setTime(t);
		}

		public function setFullYear(year:*=null, month:*=null, date:*=null):void {
			_date.setFullYear(year, month, date);
		}

		public function setMonth(month:*=null, date:*=null):void {
			_date.setMonth(month, date);
		}

		public function setDate(date:*=null):void {
			_date.setDate(date);
		}

		public function setHours(hour:*=null, min:*=null, sec:*=null, ms:*=null):void {
			_date.setHours(hour, min, sec, ms);
		}

		public function setMinutes(min:*=null, sec:*=null, ms:*=null):void {
			_date.setMinutes(min, sec, ms);
		}

		public function setSeconds(sec:*=null, ms:*=null):void {
			_date.setSeconds(sec, ms);
		}

		public function setMilliseconds(ms:*=null):void {
			_date.setMilliseconds(ms);
		}
	}
}