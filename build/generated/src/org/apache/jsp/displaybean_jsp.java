package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class displaybean_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      com.clinic.Visit vi = null;
      synchronized (session) {
        vi = (com.clinic.Visit) _jspx_page_context.getAttribute("vi", PageContext.SESSION_SCOPE);
        if (vi == null){
          vi = new com.clinic.Visit();
          _jspx_page_context.setAttribute("vi", vi, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\n');
      com.clinic.Patient pa = null;
      synchronized (session) {
        pa = (com.clinic.Patient) _jspx_page_context.getAttribute("pa", PageContext.SESSION_SCOPE);
        if (pa == null){
          pa = new com.clinic.Patient();
          _jspx_page_context.setAttribute("pa", pa, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("<html>\n");
      out.write("<head><title>Bean property display</title></head>\n");
      out.write("<body>\n");
      out.write("<h2>Here are the Bean properties</h2>\n");
      out.write("\n");
      out.write("Visit id ");
      out.print( vi.getVisit_id() );
      out.write(" \n");
      out.write("\n");
      out.write("Patient Id ");
      out.print(  pa.getPatient_id() );
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
