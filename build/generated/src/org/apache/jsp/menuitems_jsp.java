package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menuitems_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <menu type=\"horizontal\" bgcolor=\"00CF\" selectedItemColor=\"##e7d844\">\n");
      out.write("\t<menuitem display=\"Search\" href=\"Index.m\" />\n");
      out.write("   \n");
      out.write("    <menuitem display=\"Record\">\n");
      out.write("   \n");
      out.write("    \t<menuitem display=\"Behavior\" href=\"BehaviorRecords.m\"/>\n");
      out.write("        <menuitem display=\"Assessment\" href=\"FA.m\"/>\n");
      out.write("       \n");
      out.write("         \n");
      out.write("    </menuitem>\n");
      out.write("    \n");
      out.write("        <menuitem display=\"Goals\">\n");
      out.write("        \t<menuitem display=\"View Goals\" href=\"viewgoals.m\"/>\n");
      out.write("            <menuitem display=\"Create Goals\" href=\"Goals.m\"/>\n");
      out.write("        </menuitem>\n");
      out.write("        \n");
      out.write("        <menuitem display=\"Tests\">\n");
      out.write("        \t<menuitem display=\"View Tests\" href=\"ExamScoreTrends.m\"/>\n");
      out.write("            <menuitem display=\"Create Tests\" href=\"CreateTest.m\"/>\n");
      out.write("            <menuitem display=\"Record Test Scores\" href=\"TestScores.m\"/>\n");
      out.write("        </menuitem> \n");
      out.write("   \n");
      out.write("    </if>\n");
      out.write("    <menuitem display=\"Trends\">\n");
      out.write("    \t<menuitem display=\"Behavior Trends\" href=\"Trends.m\"/>\n");
      out.write("        <menuitem display=\"Functional Assessment\" href=\"FATracking.m\"/>\n");
      out.write("        <menuitem display=\"Personal Trends\" href=\"BehaviorTrends.m\"/>\n");
      out.write("        <menuitem display=\"Behavior Predictors\" href=\"Predictors.m\"/>\n");
      out.write("    </menuitem>\n");
      out.write("    <menuitem display=\"Administration\">\n");
      out.write("    \t<menuitem display=\"Password\" href=\"changePassword.m\"/>\n");
      out.write("        \n");
      out.write("        <menuitem display=\"New Room\" href=\"NewRoom.m\"/>\n");
      out.write("        <menuitem display=\"Behaviors\" href=\"listBehaviors.m\"/>\n");
      out.write("        <menuitem display=\"New User\" href=\"NewUser.m\"/>\n");
      out.write("        <menuitem display=\"All Users\" href=\"AllUsers.m\"/>\n");
      out.write("       \n");
      out.write("    </menuitem>\n");
      out.write("\t <menuitem display=\"Classroom\">\n");
      out.write("    \t<menuitem display=\"Change Classroom\" href=\"Index.m\"/>\n");
      out.write("\t\t<menuitem display=\"New Student\" href=\"NewStudent.m\"/>\n");
      out.write("        <menuitem display=\"Student List\" href=\"StudentList.m\" />\n");
      out.write("        <menuitem display=\"Tracked Behaviors\" href=\"TrackBehavior.m\" />\n");
      out.write("\t<menuitem display=\"To Do List\" href=\"ToDoList.m\" />\n");
      out.write("    </menuitem>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("    <menuitem display=\"Log Out: #SESSION.auth.LoggedUser#\" href=\"LogOut.m\" />\n");
      out.write("</menu>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
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
