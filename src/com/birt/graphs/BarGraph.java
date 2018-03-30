/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.birt.graphs;
import com.hlcmrm.util.Debug;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.Vector;

import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.GeneratedChartState;
import org.eclipse.birt.chart.factory.Generator;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.Anchor;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.ChartDimension;
import org.eclipse.birt.chart.model.attribute.Image;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.Position;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
import org.eclipse.birt.chart.model.component.Axis;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.NumberDataSet;
import org.eclipse.birt.chart.model.data.SeriesDefinition;
import org.eclipse.birt.chart.model.data.TextDataSet;
import org.eclipse.birt.chart.model.data.impl.NumberDataSetImpl;
import org.eclipse.birt.chart.model.data.impl.SeriesDefinitionImpl;
import org.eclipse.birt.chart.model.data.impl.TextDataSetImpl;
import org.eclipse.birt.chart.model.impl.ChartWithAxesImpl;
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.layout.Plot;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.chart.util.PluginSettings;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.model.api.DesignConfig;
import org.eclipse.birt.report.model.api.IDesignEngine;
import org.eclipse.birt.report.model.api.IDesignEngineFactory;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
/**
 *
 * @author parteek
 */
public class BarGraph {
    
    public static Chart createBarGraph(ArrayList dailyPaymentDet,String year,String month)
    {
        //
         String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
         month=monthList[Integer.parseInt(month)-1];
        // BAR CHARTS ARE BASED ON CHARTS THAT CONTAIN AXES
	ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
               yAxisPrimary.getTitle( ).getCaption( ).setValue( "Daily Sales" );
	       yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        int i=1;
       for(Iterator it=dailyPaymentDet.iterator();it.hasNext();)
       {
            Double db= (Double)it.next();
            vs.add(new Integer(i));  // populating X Axis 
            vn1.add(db);              // populating Y Axis
            i=i+1;
       }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Sales Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }
    public static Chart createMonthlyBarGraph(ArrayList monthlyPaymentDet,String year)
    {
        //
         String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
         //month=monthList[Integer.parseInt(month)];
        // BAR CHARTS ARE BASED ON CHARTS THAT CONTAIN AXES
	ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
          yAxisPrimary.getTitle( ).getCaption( ).setValue( "Monthly Sales" );
	  yAxisPrimary.getTitle().setVisible(true);

	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        int i=0;
       for(Iterator it=monthlyPaymentDet.iterator();it.hasNext();)
       {
            Double db= (Double)it.next();
            vs.add(monthList[i]);   // populating X Axis 
            vn1.add(db);              // populating Y Axis
            i=i+1;
       }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Sales Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }

     public static Chart createAreaBarGraph(ArrayList areaAmount)
    {
        //
        // String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
         //month=monthList[Integer.parseInt(month)];
        // BAR CHARTS ARE BASED ON CHARTS THAT CONTAIN AXES
	ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                 yAxisPrimary.getTitle( ).getCaption( ).setValue( "Yearly Sales" );
	  yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        int i=0;String area=null;
       for(Iterator it=areaAmount.iterator();it.hasNext();)
       {
            Double db= (Double)it.next();
             if(i==1)
 area = "Area I";
  if(i==2)
 area = "Area II";
  if(i==3)
 area = "Area III"; 
 if(i==4)
 area = "Area IV";
  if(i==5)
 area = "Area V"; 
 if(i==6)
 area = "Area VI";
  if(i==7)
 area = "Area VII"; 
 if(i==8)
 area = "Area VIII";
  if(i==9)
 area = "Area IX";
  if(i==10)
 area = "Area X";
  if(i==11)
 area = "Area XI";
  
            vs.add(area);   // populating X Axis 
            vn1.add(db);              // populating Y Axis
            i=i+1;
       }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Sales Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }

    
    public static Chart createMemberShipSalesBar(ArrayList areaDet,String year){
               
        	ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
             
                  yAxisPrimary.getTitle( ).getCaption( ).setValue( "Sales" );
	  yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	//Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        ArrayList areaList = new ArrayList();
        String area=null;
        int i=1;
       for(Iterator it=areaDet.iterator();it.hasNext();)
       {
            Double db= (Double)it.next();
          //  vs.add(monthList[i]);   // populating X Axis 
            vn1.add(db);              // populating Y Axis
              
                            if(i==1)
                             area = "Junior Member";
                              if(i==2)
                             area = "Non-Competing Member";
                              if(i==3)
                             area = "Subscribing Member"; 
                             if(i==4)
                             area = "Family Member";
                              if(i==5)
                             area = "Full Member"; 
                             if(i==6)
                             area = "Life Member";
                       
                          areaList.add(area);
                     i=i+1;
       }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(areaList);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Sales Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
        
    }
    
    public static Chart createStatusWiseHumanMembersNumberBar(HashMap statusWiseHumanMembers)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
          yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
	  yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        
        Set human=statusWiseHumanMembers.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String status_name=(String)it.next();
                                      String total= (String)statusWiseHumanMembers.get(status_name);
                                      vs.add(status_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+status_name);
                                      Debug.print("Total  For"+" "+total);
                            }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Status");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }


     public static Chart createStatusWiseHorseMembersNumberBar(HashMap statusWiseHorseMembers)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                 yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
	         yAxisPrimary.getTitle().setVisible(true);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( " " );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set human=statusWiseHorseMembers.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String status_name=(String)it.next();
                                      String total= (String)statusWiseHorseMembers.get(status_name);
                                      vs.add(status_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+status_name);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Status");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }





    public static Chart createMembershipWiseHumanNumberByStatusBar(HashMap humanMembersMemberShips,String status)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND 
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position 

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        
        Set human=humanMembersMemberShips.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)humanMembersMemberShips.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
       
	
	
	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis    
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }

     public static Chart createMembershipWiseHorseNumberByStatusBar(HashMap horseMembersMemberShips,String status)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set horse=horseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersMemberShips.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }
     public static Chart createHorseMembersSpecificMembershipByStatusBar(String total,String membership_Name,String status_Name)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	""); // Title value

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);

	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
             ArrayList member_ship_name=new  ArrayList();
             member_ship_name.add(membership_Name);
      TextDataSet categoryValues = TextDataSetImpl.create(member_ship_name);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(Double.valueOf(total)); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
     }

     public static Chart createHumanMembersSpecificMembershipByStatusBar(String total,String membership_Name,String status_Name)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	""); // Title value

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);

	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA

         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
             ArrayList member_ship_name=new  ArrayList();
             member_ship_name.add(membership_Name);
      TextDataSet categoryValues = TextDataSetImpl.create(member_ship_name);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(Double.valueOf(total)); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
     }
     
     public static Chart createTotalHumanMembersAreaWiseBar(ArrayList totalHumanAreaWise)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        /*Set horse=horseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersMemberShips.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }*/
        for(int i=0;i<totalHumanAreaWise.size();i++)
                        {
                              HashMap humanMembersCountStatusWise=(HashMap)totalHumanAreaWise.get(i);
                              Set human=humanMembersCountStatusWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String area_name=(String)it.next();
                                      Double total= (Double)humanMembersCountStatusWise.get(area_name);
                                      vs.add(area_name);
                                      vn1.add(total);
                                      Debug.print("Area-Name "+area_name);
                                      Debug.print("Total  For"+" "+total.intValue());
                            }
                        }


	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
     }
 public static Chart createMemTypeWiseNewHorseMembersBar(HashMap newlyRegHorseMemberCount)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                 yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Horse Member" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set horse=newlyRegHorseMemberCount.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)newlyRegHorseMemberCount.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Membership Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }

public static Chart createEventsWiseHorseMembersBar(HashMap HorseMemberCountEventWise)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                 yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
		yAxisPrimary.getTitle().setVisible(true);

	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set horse=HorseMemberCountEventWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String year=(String)it.next();
                                      String total= (String)HorseMemberCountEventWise.get(year);
                                      vs.add(year); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Year "+year);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Years");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }

public static Chart createEventsWiseHorseMembersForOneYearBar(HashMap HorseMemberCountEventWise)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	"");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);

	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set horse=HorseMemberCountEventWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String year=(String)it.next();
                                      String total= (String)HorseMemberCountEventWise.get(year);
                                      vs.add(year); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Year "+year);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Year");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }
    public static Chart createHumanMembersSpecificAreaAndMembershipTypeBar(int total,String membership_Name,String area_name)
    {
       ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(
	""); // Title value

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
          yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA

         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
             ArrayList member_ship_name=new  ArrayList();
             member_ship_name.add(membership_Name+" in "+area_name);
      TextDataSet categoryValues = TextDataSetImpl.create(member_ship_name);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(Double.valueOf(total)); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar; 
    }

 public static Chart createMembershipWiseHorseMembersEventsBar(HashMap horseMembersEventsMembershipWise)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue("");

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();

        Set horse=horseMembersEventsMembershipWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersEventsMembershipWise.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }



	TextDataSet categoryValues = TextDataSetImpl.create(vs);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("MemberShip Series");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;
    }
    public static Chart createTotalDonationAmountBar(double total)
    {
      ChartWithAxes cwaBar = ChartWithAxesImpl.create();
	     cwaBar.getBlock().setBackground(
	ColorDefinitionImpl.create(239, 239, 217)
	);
	cwaBar.getBlock().getOutline().setVisible(true);
	cwaBar.setDimension(
	ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL
	);

	     // CUSTOMIZE THE PLOT
	Plot p = cwaBar.getPlot();
	p.getClientArea().setBackground(
	ColorDefinitionImpl.create(177, 177, 61)
	);
	p.getOutline().setVisible(false);
	cwaBar.getTitle().getLabel().getCaption().setValue(""); // Title value

	     // CUSTOMIZE THE LEGEND
	     Legend lg = cwaBar.getLegend();
	     lg.getText().getFont().setSize(16);
	     lg.getInsets().set(10, 5, 0, 0);
	     lg.setAnchor(Anchor.SOUTH_LITERAL); //Adjust the legend position

	     // CUSTOMIZE THE X-AXIS
	     Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
	     xAxisPrimary.setType(AxisType.TEXT_LITERAL);
	xAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.ABOVE_LITERAL
	);
	xAxisPrimary.getOrigin().setType(
	IntersectionType.VALUE_LITERAL
	);
	     xAxisPrimary.getTitle().setVisible(false);

	     // CUSTOMIZE THE Y-AXIS
	     Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(
	xAxisPrimary
	);
	yAxisPrimary.getMajorGrid().setTickStyle(
	TickStyle.RIGHT_LITERAL
	);
	yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
	        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Amount in $" );
		yAxisPrimary.getTitle().setVisible(true); 
	     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA

         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
             ArrayList donation=new  ArrayList();
             donation.add("Donations");
      TextDataSet categoryValues = TextDataSetImpl.create(donation);//set X axis
	NumberDataSet orthoValues1 = NumberDataSetImpl.create(Double.valueOf(total)); //sets Y axis

	// CREATE THE CATEGORY BASE SERIES
	Series seCategory = SeriesImpl.create();
	seCategory.setDataSet(categoryValues);

	// CREATE THE VALUE ORTHOGONAL SERIES
	BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
	bs1.setSeriesIdentifier("Donations");
	bs1.setDataSet(orthoValues1);
	bs1.setRiserOutline(null);
	bs1.getLabel().setVisible(true);
	bs1.setLabelPosition(Position.INSIDE_LITERAL);

	// WRAP THE BASE SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdX = SeriesDefinitionImpl.create();
	sdX.getSeriesPalette().update(0); // SET THE COLORS IN THE PALETTE
	xAxisPrimary.getSeriesDefinitions().add(sdX);
	sdX.getSeries().add(seCategory);

	// WRAP THE ORTHOGONAL SERIES IN THE X-AXIS SERIES DEFINITION
	SeriesDefinition sdY = SeriesDefinitionImpl.create();
	sdY.getSeriesPalette().update(1); // SET THE COLOR IN THE PALETTE
	yAxisPrimary.getSeriesDefinitions().add(sdY);
	sdY.getSeries().add(bs1);

	return cwaBar;  
    }
     public static void generateBarGraphImage(Chart cm,String path)
     {
         PluginSettings ps = PluginSettings.instance();
		IDeviceRenderer idr = null;
		try {
		idr = ps.getDevice("dv.PNG");
		} catch (ChartException pex)
		{
		DefaultLoggerImpl.instance().log(pex);
		}

		// DEFINE THE BOUNDS AND CONVERT INTO POINTS
		Bounds bo = BoundsImpl.create(0, 0, 500, 400); // IN PIXELS
		bo.scale(72d/idr.getDisplayServer().getDpiResolution()); // CONVERTED TO POINTS
		        
		// BUILD THE RENDERED CHART STRUCTURE
		Generator gr = Generator.instance();
		GeneratedChartState gcs = null;
		try {
		gcs = gr.build(
				idr.getDisplayServer(), 
		cm, null,
		bo, null
		);
		} catch (ChartException gex)
		{
		DefaultLoggerImpl.instance().log(gex);
		System.exit(0);
		}  
                // Get path 
               
		        
		// RENDER THE CHART TO A PNG FILE
		 new BufferedImage((int) bo.getWidth(), (int) bo.getHeight(), BufferedImage.TYPE_INT_ARGB);
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"chart.png");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
  System.out.println("Finished");

     }
}
