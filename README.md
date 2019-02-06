# api2pdf for Salesforce
Salesforce Apex code for [Api2Pdf REST API](https://www.api2pdf.com/documentation) 

Api2Pdf.com is a REST API for instantly generating PDF documents from HTML, URLs, Microsoft Office Documents (Word, Excel, PPT), and images. The API also supports merge / concatenation of two or more PDFs. Api2Pdf is a wrapper for popular libraries such as **wkhtmltopdf**, **Headless Chrome**, and **LibreOffice**.

- [Installation](#installation)
- [Resources](#resources)
- [Authorization](#authorization)
- [Usage](#usage)
- [FAQ](https://www.api2pdf.com/faq)

## <a name="installation"></a>Installation

1. Click here (https://login.salesforce.com/packaging/installPackage.apexp?p0=04t4J0000005401)

2. Login with your Salesforce Credentials

3. Install the Unmanaged Package OR copy and paste all of the code from this repo

4. Once the apex files are added, go to your Visual Force pages and find the page for api2pdf_settings
![image](https://user-images.githubusercontent.com/7950956/52316110-0a809200-2988-11e9-8e99-c11230148606.png)

5. Click the icon to load the page
![image](https://user-images.githubusercontent.com/7950956/52316134-1c623500-2988-11e9-81a2-b3549a243b92.png)

6. Create an account at [portal.api2pdf.com](https://portal.api2pdf.com/register) to get your API key and enter it into the page

7. You are ready to use api2pdf classes, for usage you can see examples here: https://github.com/Api2Pdf/api2pdf.salesforce/blob/master/Api2PdfController.cls

8. If you wish to test this out, take a look at the api2pdf_page visual force page

## <a name="resources"></a>Resources

Resources this API supports:

- [wkhtmltopdf](#wkhtmltopdf)
- [Headless Chrome](#chrome)
- [LibreOffice](#libreoffice)
- [Merge / Concatenate PDFs](#merge)

## <a name="authorization"></a>Authorization

### Acquire API Key

Create an account at [portal.api2pdf.com](https://portal.api2pdf.com/register) to get your API key.
    
## <a name="#usage"></a>Usage

### Initialize the Client

All usage starts by calling the import command and initializing the client by passing your API key as a parameter to the constructor.

    Api2PdfClient a2pClient = new Api2PdfClient("your-api-key");

Once you initialize the client, you can make calls like so:

    PdfResponse response = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf');
    string PdfUrl = response.getPdf();
    
### Result Format

An ApiResult object is returned from every API call. If a call is unsuccessful then an exception will be thrown with a message containing the result of failure. 

Additional attributes include the total data usage in, out, and the cost for the API call, typically very small fractions of a penny.

    private String responseId;
    private String error;
    private String mbOut;
    private String pdf;
    private Boolean success;
    private String cost;
    private String mbIn;
    
### <a name="wkhtmltopdf"></a> wkhtmltopdf

**Convert HTML to PDF**

    PdfResponse response = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf');    
    
**Convert HTML to PDF (use arguments for advanced wkhtmltopdf settings)**
[View full list of wkhtmltopdf options available.](https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/)

    Map<String, String> options = new Map<String, String>();
    options.put('orientation', 'landscape');
    options.put('pageSize', 'A4');
    PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromHtml('<p>test</p>', true, 'test.pdf', options);
    string pdfUrl = pdfResponse.getPdf();

**Convert URL to PDF**

     PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf');
     string pdfUrl = pdfResponse.getPdf();
    
**Convert URL to PDF (use arguments for advanced wkhtmltopdf settings)**
[View full list of wkhtmltopdf options available.](https://www.api2pdf.com/documentation/advanced-options-wkhtmltopdf/)

    Map<String, String> options = new Map<String, String>();
    options.put('orientation', 'landscape');
    options.put('pageSize', 'A4');
    PdfResponse pdfResponse = a2pClient.wkhtmlToPdfFromUrl('https://www.google.com', true, 'test.pdf', options);
    string pdfUrl = pdfResponse.getPdf();
---

## <a name="chrome"></a>Headless Chrome

**Convert HTML to PDF**

    PdfResponse response = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf');
    string pdfUrl = response.getPdf();
    
**Convert HTML to PDF (use arguments for advanced Headless Chrome settings)**
[View full list of Headless Chrome options available.](https://www.api2pdf.com/documentation/advanced-options-headless-chrome/)

    Map<String, String> options = new Map<String, String>();
    options.put('landscape', 'true');
    PdfResponse pdfResponse = a2pClient.headlessChromeFromHtml('<p>test</p>', true, 'test.pdf', options);
    string pdfUrl = pdfResponse.getPdf();

**Convert URL to PDF**
        
    PdfResponse pdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf');
    string pdfUrl = pdfResponse.getPdf();
    
    
**Convert URL to PDF (use arguments for advanced Headless Chrome settings)**
[View full list of Headless Chrome options available.](https://www.api2pdf.com/documentation/advanced-options-headless-chrome/)

    Map<String, String> options = new Map<String, String>();
    options.put('landscape', 'true');
    PdfResponse pdfResponse = a2pClient.headlessChromeFromUrl('https://www.google.com', true, 'test.pdf', options);
    string pdfUrl = pdfResponse.getPdf();
    
---

## <a name="libreoffice"></a>LibreOffice

LibreOffice supports the conversion to PDF from the following file formats:

- doc / docx
- xls / xlsx
- ppt / pptx
- gif
- jpg
- png
- bmp
- rtf
- txt 
- html

You must provide a URL to the file. Our engine will consume the file at that URL and convert it to the PDF.

**Convert Microsoft Office Document or Image to PDF**

    PdfResponse pdfResponse = a2pClient.libreofficeConvert('http://homepages.inf.ed.ac.uk/neilb/TestWordDoc.doc', true, 'test.pdf');
    string pdfUrl = pdfResponse.getPdf();
    
---
    
## <a name="merge"></a>Merge / Concatenate Two or More PDFs

To use the merge endpoint, supply a list of URLs to existing PDFs. The engine will consume all of the PDFs and merge them into a single PDF, in the order in which they were provided in the list.

**Merge PDFs from list of URLs to existing PDFs**

    String[] urls = new List<String>();
    urls.add('http://www.orimi.com/pdf-test.pdf');
    urls.add('http://www.orimi.com/pdf-test.pdf');
    PdfResponse pdfResponse = a2pClient.mergePdf(urls, true, 'test.pdf');
    string pdfUrl = pdfResponse.getPdf();
    

    
