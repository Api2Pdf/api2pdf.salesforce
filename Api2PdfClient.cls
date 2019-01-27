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
        Api2PdfFromUrlRequestModel model = new Api2PdfFromUrlRequestModel();
        model.Url = officeFileUrl;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }
    
    public Api2PdfResponse mergePdf(String[] pdfUrls, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_MERGE);
        Api2PdfMergeRequestModel model = new Api2PdfMergeRequestModel();
        model.Urls = pdfUrls;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse wkhtmlToPdfFromHtml(String html, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_HTML);
        Api2PdfFromHtmlRequestModel model = new Api2PdfFromHtmlRequestModel();
        model.Html = html;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    public Api2PdfResponse wkhtmlToPdfFromHtml(String html, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_HTML);
        Api2PdfFromHtmlRequestModel model = new Api2PdfFromHtmlRequestModel();
        model.Html = html;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        model.Options = options;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse wkhtmlToPdfFromUrl(String url, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_URL);
        Api2PdfFromUrlRequestModel model = new Api2PdfFromUrlRequestModel();
        model.Url = url;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    public Api2PdfResponse wkhtmlToPdfFromUrl(String url, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_WKHTMLTOPDF_URL);
        Api2PdfFromUrlRequestModel model = new Api2PdfFromUrlRequestModel();
        model.Url = url;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        model.options = options;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }


    public Api2PdfResponse headlessChromeFromHtml(String html, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_CHROME_HTML);
        Api2PdfFromHtmlRequestModel model = new Api2PdfFromHtmlRequestModel();
        model.Html = html;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromHtml(String html, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_CHROME_HTML);
        String optionsPayload = '';
        Api2PdfFromHtmlRequestModel model = new Api2PdfFromHtmlRequestModel();
        model.Html = html;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        model.options = options;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromUrl(String url, boolean inlinePdf, String fileName)  {
        HttpRequest req = getRequest(API2PDF_CHROME_URL);
        Api2PdfFromUrlRequestModel model = new Api2PdfFromUrlRequestModel();
        model.Url = url;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }

    
    public Api2PdfResponse headlessChromeFromUrl(String url, boolean inlinePdf, String fileName, Map<String, String> options)  {
        HttpRequest req = getRequest(API2PDF_CHROME_URL);
        Api2PdfFromUrlRequestModel model = new Api2PdfFromUrlRequestModel();
        model.Url = url;
        model.InlinePdf = inlinePdf;
        model.FileName = fileName;
        model.options = options;
        String payload = JSON.serialize(model);
        return makeRequest(payload, inlinePdf, fileName, req);
    }
}