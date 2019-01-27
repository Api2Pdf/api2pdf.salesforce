@isTest
public class Api2PdfControllerTests {

    public static testMethod  void testApi2PdfController() {
      
        Api2PdfController controller = new Api2PdfController ();
       
        Api2PdfResponse response = controller.headlessChromeFromHtml();

        // Verify that the success page displays
        System.assertNotEquals(response.getPdf(), '');
    }
}