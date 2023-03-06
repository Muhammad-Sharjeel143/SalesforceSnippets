public with sharing class JSONParser {
    public class Timezone {
		public String timezone_identifier;
		public String timezone_abbr;
		public Integer utc_offset_sec;
		public String is_dst;
	}

	public String zip_code;
	public Double lat;
	public Double lng;
	public String city;
	public String state;
	public Timezone timezone;
	public List<Acceptable_city_names> acceptable_city_names;
	public List<Integer> area_codes;

	public class Acceptable_city_names {
		public String city;
		public String state;
	}
}