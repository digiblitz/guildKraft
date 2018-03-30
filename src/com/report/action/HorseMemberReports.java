/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.report.action;
import com.hlcmember.type.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.naming.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import org.apache.struts.action.*;
import org.apache.struts.util.MessageResources;
import com.util.BIRTGraphsConfig;
import com.birt.graphs.BarGraph;
import com.birt.graphs.ConeGraph;
import com.birt.graphs.LineGraph;
import com.birt.graphs.PieGraph;
import com.birt.graphs.PlotFormat;
import com.birt.graphs.PyramidGraph;
import com.birt.graphs.TubeGraph;
import com.hlcmembership.stateless.HLCKaveryStatelessMembershipServiceBean;
import com.oee.action.EventsYearWise;
import com.oee.action.HumanMembersEventsParticipated;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.birt.chart.model.Chart;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author Remya
 */

	public class HorseMemberReports implements Controller {
		
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
			 	
    	
        HttpSession session = request.getSession();
        
        ServletContext context = request.getSession().getServletContext();
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
       
        String realPath = context.getRealPath("/") + "images/";
        String process = request.getParameter("process");
        String findForward = null;
        
        HLCKaveryStatelessMembershipServiceBean kaveryStatelessBean=new HLCKaveryStatelessMembershipServiceBean();
        
        if (process != null) {
            if (process.equalsIgnoreCase("horseMembersStatusWise")) {
                String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");
                String fromDate = request.getParameter("fromDate");
                Date startDate = null;

                if (fromDate != null && fromDate.trim().length() != 0) {
                    try {
						startDate = (Date) sdf.parse(fromDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + startDate);
                }

                String toDate = request.getParameter("toDate");
                Date endDate = null;

                if (toDate != null && toDate.trim().length() != 0) {
                    try {
						endDate = (Date) sdf.parse(toDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + endDate);
                }
                HashMap horseMembersCountStatusWise = kaveryStatelessBean.getHorseMembersStatusWise(startDate, endDate);
               
                           if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                
                        if(graph[i].equalsIgnoreCase("pie")) 
                        {
                // Pie Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.createStatusWiseHorseMembersNumberPie(horseMembersCountStatusWise);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("chart")){
                //Bar Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartBar = BarGraph.createStatusWiseHorseMembersNumberBar(horseMembersCountStatusWise);
                BarGraph.generateBarGraphImage(chartBar, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("line")) {
                // Line Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createStatusWiseHorseMembersNumberLine(horseMembersCountStatusWise);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("PyramidChart")){
                // Pyramid Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPyramid = PyramidGraph.createStatusWiseHorseMembersNumberPyramid(horseMembersCountStatusWise);
                PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                        }
                    }
                    request.setAttribute("graphsCount",graphNew);
                    request.setAttribute("StartDate",fromDate);
                    request.setAttribute("EndDate",toDate);
                    return new ModelAndView("generateHorseReportStatusWise");
                    }
                           else{
                         List list=new ArrayList();
                         Set horse=horseMembersCountStatusWise.keySet();
                        for(Iterator it=horse.iterator();it.hasNext();)
                        {
                        String status_name=(String)it.next();
                        String total= (String)horseMembersCountStatusWise.get(status_name);
                        EventsYearWise yr=new EventsYearWise();
                        yr.setYear(status_name);
                        yr.setCount(Integer.parseInt(total));
                        list.add(yr);
                        Debug.print("Status-Name "+status_name);
                        Debug.print("Total  For"+" "+total);
                        }
                         session.setAttribute("demo",list);
                         session.setAttribute("StartDate",fromDate);
                         session.setAttribute("EndDate",toDate);
                         return new ModelAndView("horseMemberNumberStatusWiseTabular");
                           }

            }

             if(process.equalsIgnoreCase("horseMembersMembershipAndStatusWise"))
                {
                 String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");    
                 String fromDate = request.getParameter("fromDate");
                        Date startDate=null;

                        if(fromDate!=null && fromDate.trim().length()!=0){
                            try {
								startDate=(Date)sdf.parse(fromDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("startDate in servlet"+startDate);
                        }

                        String toDate = request.getParameter("toDate");
                        Date endDate=null;

                        if(toDate!=null && toDate.trim().length()!=0){
                            try {
								endDate=(Date)sdf.parse(toDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("endDate in servlet"+endDate);
                        }

                        String status=request.getParameter("status");

                        HashMap HorseMembersMemberShips=kaveryStatelessBean.getHorseMembersMemberShipsByStatus(startDate,endDate,status);
                                   if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                
                        if(graph[i].equalsIgnoreCase("pie")) 
                        {
                        // Pie Chart Generation
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartPie =PieGraph.createMembershipWiseHorseNumberByStatusPie(HorseMembersMemberShips, status);
                         PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("chart")){
                          //Bar Chart Generation
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartBar=BarGraph.createMembershipWiseHorseNumberByStatusBar(HorseMembersMemberShips, status);
                         BarGraph.generateBarGraphImage(chartBar, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("line")){
                           // Line Chart Generation
                        BIRTGraphsConfig.initializeDesignConfig(context);
                        Chart chartLine = LineGraph.createMembershipWiseHorseNumberByStatusLine(HorseMembersMemberShips, status);
                        LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("PyramidChart")){
                        // Pyramid Chart Generation
                        BIRTGraphsConfig.initializeDesignConfig(context);
                        Chart chartPyramid = PyramidGraph.createMembershipWiseHorseNumberByStatusPyramid(HorseMembersMemberShips, status);
                        PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                        }
                    }
                      request.setAttribute("graphsCount",graphNew); 
                      request.setAttribute("StartDate",fromDate);
                         request.setAttribute("EndDate",toDate);
                         return new ModelAndView("generateReportsHorseMemberNumberMemberShipWise");
                    }
                    else 
                    {
                        List list=new ArrayList();
                        Set horse=HorseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)HorseMembersMemberShips.get(membership_name);
                                      EventsYearWise yr=new EventsYearWise();
                                        yr.setYear(membership_name);
                                        yr.setCount(Integer.parseInt(total));
                                        list.add(yr);
                                      Debug.print("Mebership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
                        session.setAttribute("demo",list);
                        session.setAttribute("StartDate",fromDate);
                         session.setAttribute("EndDate",toDate);
                         return new ModelAndView("horseMemberNumberMemberShipWiseTabular");
                        
                    }
                }

                if(process.equalsIgnoreCase("HorseSpecificMembershipAndStatusWise"))
                {
                     String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");    
                    String fromDate = request.getParameter("fromDate");
                        Date startDate=null;

                        if(fromDate!=null && fromDate.trim().length()!=0){
                            try {
								startDate=(Date)sdf.parse(fromDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("startDate in servlet"+startDate);
                        }

                        String toDate = request.getParameter("toDate");
                        Date endDate=null;

                        if(toDate!=null && toDate.trim().length()!=0){
                            try {
								endDate=(Date)sdf.parse(toDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("endDate in servlet"+endDate);
                        }

                        String status=request.getParameter("status");
                        String membership_type_id=request.getParameter("membershipid");
                        String membership_Name=null;
                             if(membership_type_id.equalsIgnoreCase("A75F797E-5279-4F2C-BC2B-048E88FD9020"))
                                  membership_Name="Young Event Horse";
                        else if(membership_type_id.equalsIgnoreCase("9057F93F-D265-46B3-B5E5-352B275BF191"))
                                  membership_Name="LIMITED";
                        else if(membership_type_id.equalsIgnoreCase("01A46E72-1FBF-412F-8626-3C7CFE48EB57"))
                                  membership_Name="FUTURE EVENT HORSE";
                        else if(membership_type_id.equalsIgnoreCase("23967F37-D688-4B20-8662-793AB8F56354"))
                                  membership_Name="DUPLICATE";
                        else if(membership_type_id.equalsIgnoreCase("C3D04478-20DB-434D-A6E9-876FD04609A3"))
                                  membership_Name="NOT REGISTERED";
                        else if(membership_type_id.equalsIgnoreCase("3A1B7858-99B1-456C-AFB9-F220B15654DA"))
                                  membership_Name="FULL";

                        String total=kaveryStatelessBean.getHorseMemberShipsBySpecificTypeAndStatus(startDate,endDate,status,membership_type_id);
                                        if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                
                        if(graph[i].equalsIgnoreCase("plotformat")) 
                        {
                          // PLot Format Chart Generation
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartPlotFormat =PlotFormat.createHorseMembersSpecificMembershipByStatusPlotFormatGraph(total, membership_Name,status);
                         PlotFormat.generatePlotFormatGraphImage(chartPlotFormat,realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("chart")) {
                         //Bar Chart Generation
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartBar=BarGraph.createHorseMembersSpecificMembershipByStatusBar(total, membership_Name, status);
                          BarGraph.generateBarGraphImage(chartBar, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("tube")) {
                        // Tube Chart Generation
                        BIRTGraphsConfig.initializeDesignConfig(context);
                        Chart chartTube = TubeGraph.createHorseMembersSpecificMembershipByStatusTube(total, membership_Name, status);
                         TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                        else if(graph[i].equalsIgnoreCase("cone")){
                         // Cone Chart Generation
                        BIRTGraphsConfig.initializeDesignConfig(context);
                        Chart chartCone = ConeGraph.createHorseMembersSpecificMembershipByStatusCone(total, membership_Name, status);
                         ConeGraph.generateConeGraphImage(chartCone, realPath);
                        }
                    }
                         request.setAttribute("membership_type_name",membership_Name);
                         request.setAttribute("status",status);
                         request.setAttribute("graphsCount",graphNew);
                         request.setAttribute("StartDate",fromDate);
                         request.setAttribute("EndDate",toDate);
                         return new ModelAndView("generateReportsHorseSpecificMemberShipAndStatusWise");
                                        }
                                        else
                                        {
                        List list=new ArrayList();
                        HumanMembersEventsParticipated horseCount=new HumanMembersEventsParticipated();
                        horseCount.setEventsConducted(Integer.parseInt(total));
                        list.add(horseCount);
                        
                          session.setAttribute("demo",list); 
                           session.setAttribute("membership_type_name",membership_Name);
                         session.setAttribute("status",status);
                         session.setAttribute("StartDate",fromDate);
                         session.setAttribute("EndDate",toDate);
                         return new ModelAndView("horseSpecificMemberShipAndStatusWiseTabular");
                                        }
                }

            if (process.equalsIgnoreCase("newlyRegHorseMembersMeberShipWise")) {
                String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");
                String fromDate = request.getParameter("fromDate");
                        Date startDate=null;

                        if(fromDate!=null && fromDate.trim().length()!=0){
                            try {
								startDate=(Date)sdf.parse(fromDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("startDate in servlet"+startDate);
                        }

                        String toDate = request.getParameter("toDate");
                        Date endDate=null;

                        if(toDate!=null && toDate.trim().length()!=0){
                            try {
								endDate=(Date)sdf.parse(toDate);
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                            Debug.print("endDate in servlet"+endDate);
                        }
                HashMap newlyRegHorseMemberCount = kaveryStatelessBean.getNewlyRegisteredHorseMembersMemTypeWise(startDate, endDate);
               
                                     if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                     if(graph[i].equalsIgnoreCase("pie")) 
                        {    
                    
                // Pie Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.createMemTypeWiseNewHorseMembersPie(newlyRegHorseMemberCount);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("chart")) 
                        {
                     
                //Bar Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartBar = BarGraph.createMemTypeWiseNewHorseMembersBar(newlyRegHorseMemberCount);
                BarGraph.generateBarGraphImage(chartBar, realPath);
                     }
                      else if(graph[i].equalsIgnoreCase("Linechart")) 
                        {
                // Line Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createMemTypeWiseNewHorseMembersLine(newlyRegHorseMemberCount);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                      }
                      else if(graph[i].equalsIgnoreCase("PyramidChart")){
                // Pyramid Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPyramid = PyramidGraph.createMemTypeWiseNewHorseMembersPyramid(newlyRegHorseMemberCount);
                PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                      }
                    }
                    request.setAttribute("graphsCount",graphNew);
                    return new ModelAndView("generateNewlyRegHorseCountMembership");
                                     }
                                     else
                                     {
                                     List list=new ArrayList();
                                     Set horse=newlyRegHorseMemberCount.keySet();
                for(Iterator it=horse.iterator();it.hasNext();)
                {
                String status_name=(String)it.next();
                String total= (String)newlyRegHorseMemberCount.get(status_name);
                EventsYearWise yr=new EventsYearWise();
                        yr.setYear(status_name);
                        yr.setCount(Integer.parseInt(total));
                        list.add(yr);
                Debug.print("Status-Name "+status_name);
                Debug.print("Total  For"+" "+total);
                }
                                     session.setAttribute("demo",list);
                                     return new ModelAndView("newlyRegHorseMembersMeberShipWiseTabular");
                                     }
            }
                if(process.equalsIgnoreCase("HorseMembersEventCompetitionsWise"))
             {
                String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");
                    String fromDate = request.getParameter("fromDate");
                String[] fromDateArray = fromDate.split("-");
                String fromYear = fromDateArray[2];
                int fromYearVal = Integer.parseInt(fromYear);



                String toDate = request.getParameter("toDate");
                String[] toDateArray = toDate.split("-");
                String toYear = toDateArray[2];
                int toYearVal = Integer.parseInt(toYear);
                Date startDate = null;

                if (fromDate != null && fromDate.trim().length() != 0) {
                    try {
						startDate = (Date) sdf.parse(fromDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + startDate);
                }
                Date endDate = null;

                if (toDate != null && toDate.trim().length() != 0) {
                    try {
						endDate = (Date) sdf.parse(toDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + endDate);
                }
                String[] years = null;
                int diff = toYearVal - fromYearVal;
                if (diff == 0) {
                    years = new String[1];
                    years[0] = fromYear;
                } else if (diff > 0) {
                    years = new String[diff + 1];
                    years[0] = fromYear;
                    for (int i = 1; i <= diff; i++) {
                        fromYearVal = fromYearVal + 1;
                        years[i] = Integer.toString(fromYearVal);

                    }
                }

                HashMap HorseMemberCountEventWise = kaveryStatelessBean.getNumberofHorseEventWise(startDate, endDate, years);
                int size = HorseMemberCountEventWise.size();
                String yearCount = Integer.toString(size);
                                      if(view.equalsIgnoreCase("1"))
                {
                    if(size>1){                      
                    for(int i=0;i<graph.length;i++)
                    {
                     if(graph[i].equalsIgnoreCase("pie")) 
                        {    // Pie Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartPie = PieGraph.createEventsWiseHorseMembersPie(HorseMemberCountEventWise);
                    PieGraph.generatePieGraphImage(chartPie, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("chart")) {
                    //Bar Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartBar = BarGraph.createEventsWiseHorseMembersBar(HorseMemberCountEventWise);
                    BarGraph.generateBarGraphImage(chartBar, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("Linechart")) {
                    // Line Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartLine = LineGraph.createEventsWiseHorseMembersLine(HorseMemberCountEventWise);
                    LineGraph.generateLineGraphImage(chartLine, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("PyramidChart")){
                    // Pyramid Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartPyramid = PyramidGraph.createEventsWiseHorseMembersPyramid(HorseMemberCountEventWise);
                    PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                     }
                     }
                    }
                    else {

                    Set horse = HorseMemberCountEventWise.keySet();
                    String year = null;
                    String total = null;
                    for (Iterator it = horse.iterator(); it.hasNext();) {
                        year = (String) it.next();
                        total = (String) HorseMemberCountEventWise.get(year);
                    }
                    for(int i=0;i<graph.length;i++)
                    {
                     if(graph[i].equalsIgnoreCase("plotformat")) 
                        {
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartPlotFormat = PlotFormat.createHorseMembersEventsPlotFormatGraph(total, year);
                    PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("chart")){
                    //Bar Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartBar = BarGraph.createEventsWiseHorseMembersForOneYearBar(HorseMemberCountEventWise);
                    BarGraph.generateBarGraphImage(chartBar, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("tube")) {
                    // Tube Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartTube = TubeGraph.createHorseMembersEventsTube(total, year);
                    TubeGraph.generateTubeGraphImage(chartTube, realPath);
                     }
                      else if(graph[i].equalsIgnoreCase("cone")) {
                    // Cone Chart Generation
                    BIRTGraphsConfig.initializeDesignConfig(context);
                    Chart chartCone = ConeGraph.createHorseMembersEventsCone(total, year);
                    ConeGraph.generateConeGraphImage(chartCone, realPath);
                      }
                    }
                }
                     request.setAttribute("yearCount", yearCount);
                    request.setAttribute("graphsCount",graphNew);
                    request.setAttribute("StartDate",fromDate);
                       request.setAttribute("EndDate",toDate);
                       return new ModelAndView("generateHorseMembersYearlyEvents");
                 }
                                      else // For tabular view
                                      {
                    List list=new ArrayList();
                                    Set horse = HorseMemberCountEventWise.keySet();
                                    for (Iterator it = horse.iterator(); it.hasNext();) {
                                        String year = (String) it.next();
                                        String total = (String) HorseMemberCountEventWise.get(year);
                                        EventsYearWise yr=new EventsYearWise();
                        yr.setYear(year);
                        yr.setCount(Integer.parseInt(total));
                        list.add(yr);
                    }              
                                    session.setAttribute("demo",list);
                                    session.setAttribute("StartDate",fromDate);
                                     session.setAttribute("EndDate",toDate);
                                     return new ModelAndView("HorseMembersYearlyEventsWiseTabular");
                                      }
                }


if (process.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise")) {
    String view=request.getParameter("view");
                        Debug.print("view value is "+view);
                        String graphNew=request.getParameter("graph");
                        String graph[]=graphNew.split(",");            
    String fromDate = request.getParameter("fromDate");
                Date startDate = null;

                if (fromDate != null && fromDate.trim().length() != 0) {
                    try {
						startDate = (Date) sdf.parse(fromDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + startDate);
                }

                String toDate = request.getParameter("toDate");
                Date endDate = null;

                if (toDate != null && toDate.trim().length() != 0) {
                    try {
						endDate = (Date) sdf.parse(toDate);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
                    Debug.print("startDate in servlet" + endDate);
                }
                HashMap horseMembersEventsMembershipWise = kaveryStatelessBean.getHorseMembersEventsMembershipWise(startDate, endDate);
                /*Set horse=horseMembersCountStatusWise.keySet();
                for(Iterator it=horse.iterator();it.hasNext();)
                {
                String status_name=(String)it.next();
                String total= (String)horseMembersCountStatusWise.get(status_name);
                Debug.print("Status-Name "+status_name);
                Debug.print("Total  For"+" "+total);
                }*/
                       if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                     if(graph[i].equalsIgnoreCase("pie")) 
                        {    
                // Pie Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.createMembershipWiseHorseMembersEventPie(horseMembersEventsMembershipWise);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("chart")){
                //Bar Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartBar = BarGraph.createMembershipWiseHorseMembersEventsBar(horseMembersEventsMembershipWise);
                BarGraph.generateBarGraphImage(chartBar, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("Linechart")){
                // Line Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createMembershipWiseHorseMembersEventsLine(horseMembersEventsMembershipWise);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                     }
                     else if(graph[i].equalsIgnoreCase("PyramidChart")){
                // Pyramid Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPyramid = PyramidGraph.createMembershipWiseHorseMembersEventsPyramid(horseMembersEventsMembershipWise);
                PyramidGraph.generatePyramidGraphImage(chartPyramid, realPath);
                     }
                    }
                    request.setAttribute("graphsCount",graphNew);
                    request.setAttribute("StartDate",fromDate);
                                     request.setAttribute("EndDate",toDate);
                                     return new ModelAndView("generateHorseMembersEventsMembershipsWise");
                       }
                       else
                       {
                    List list=new ArrayList();
                      Set horse=horseMembersEventsMembershipWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersEventsMembershipWise.get(membership_name);
                                      EventsYearWise yr=new EventsYearWise();
                        yr.setYear(membership_name);
                        yr.setCount(Integer.parseInt(total));
                        list.add(yr);
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
                      session.setAttribute("demo",list);
                      session.setAttribute("StartDate",fromDate);
                      session.setAttribute("EndDate",toDate);
                      return new ModelAndView("horseMembersEventsMembershipWiseTabular");
                       }
            }


        }
        return null;
    }
		private ServletContext context;

		public void setServletContext(ServletContext servletContext) {
		     this.context = servletContext;
		}
}
