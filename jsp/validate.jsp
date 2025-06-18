 <%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
    <%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>

    <html>
      <body>

		<%
		String user_name=(String)request.getParameter("user_name");
		
		%>

		<h1>User Name is : <%=user_name %> </h1>
		



      <%
        String remoteAddr = request.getRemoteAddr();
        ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
        reCaptcha.setPrivateKey("6LcISCoUAAAAACWgfufPTOPqRekq-9FCnlzNkG73");

        String challenge = request.getParameter("recaptcha_challenge_field");
        String uresponse = request.getParameter("recaptcha_response_field");
        ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

        if (reCaptchaResponse.isValid()) {
          out.print("Answer was entered correctly!");
        } else {
          out.print("Answer is wrong");
        }
      %>
      </body>
    </html>