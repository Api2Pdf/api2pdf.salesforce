public with sharing class Api2PdfController {
    
    Api2PdfClient a2pClient = new Api2PdfClient('YOUR-API-KEY');

    public String PdfUrl {get;set;}

    public void wkhtmlToPdfFromHtml(){
        Api2PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

     public void wkhtmlToPdfFromHtmlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf', options);
        PdfUrl= pdfResponse.getPdf();
    }

    public void wkhtmlToPdfFromUrl(){
        Api2PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

    public void wkhtmlToPdfFromUrlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf', options);
        PdfUrl= pdfResponse.getPdf();
    }

    public void headlessChromeFromHtml(){
        Api2PdfResponse pdfResponse = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

    public void headlessChromeFromHtmlWithOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse pdfResponse = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf', options);
        PdfUrl= pdfResponse.getPdf();
    }

    public void headlessChromeFromUrl(){
        Api2PdfResponse pdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

    public void headlessChromeFromUrlOptions(){
        Map<String, String> options = new Map<String, String>();
        options.put('orientation', 'landscape');
        options.put('pageSize', 'A4');
        Api2PdfResponse pdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf', options);
        PdfUrl= pdfResponse.getPdf();
    }

     public void libreofficeConvert(){
        PdfUrl = '';
        Api2PdfResponse pdfResponse = a2pClient.libreofficeConvert('http://homepages.inf.ed.ac.uk/neilb/TestWordDoc.doc', true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

     public void mergePdf(){
        PdfUrl = '';
        String[] urls = new List<String>();
        urls.add('http://www.orimi.com/pdf-test.pdf');
        urls.add('http://www.orimi.com/pdf-test.pdf');
        Api2PdfResponse pdfResponse = a2pClient.mergePdf(urls, true, 'test.pdf');
        PdfUrl= pdfResponse.getPdf();
    }

}