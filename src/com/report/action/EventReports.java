/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.report.action;

/**
 *
 * @author parteek
 */
import com.hlcform.stateless.HLCkaverystatelessBean;

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

import com.oee.action.EventsYearWise;
import com.oee.action.HumanMembersEventsParticipated;
import com.util.BIRTGraphsConfig;
import com.birt.graphs.BarGraph;
import com.birt.graphs.BarMarkerRangeGraph;
import com.birt.graphs.ConeGraph;
import com.birt.graphs.LineGraph;
import com.birt.graphs.PieGraph;
import com.birt.graphs.PlotFormat;
import com.birt.graphs.PyramidGraph;
import com.birt.graphs.TubeGraph;
import com.hlcmro.org.HLCVaigaiSessionBean;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.birt.chart.model.Chart;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


	public class EventReports implements Controller {

		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
     	
        HttpSession session = request.getSession();
        HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();
        HLCkaverystatelessBean humanMembBean=new HLCkaverystatelessBean();
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
        
        ServletContext context = request.getSession().getServletContext();
        //String realwebpath="/images";
        String realPath = context.getRealPath("/")+ "images/"; 
        String process = request.getParameter("process");
        Debug.print("Process is " + process);
        if (process != null) {
            if (process.equalsIgnoreCase("eventsYearWise")) {
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
                int fromYear = startDate.getYear() + 1900;
                int toYear = endDate.getYear() + 1900;
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList yearlyEvents = vaigaiBean.getEventsConductedYearWise(fromYear, toYear);
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {
                        //Bar Marker
                        if (graph[i].equalsIgnoreCase("barMarker")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart barMarker = BarMarkerRangeGraph.generateTotalEventsYearWiseBarMarkerRangeGraph(yearlyEvents);
                            BarMarkerRangeGraph.generateBarMarkerRangeGraphImage(barMarker, realPath);
                        } // Pie Chart Generation
                        else if (graph[i].equalsIgnoreCase("pie")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartPie = PieGraph.generateTotalEventsYearWisePie(yearlyEvents);
                            PieGraph.generatePieGraphImage(chartPie, realPath);
                        } // PLot Format Chart Generation
                        else if (graph[i].equalsIgnoreCase("plotformat")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(yearlyEvents);
                            PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        } // Tube Chart Generation
                        else if (graph[i].equalsIgnoreCase("tube")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(yearlyEvents);
                            TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                    request.setAttribute("title", "Number of Events Conducted Year Wise");
                      request.setAttribute("graphsCount",graphNew);
                      return new ModelAndView("generateYearlyEventsReports");
                } else {
                    List list = new ArrayList();
                    for (int i = 0; i < yearlyEvents.size(); i++) {
                        HashMap eventsYearWise = (HashMap) yearlyEvents.get(i);
                        Set human = eventsYearWise.keySet();
                        for (Iterator it = human.iterator(); it.hasNext();) {
                            String year_name = (String) it.next();
                            Double total = (Double) eventsYearWise.get(year_name);
                            EventsYearWise yearWise = new EventsYearWise();
                            yearWise.setYear(year_name);
                            yearWise.setCount(total.intValue());
                            list.add(yearWise);

                        }
                    }
                    session.setAttribute("reportTitle", "Number of Events Conducted Year Wise");
                    session.setAttribute("demo", list);
                    return new ModelAndView("generateYearlyEventsTabularReports");
                }

            } else if (process.equalsIgnoreCase("eventsAreaWise")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList areaWiseEvents = vaigaiBean.getEventsConductedAreaWise(startDate, endDate);
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("barMarker")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart barMarker = BarMarkerRangeGraph.generateTotalEventsYearWiseBarMarkerRangeGraph(areaWiseEvents);
                            BarMarkerRangeGraph.generateBarMarkerRangeGraphImage(barMarker, realPath);
                        } // Pie Chart Generation
                        else if (graph[i].equalsIgnoreCase("pie")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartPie = PieGraph.generateTotalEventsYearWisePie(areaWiseEvents);
                            PieGraph.generatePieGraphImage(chartPie, realPath);
                        } // PLot Format Chart Generation
                        else if (graph[i].equalsIgnoreCase("plotformat")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(areaWiseEvents);
                            PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        } // Tube Chart Generation
                        else if (graph[i].equalsIgnoreCase("tube")) {
                            BIRTGraphsConfig.initializeDesignConfig(context);
                            Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(areaWiseEvents);
                            TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                    request.setAttribute("title", "Number of Events Conducted Area Wise");
                      request.setAttribute("graphsCount",graphNew);
                      return new ModelAndView("generateYearlyEventsReports");
                } else {
                    List list = new ArrayList();
                    for (int i = 0; i < areaWiseEvents.size(); i++) {
                        HashMap eventsYearWise = (HashMap) areaWiseEvents.get(i);
                        Set human = eventsYearWise.keySet();
                        for (Iterator it = human.iterator(); it.hasNext();) {
                            String year_name = (String) it.next();
                            Double total = (Double) eventsYearWise.get(year_name);
                            EventsYearWise yearWise = new EventsYearWise();
                            yearWise.setYear(year_name);
                            yearWise.setCount(total.intValue());
                            list.add(yearWise);

                        }
                    }
                    session.setAttribute("demo", list);
                    session.setAttribute("reportTitle", "Number of Events Conducted Area Wise");
                    return new ModelAndView("eventAreaWiseTabular");
                }
            }
                else  if (process.equalsIgnoreCase("eventsTypeWise")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList typeWiseEvents = vaigaiBean.getEventsConductedTypeWise(startDate, endDate);
               
                 if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("barMarker")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart barMarker = BarMarkerRangeGraph.generateTotalEventsYearWiseBarMarkerRangeGraph(typeWiseEvents);
                BarMarkerRangeGraph.generateBarMarkerRangeGraphImage(barMarker, realPath);
                        }
                        
                // Pie Chart Generation
                        else if (graph[i].equalsIgnoreCase("pie")){
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.generateTotalEventsYearWisePie(typeWiseEvents);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                // PLot Format Chart Generation
                        else if (graph[i].equalsIgnoreCase("plotformat")){
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(typeWiseEvents);
                PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        }
                // Tube Chart Generation
                        else if (graph[i].equalsIgnoreCase("tube")){
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(typeWiseEvents);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                request.setAttribute("title", "Number of Events Conducted Type Wise");
                 request.setAttribute("graphsCount",graphNew);
                 return new ModelAndView("generateYearlyEventsReports");
                 }
                 else
                 {
                     List list = new ArrayList();
                    for (int i = 0; i < typeWiseEvents.size(); i++) {
                        HashMap eventsYearWise = (HashMap) typeWiseEvents.get(i);
                        Set human = eventsYearWise.keySet();
                        for (Iterator it = human.iterator(); it.hasNext();) {
                            String year_name = (String) it.next();
                            Double total = (Double) eventsYearWise.get(year_name);
                            EventsYearWise yearWise = new EventsYearWise();
                            yearWise.setYear(year_name);
                            yearWise.setCount(total.intValue());
                            list.add(yearWise);

                        }
                    }
                    session.setAttribute("demo", list);
                    request.setAttribute("reportTitle", "Number of Events Conducted Type Wise");
                    return new ModelAndView("eventsTypeWiseTabular");
                 }

            } else if (process.equalsIgnoreCase("eventsAreaWiseForEventType")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                String eventTypeId = request.getParameter("eventType");
                String eventTypeName = null;
                if (eventTypeId.equalsIgnoreCase("b2b77c0b-ffe0-484b-9d77-1e4ebe3d7517")) {
                    eventTypeName = "YEH";
                } else if (eventTypeId.equalsIgnoreCase("2833a332-3af3-4d98-b8fc-46263448385d")) {
                    eventTypeName = "TEST";
                } else if (eventTypeId.equalsIgnoreCase("90afd446-d139-44c5-8f37-4eec8358eb1e")) {
                    eventTypeName = "HT";
                } else if (eventTypeId.equalsIgnoreCase("445c7c02-49fe-402f-a1cf-ac1fb3e51d77")) {
                    eventTypeName = "3D";
                } else if (eventTypeId.equalsIgnoreCase("6845ba45-ab6c-48c3-964c-b3c7a6571513")) {
                    eventTypeName = "CT";
                } else if (eventTypeId.equalsIgnoreCase("1eb79456-e38e-4e04-b67d-b7296c5ce64b")) {
                    eventTypeName = "FEH";
                } else if (eventTypeId.equalsIgnoreCase("ac6e6d2a-c80a-4fce-8fa0-d02d087fb118")) {
                    eventTypeName = "2D";
                }
                ArrayList eventType = vaigaiBean.getEventsConductedAreaWiseSpecificEventType(startDate, endDate, eventTypeId);
               
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("Linechart")) {
                //Line Graph 
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createEventsAreaWiseForEventTypeLine(eventType);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                // PLot Format Chart Generation
                        else if (graph[i].equalsIgnoreCase("plotformat")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(eventType);
                PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        }
                // Pie Chart Generation
                        else if (graph[i].equalsIgnoreCase("pie")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.generateTotalEventsYearWisePie(eventType);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                // Tube Chart Generation
                        else if (graph[i].equalsIgnoreCase("tube")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(eventType);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                request.setAttribute("title", "Number of Events Conducted Area Wise For " + eventTypeName + " Event Type");
                 request.setAttribute("graphsCount",graphNew);
                 return new ModelAndView("generateEventsAreaWiseForEventType");
                    }
                else
                {
                      List list = new ArrayList();
                    for(int i=0;i<eventType.size();i++)
                        {
                             
                        HashMap evnetsYearly=(HashMap)eventType.get(i);
                              Set human=evnetsYearly.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String area_name=(String)it.next();
                                      Double total= (Double)evnetsYearly.get(area_name);
                                       EventsYearWise yearWise = new EventsYearWise();
                                        yearWise.setYear(area_name);
                                        yearWise.setCount(total.intValue());
                                        list.add(yearWise);
                                      
                            }
                        } 
                    session.setAttribute("demo", list);
                    session.setAttribute("reportTitle", "Number of Events Conducted Area Wise For " + eventTypeName + " Event Type");
                    return new ModelAndView("eventAreaWiseTabular");
                }

            } else if (process.equalsIgnoreCase("humanMembersParticipatedInEvents")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                Double count = vaigaiBean.getHumanMembersParticipatedInEvents(startDate, endDate);
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("plotformat")) {
                // PLot Format Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotChart = PlotFormat.createHumanMembersParticipatedInEventsPlotFormat(count);
                PlotFormat.generatePlotFormatGraphImage(chartPlotChart, realPath);
                        }
                // Tube Chart Generation
                         else if (graph[i].equalsIgnoreCase("tube")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.createHumanMembersParticipatedInEventsTube(count);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                         }
                //Pyramid Chart Generation
                         else if (graph[i].equalsIgnoreCase("PyramidChart")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart pyramidChart = PyramidGraph.createHumanMembersParticipatedInEventsPyramid(count);
                PyramidGraph.generatePyramidGraphImage(pyramidChart, realPath);
                         }
                //Cone Graph Generation
                        else if (graph[i].equalsIgnoreCase("cone")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartCone = ConeGraph.createHumanMembersParticipatedInEventsCone(count);
                ConeGraph.generateConeGraphImage(chartCone, realPath);
                        }
                    }
                request.setAttribute("graphsCount",graphNew);
                request.setAttribute("title", "Number of Human Members Participated in Event Competitions");
                return new ModelAndView("generateHumanMembersParticipatedInEvents");
                }
                else
                {
                     List list = new ArrayList();
                     HumanMembersEventsParticipated part=new HumanMembersEventsParticipated();
                     part.setEventsConducted(count.intValue());
                     list.add(part);
                     session.setAttribute("demo", list);
                     session.setAttribute("reportTitle", "Number of Human Members Participated in Event Competitions");
                     return new ModelAndView("humanMembersParticipatedInEventsTabular");
                }

            } else if (process.equalsIgnoreCase("getHumanMembersParticipatedAreaWise")) {
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
                 String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList count = vaigaiBean.getHumanMemeberParticipatedAreaWise(startDate, endDate);
                
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("plotformat")) {
                //plot Format Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(count);
                PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        }
                //Line Format Generation
                        else if (graph[i].equalsIgnoreCase("Linechart")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createEventsAreaWiseForEventTypeLine(count);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                }
                // 
                // Pie Chart Generation
                   else if (graph[i].equalsIgnoreCase("pie")) {      
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.generateTotalEventsAreawise(count);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                   }
                // Tube Chart Generation
                        else if (graph[i].equalsIgnoreCase("tube")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(count);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                request.setAttribute("graphsCount",graphNew);
                request.setAttribute("title", "Number of Human Members Participated in Event Competitions Area Wise");
                return new ModelAndView("generateEventsAreaWiseForEventType");
                }
                else
                {
                    List list = new ArrayList();
                    for(int i=0;i<count.size();i++)
                        {
                             
                        HashMap evnetsYearly=(HashMap)count.get(i);
                              Set human=evnetsYearly.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String area_name=(String)it.next();
                                      Double total= (Double)evnetsYearly.get(area_name);
                                       EventsYearWise yearWise = new EventsYearWise();
                                        yearWise.setYear(area_name);
                                        yearWise.setCount(total.intValue());
                                        list.add(yearWise);
                                      
                            }
                        } 
                    session.setAttribute("demo", list); 
                    session.setAttribute("reportTitle", "Number of Human Members Participated in Event Competitions Area Wise");
                    return new ModelAndView("eventsAreaWiseForEventTypeTabular");
                    
                }


            } else if (process.equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships") || process.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                ArrayList humanCount = null;
                if (process.equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships")) {
                    humanCount = vaigaiBean.getHumanMembersParticipatedForAllHumanMemberships(startDate, endDate);
                } else if (process.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) {
                    humanCount = vaigaiBean.getHumanMembersParticipatedEventTypeWise(startDate, endDate);
                }
                 if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("Linechart")) {
                //Line Graph 
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createEventsAreaWiseForEventTypeLine(humanCount);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                // PLot Format Chart Generation
                        else if (graph[i].equalsIgnoreCase("plotformat")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(humanCount);
                PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                         }
                // Pie Chart Generation
                     else if (graph[i].equalsIgnoreCase("pie")) {    
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.generateTotalEventsYearWisePie(humanCount);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                     }
                // Tube Chart Generation
                         else if (graph[i].equalsIgnoreCase("tube")) {
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(humanCount);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                         }
                    }
                if (process.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) {
                    request.setAttribute("title", "Number of Human Members Participated in Events For All Events Type");
                } else {
                    request.setAttribute("title", "Number of Human Members Participated in Events For All Memberships");
                }
                    request.setAttribute("graphsCount",graphNew);
                    return new ModelAndView("generateEventsAreaWiseForEventType");
                 }
                 else
                 {
                    List list = new ArrayList();
                    for(int i=0;i<humanCount.size();i++)
                        {
                              HashMap eventsYearWise=(HashMap)humanCount.get(i);
                              Set human=eventsYearWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String year_name=(String)it.next();
                                      Double total= (Double)eventsYearWise.get(year_name);
                                      EventsYearWise yearWise=new EventsYearWise();
                                      
                                      yearWise.setYear(year_name);
                                      yearWise.setCount(total.intValue());
                                      list.add(yearWise);
                            }
                        }
                    session.setAttribute("demo",list);
                    if (process.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")) {
                    session.setAttribute("reportTitle", "Number of Human Members Participated in Events For All Events Type");
                    return new ModelAndView("getHumanMembersParticipatedEventTypeWiseTabular");
                } else {
                    session.setAttribute("reportTitle", "Number of Human Members Participated in Events For All Memberships");
                    return new ModelAndView("getHumanMembersParticipatedMembershipsWiseTabular");
                }
                    
                 }
            } else if (process.equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")) {
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
                String view = request.getParameter("view");
                Debug.print("view value is " + view);
                String graphNew = request.getParameter("graph");
                String graph[] = graphNew.split(",");
                String areaId = request.getParameter("area");
                System.out.println("Area id" + areaId);
                ArrayList mambership = vaigaiBean.getHumanMemberParticipatedMembeAreaWise(startDate, endDate, areaId);
                for (int i = 0; i < mambership.size(); i++) {
                    HashMap typeWise = (HashMap) mambership.get(i);
                    Set type = typeWise.keySet();
                    for (Iterator it = type.iterator(); it.hasNext();) {
                        String area_Name = (String) it.next();
                        Double db = (Double) typeWise.get(area_Name);
                        Debug.print("membership  Type Name is:" + area_Name + "  Count is " + db.doubleValue());
                    }
                }             
                if (view.equalsIgnoreCase("1")) {
                    for (int i = 0; i < graph.length; i++) {

                        if (graph[i].equalsIgnoreCase("Linechart")) {
                //Line Graph 
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartLine = LineGraph.createEventsAreaWiseForEventTypeLine(mambership);
                LineGraph.generateLineGraphImage(chartLine, realPath);
                        }
                        else  if (graph[i].equalsIgnoreCase("plotformat")) {
                // PLot Format Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPlotFormat = PlotFormat.generateTotalEventsYearWisePlotFormat(mambership);
                PlotFormat.generatePlotFormatGraphImage(chartPlotFormat, realPath);
                        }
                        else  if (graph[i].equalsIgnoreCase("pie")) {
                // Pie Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartPie = PieGraph.generateTotalEventsYearWisePie(mambership);
                PieGraph.generatePieGraphImage(chartPie, realPath);
                        }
                        else  if (graph[i].equalsIgnoreCase("tube")) {
                // Tube Chart Generation
                BIRTGraphsConfig.initializeDesignConfig(context);
                Chart chartTube = TubeGraph.generateTotalEventsYearWiseTube(mambership);
                TubeGraph.generateTubeGraphImage(chartTube, realPath);
                        }
                    }
                     request.setAttribute("graphsCount",graphNew);
                request.setAttribute("title", "Number of Human Members participated in the Event Competations Based on All Human Membership Types and area Wise");
                return new ModelAndView("generateEventsAreaWiseForEventType");
                }
                else
                {
                    List list = new ArrayList();
                    for (int i = 0; i < mambership.size(); i++) {
                    HashMap typeWise = (HashMap) mambership.get(i);
                    Set type = typeWise.keySet();
                    for (Iterator it = type.iterator(); it.hasNext();) {
                        String area_Name = (String) it.next();
                        Double db = (Double) typeWise.get(area_Name);
                         EventsYearWise yearWise=new EventsYearWise();
                                      yearWise.setYear(area_Name);
                                      yearWise.setCount(db.intValue());
                                      list.add(yearWise); 
                        Debug.print("membership  Type Name is:" + area_Name + "  Count is " + db.doubleValue());
                    }
                }   
                    session.setAttribute("demo",list);
                    session.setAttribute("reportTitle","Number of Human Members participated in the Event Competations Based on All Human Membership Types and area Wise");
                    return new ModelAndView("eventsAreaWiseForEventTypeTabular");
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

