/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.report.action;

import com.acc.action.TotalDonation;
import com.acc.action.TotalDonationAmountForAllDonationItems;
import com.birt.graphs.BarGraph;
import com.birt.graphs.BarMarkerRangeGraph;
import com.birt.graphs.ConeGraph;
import com.birt.graphs.PieGraph;
import com.birt.graphs.PlotFormat;
import com.birt.graphs.TubeGraph;
import com.hlcaccounts.util.Debug;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.session.HLCMahanadhiSessionRemote;
import com.hlcaccounts.session.HLCMahanadhiSessionRemoteHome;
import com.util.BIRTGraphsConfig;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.*;
import javax.xml.parsers.ParserConfigurationException;

import org.eclipse.birt.chart.model.Chart;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;
/**
 *
 * @author parteek
 */

	
	public class DonationReports implements Controller {
		
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
			
       HttpSession session = request.getSession();
      
         SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
         HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
        String realPath = context.getRealPath("/") + "images/";
     
            String process = request.getParameter("process");
            System.out.print("process function:" + process);

            if (process!=null || process.trim().length()> 0) {
                if(process.equalsIgnoreCase("totalDonationAmount"))
                {
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
                String view=request.getParameter("view");
                Debug.print("view value is "+view);
                String graphNew=request.getParameter("graph");
                String graph[]=graphNew.split(",");
                double totalDonation=mahanadhiBean.getTotalDonationAmount(startDate, endDate);
                if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                //PlotFormat Graph
                        if(graph[i].equalsIgnoreCase("plotformat"))
                        {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat=PlotFormat.createTotalDonationAmountPlotFormatGraph(totalDonation);
                 PlotFormat.generatePlotFormatGraphImage(chartPlotFormat,realPath);
                        }
                 //Bar Chart Generation
                        else if(graph[i].equalsIgnoreCase("chart")){
                 BIRTGraphsConfig.initializeDesignConfig(context);
                 Chart chartBar=BarGraph.createTotalDonationAmountBar(totalDonation);
                 BarGraph.generateBarGraphImage(chartBar,realPath);
                        }
                 // Tube Chart Generation
                        else if(graph[i].equalsIgnoreCase("tube"))
                        {
                 BIRTGraphsConfig.initializeDesignConfig(context);
                 Chart chartTube = TubeGraph.createTotalDonationAmountTube(totalDonation);
                  TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                   // Cone Chart Generation
                        else if(graph[i].equalsIgnoreCase("cone"))
                        {
                   BIRTGraphsConfig.initializeDesignConfig(context);
                   Chart chartCone = ConeGraph.createTotalDonationAmountCone(totalDonation);
                   ConeGraph.generateConeGraphImage(chartCone, realPath);
                        }
                    }
                   request.setAttribute("totalDonationAmount","Total Donation Report");
                   request.setAttribute("graphsCount",graphNew);
                   return new ModelAndView("generateDonationAmountReport");
                }
                else //For tabular view ...
                {
                   
                    List list = new ArrayList();
                    TotalDonation total=new TotalDonation();
                    total.setDonationAmount(totalDonation);
                    list.add(total);
                    session.setAttribute("demo", list);
                    return new ModelAndView("totalDonationAmountTabular");
                    
                }
                }
                if(process.equalsIgnoreCase("totalDonationAmountForAllDonationItems"))
                {
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
                String view=request.getParameter("view");
                Debug.print("view value is "+view);
                String graphNew=request.getParameter("graph");
                String graph[]=graphNew.split(",");
                Debug.print("Array length"+graph.length);
                ArrayList totalDonationAmountForAllDonationItems=mahanadhiBean.getTotalDonationAmountForAllDonationItems(startDate,endDate);
                 if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                 //Bar Marker Range Chart Generation
                        if(graph[i].equalsIgnoreCase("barMarker")) {
                        BIRTGraphsConfig.initializeDesignConfig(context);
                       Chart barMarker=BarMarkerRangeGraph.generateTotalDonationAmountForAllDonationItemsBarMarker(totalDonationAmountForAllDonationItems);
                       BarMarkerRangeGraph.generateBarMarkerRangeGraphImage(barMarker,realPath);
                        }
                       // Pie Chart Generation
                        else if(graph[i].equalsIgnoreCase("pie")) {
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartPie =PieGraph.generateTotalDonationAmountForAllDonationItemsPie(totalDonationAmountForAllDonationItems);
                         PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                          // PLot Format Chart Generation
                         else if(graph[i].equalsIgnoreCase("plotformat")) {
                         BIRTGraphsConfig.initializeDesignConfig(context);
                         Chart chartPlotFormat =PlotFormat.generateTotalDonationAmountForAllDonationItemsPlotFormat(totalDonationAmountForAllDonationItems);
                         PlotFormat.generatePlotFormatGraphImage(chartPlotFormat,realPath);
                         }
                         // Tube Chart Generation
                         else if(graph[i].equalsIgnoreCase("tube")) { 
                        BIRTGraphsConfig.initializeDesignConfig(context);
                        Chart chartCone = ConeGraph.generateTotalDonationAmountForAllDonationItemsCone(totalDonationAmountForAllDonationItems);
                        ConeGraph.generateConeGraphImage(chartCone, realPath);
                         }
                    }
                    request.setAttribute("graphsCount",graphNew);    
                    return new ModelAndView("generateDonationAmountForAllDonationItemsReport");
                 }
                 else{
                     List list = new ArrayList();
                    for (int i = 0; i < totalDonationAmountForAllDonationItems.size(); i++) {
                        HashMap typeWise = (HashMap) totalDonationAmountForAllDonationItems.get(i);
                        Set type = typeWise.keySet();
                        for (Iterator it = type.iterator(); it.hasNext();) {
                            String item_Name = (String) it.next();
                            Double db = (Double) typeWise.get(item_Name);
                            Debug.print("Donation Name " + item_Name + "  Count is " + db.doubleValue());
                            TotalDonationAmountForAllDonationItems item = new TotalDonationAmountForAllDonationItems();
                            item.setDonationItem(item_Name);
                            item.setDonatioAmount(db);
                            list.add(item);

                        }
                    }
                    session.setAttribute("demo", list);
                    return new ModelAndView("totalDonationAmountForAllDonationItemsTabular"); 
                 }
                }
                if(process.equalsIgnoreCase("totalDonationAmountSpecificDonationItem"))
                {
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
                String view=request.getParameter("view");
                Debug.print("view value is "+view);
                String graphNew=request.getParameter("graph");
                String graph[]=graphNew.split(",");
                Debug.print("Array length"+graph.length);
                String donation=request.getParameter("donation");
                String donation_Name=null;
                if(donation.equalsIgnoreCase("45EC7062-331D-4A66-B238-0FA089EB96F2"))
                    donation_Name="American Eventing Championships";
                else if(donation.equalsIgnoreCase("6B90B723-BF7F-477E-AEFE-221FC854CB15"))
                    donation_Name="Website Development";
                else if(donation.equalsIgnoreCase("FBFDE420-7821-451E-A543-61FDFD0423C8"))
                    donation_Name="Young Event Horse Series";
                else if(donation.equalsIgnoreCase("0D13941A-AED5-48C2-A4E4-62F9AB0931EE"))
                    donation_Name="Equine Welfare";
                else if(donation.equalsIgnoreCase("15CE0E55-F08D-4015-A0A1-72DC3D1AF24A"))
                    donation_Name="Course Advisors";
                else if(donation.equalsIgnoreCase("37C76742-61C5-4B2C-A9BE-79F55B9701A5"))
                    donation_Name="USEA Endowment Trust";
                else if(donation.equalsIgnoreCase("4420D3F7-681E-4F34-B160-83511BA0A7F3"))
                    donation_Name="Equine Cardiovascular Research Study";
                else if(donation.equalsIgnoreCase("F05229DE-4B74-4A79-90F4-9DF678333791"))
                    donation_Name="Instructor's Certification Program";
                else if(donation.equalsIgnoreCase("41377139-E437-47C5-8B4A-A7A135646057"))
                    donation_Name="Future Event Horse Series";
                else if(donation.equalsIgnoreCase("64D9034E-D51E-4D3F-BBD1-D2362B0F3890"))
                    donation_Name="GPS Speed Study";
                else if(donation.equalsIgnoreCase("B5C2EE43-CD53-427E-838B-D698064DCA96"))
                    donation_Name="Course Design Ed. (x-c and show jumping)";
                else if(donation.equalsIgnoreCase("3DCF09CD-983E-4960-82CC-D7E5AC6182C6"))
                    donation_Name="Eventing Hall of Fame";
                else if(donation.equalsIgnoreCase("E01A26E2-F14E-4F06-B676-EAC4B870A2A5"))
                    donation_Name="Officials Training and Continuing Ed.";
                else if(donation.equalsIgnoreCase("C6D20647-FA23-4A2B-9D01-EC13D8A8A50C"))
                    donation_Name="Gold Cup Series";
                double donationAmountSpecificDonationItem=mahanadhiBean.getDonationAmountSpecificDonationItem(startDate,endDate,donation);
                 //PlotFormat Graph
                 if(view.equalsIgnoreCase("1"))
                {
                    for(int i=0;i<graph.length;i++)
                    {
                        
                         if(graph[i].equalsIgnoreCase("plotformat")){
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat=PlotFormat.createTotalDonationAmountPlotFormatGraph(donationAmountSpecificDonationItem);
                 PlotFormat.generatePlotFormatGraphImage(chartPlotFormat,realPath);
                                }
                 //Bar Chart Generation
                                     else if(graph[i].equalsIgnoreCase("chart")) {
                 BIRTGraphsConfig.initializeDesignConfig(context);
                 Chart chartBar=BarGraph.createTotalDonationAmountBar(donationAmountSpecificDonationItem);
                 BarGraph.generateBarGraphImage(chartBar,realPath);
                                     }
                 // Tube Chart Generation
                      else if(graph[i].equalsIgnoreCase("tube")){
                 BIRTGraphsConfig.initializeDesignConfig(context);
                 Chart chartTube = TubeGraph.createTotalDonationAmountTube(donationAmountSpecificDonationItem);
                  TubeGraph.generateTubeGraphImage(chartTube, realPath);
                    }
                   // Cone Chart Generation
                    else if(graph[i].equalsIgnoreCase("cone")){
                   BIRTGraphsConfig.initializeDesignConfig(context);
                   Chart chartCone = ConeGraph.createTotalDonationAmountCone(donationAmountSpecificDonationItem);
                   ConeGraph.generateConeGraphImage(chartCone, realPath);
                                }
                    }
                   request.setAttribute("totalDonationAmount","Total Donation Report For "+donation_Name);
                   request.setAttribute("graphsCount",graphNew); 
                   return new ModelAndView("generateDonationAmountReport");
                 
                 }
                 else
                 {
                    List list = new ArrayList();
                    TotalDonationAmountForAllDonationItems total=new TotalDonationAmountForAllDonationItems();
                    total.setDonationItem(donation_Name);
                    total.setDonatioAmount(new Double(donationAmountSpecificDonationItem));
                    list.add(total);
                    session.setAttribute("demo", list);
                    return new ModelAndView("totalDonationAmountForAllDonationItemsTabular");
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
