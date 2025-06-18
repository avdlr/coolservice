<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
 
<html>
<body>
    <%
    try{
    	System.err.print("--------------------------1");
        String remoteAddr = request.getRemoteAddr();
        System.err.print("--------------------------2 "+remoteAddr);
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LeaQSATAAAAANs4YFVJG1RvVPRpwx6bM6jcqzrZ");
        System.err.print("--------------------------3");
        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        System.err.print("--------------------------4");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
        System.err.print("--------------------------5");
        if (reCaptchaResponse.isValid()) 
        {
            out.print("Answer was entered correctly!");
        } else
        {
            out.print("Answer is wrong");
        }
    }catch(Exception e)
    {
    	e.printStackTrace();
    }
    %>
</body>
</html>