public class Api2PdfResponse {

     private String responseId;

        private String error;

        private String mbOut;

        private String pdf;

        private Boolean success;

        private String cost;

        private String mbIn;

       
        public String getResponseId ()
        {
            return responseId;
        }

      
        public void setResponseId (String responseId)
        {
            this.responseId = responseId;
        }

      
        public String getError ()
        {
            return error;
        }

       
        public void setError (String error)
        {
            this.error = error;
        }

       
        public String getMbOut ()
        {
            return mbOut;
        }

        
        public void setMbOut (String mbOut)
        {
            this.mbOut = mbOut;
        }

     
        public String getPdf ()
        {
            return pdf;
        }

      
        public void setPdf (String pdf)
        {
            this.pdf = pdf;
        }

        
        public Boolean getSuccess ()
        {
            return success;
        }

       
        public void setSuccess (Boolean success)
        {
            this.success = success;
        }

       
        public String getCost ()
        {
            return cost;
        }

       
        public void setCost (String cost)
        {
            this.cost = cost;
        }

       
        public String getMbIn ()
        {
            return mbIn;
        }

      
        public void setMbIn (String mbIn)
        {
            this.mbIn = mbIn;
        }

       
}