public class Api2PdfClient{

    private static final String API2PDF_BASE_URL = 'https://v2018.api2pdf.com';
    private static final String API2PDF_MERGE = API2PDF_BASE_URL + '/merge';
    private static final String API2PDF_WKHTMLTOPDF_HTML = API2PDF_BASE_URL + '/wkhtmltopdf/html';
    private static final String API2PDF_WKHTMLTOPDF_URL = API2PDF_BASE_URL + '/wkhtmltopdf/url';
    private static final String API2PDF_CHROME_HTML = API2PDF_BASE_URL + '/chrome/html';
    private static final String API2PDF_CHROME_URL = API2PDF_BASE_URL + '/chrome/url';
    private static final String API2PDF_LIBREOFFICE_CONVERT = API2PDF_BASE_URL + '/libreoffice/convert';

    private String apiKey;

    public Api2PdfClient(String apiKey) {
        this.apiKey = apiKey;
    }
    
    
    private HttpRequest getRequest(String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Authorization', this.apiKey);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setHeader('User-Agent', 'Api2Pdf Client');
        return req;
    }


    private Api2PdfResponse makeRequest(String payload, Boolean inlinePdf, String fileName, HttpRequest req){
        Http http = new Http();
        req.setBody(payload);
        HTTPResponse res = http.send(req);
        Blob body = res.getBodyAsBlob();
        String requestString = body.toString();
        return (Api2PdfResponse)JSON.deserialize(requestString, Api2PdfResponse.class);
    }

    public Api2PdfResponse libreofficeConvert(String officeFileUrl, boolean inlinePdf, String fileName){
        HttpRequest req = getRequest(API2PDF_LIBREOFFICE_CONVERT);
        String payload = '{\'url\':\'' + officeFileUrl + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }
    
    public Api2PdfResponse mergePdf(String[] firstPdfUrls, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_MERGE);
        String urls = '';
        for (String item : firstPdfUrls) {
            urls += '\'' + item + '\', ';
        }
        urls = urls.removeEnd(', ');

        String payload = '{\'urls\':[ ' + urls + '],\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse wkhtmlToPdfFromHtml(String html, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_HTML);
        String payload = '{\'html\':\'' + html + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    public Api2PdfResponse wkhtmlToPdfFromHtml(String html, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_HTML);
        String optionsPayload = '';
        for (String key : options.keySet()) {
            optionsPayload += '\'' + key + '\':\'' + options.get(key) + '\', ';
        }
       
        optionsPayload = optionsPayload.removeEnd(', ');
        String payload = '{\'html\':\'' + html + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\', \'options\':{ ' + optionsPayload + '}}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse wkhtmlToPdfFromUrl(String url, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_URL);
        String payload = '{\'url\':\'' + url + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    public Api2PdfResponse wkhtmlToPdfFromUrl(String html, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_URL);
        String optionsPayload = '';
        for (String key : options.keySet()) {
            optionsPayload += '\'' + key + '\':\'' + options.get(key) + '\', ';
        }
       
        optionsPayload = optionsPayload.removeEnd(', ');
        String payload = '{\'html\':\'' + html + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\', \'options\':{ ' + optionsPayload + '}}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }


    public Api2PdfResponse headlessChromeFromHtml(String html, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_CHROME_HTML);
        String payload = '{\'html\':\'' + html + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromHtml(String html, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_CHROME_HTML);
        String optionsPayload = '';
        for (String key : options.keySet()) {
            optionsPayload += '\'' + key + '\':\'' + options.get(key) + '\', ';
        }
       
        optionsPayload = optionsPayload.removeEnd(', ');
        String payload = '{\'html\':\'' + html + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\', \'options\':{ ' + optionsPayload + '}}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromUrl(String url, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_CHROME_URL);
        String payload = '{\'url\':\'' + url + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName + '\'}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromUrl(String url, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_CHROME_URL);
        String optionsPayload = '';
        for (String key : options.keySet()) {
            optionsPayload += '\'' + key + '\':\'' + options.get(key) + '\', ';
        }
        optionsPayload = optionsPayload.removeEnd(', ');
        String payload = '{\'url\':\'' + url + '\',\'inlinePdf\':' + inlinePdf + ',\'fileName\':\'' + fileName
                + '\', \'options\':{ ' + optionsPayload + '}}';
        return makeRequest(payload, inlinePdf, fileName, req);
    }
}