public class Api2PdfClientMockout  implements HttpCalloutMock{
    private static final String RESPONSE_BODY ='{"success": true}';
    public static final String RESPONSE_HEADER_PARAM_NAME = 'Content-Type';
    public static final String RESPONSE_HEADER_CONTENT_TYPE = 'application/json';


    public HTTPResponse respond(HttpRequest req){
        HttpResponse resp=new HttpResponse();
        resp.setHeader(RESPONSE_HEADER_PARAM_NAME, RESPONSE_HEADER_CONTENT_TYPE);
        resp.setBody(RESPONSE_BODY);
        resp.setStatusCode(200);
        return resp;

    }
}