@isTest
public class InsertContactMock implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"zip_code":"00501","lat":40.810008,"lng":-73.04009,"city":"Holtsville","state":"NY","timezone":{"timezone_identifier":"America New_York","timezone_abbr":"EST","utc_offset_sec":-18000,"is_dst":"F"},"acceptable_city_names":[{"city":"I R S Service Center","state":"NY"}],"area_codes":[631]}');
        res.setStatusCode(200);
        return res;
    }
}