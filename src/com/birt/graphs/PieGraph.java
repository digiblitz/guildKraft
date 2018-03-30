/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.birt.graphs;

import com.hlcmrm.util.Debug;
import java.awt.image.BufferedImage;
import org.eclipse.birt.chart.util.PluginSettings;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Vector;
import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.GeneratedChartState;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithoutAxes;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.ChartDimension;
import org.eclipse.birt.chart.factory.Generator;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.BaseSampleData;
import org.eclipse.birt.chart.model.data.DataFactory;
import org.eclipse.birt.chart.model.data.NumberDataSet;
import org.eclipse.birt.chart.model.data.OrthogonalSampleData;
import org.eclipse.birt.chart.model.data.SampleData;
import org.eclipse.birt.chart.model.data.SeriesDefinition;
import org.eclipse.birt.chart.model.data.TextDataSet;
import org.eclipse.birt.chart.model.data.impl.NumberDataSetImpl;
import org.eclipse.birt.chart.model.data.impl.SeriesDefinitionImpl;
import org.eclipse.birt.chart.model.data.impl.TextDataSetImpl;
import org.eclipse.birt.chart.model.impl.ChartWithoutAxesImpl;
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.type.PieSeries;
import org.eclipse.birt.chart.model.type.impl.PieSeriesImpl;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithoutAxes;
import org.eclipse.birt.chart.model.attribute.ChartDimension;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.BaseSampleData;
import org.eclipse.birt.chart.model.data.DataFactory;
import org.eclipse.birt.chart.model.data.NumberDataSet;
import org.eclipse.birt.chart.model.data.OrthogonalSampleData;
import org.eclipse.birt.chart.model.data.SampleData;
import org.eclipse.birt.chart.model.data.SeriesDefinition;
import org.eclipse.birt.chart.model.data.TextDataSet;
import org.eclipse.birt.chart.model.data.impl.NumberDataSetImpl;
import org.eclipse.birt.chart.model.data.impl.SeriesDefinitionImpl;
import org.eclipse.birt.chart.model.data.impl.TextDataSetImpl;
import org.eclipse.birt.chart.model.impl.ChartWithoutAxesImpl;
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.type.PieSeries;
import org.eclipse.birt.chart.model.type.impl.PieSeriesImpl;
/**
 *
 * @author parteek
 */
public class PieGraph {
    
    public static Chart createDailySalesPie(ArrayList dailyPaymentDet,String year,String month)
    {
        // Generating month from paramter "month" in the method
        String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
         month=monthList[Integer.parseInt(month)-1];
        
        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue("");//$NON-NLS-1$

                // Extracting From ArrayList the amonth value
               int i=1;
               ArrayList days=new ArrayList();
               ArrayList amount=new ArrayList();
                int length=dailyPaymentDet.size();
                System.out.println("Length is :"+length);
                 System.out.println("Just Itearting");
                  //String days[]=null; double amount[]=null;// Initializing arrays for days and amount
                  for(Iterator it=dailyPaymentDet.iterator();it.hasNext();)
                  {
                     Double db= (Double)it.next();
                     //double dbValue = db.doubleValue();
                     
                     amount.add(db);
                     days.add(new Integer(i));
                     i=i+1;  
                  }
                
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( days );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
	        NumberDataSet seriesOneValues = NumberDataSetImpl.create(amount);
                
                /*TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"New York", "Boston", "Chicago", "San Francisco", "Dallas"} );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create( new double[]{
				54.65, 21, 75.95, 91.28, 37.43
		} );*/
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Day" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );
                 System.out.println("Returning from create pie");
		return cwoaPie;
    }
     public static Chart createMonthlySalesPie(ArrayList monthlyPaymentDet,String year)
    {
        // Generating month from paramter "month" in the method
        String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
        // month=monthList[Integer.parseInt(month)];
        
        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
             int i=0;
            for(Iterator it=monthlyPaymentDet.iterator();it.hasNext();)
            {
            Double db= (Double)it.next();
            vs.add(monthList[i]);   
            vn1.add(db);              
            i=i+1;
              }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Monthly Sales" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
    }
    

      public static Chart createAreaSalesPie(ArrayList areaAmount)
    {
        // Generating month from paramter "month" in the method
       // String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
        // month=monthList[Integer.parseInt(month)];
        
        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue("");//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
             int i=1; String area=null;
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
  
            vs.add(area);   
            vn1.add(db);              
            i=i+1;
              }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
    }

     public static Chart createMemberShipSalesPie(ArrayList areaDet,String year)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue("");//$NON-NLS-1$

                // Extracting From ArrayList the amonth value
               int i=1;
               ArrayList areaList=new ArrayList();
               ArrayList amount=new ArrayList();
                int length=areaDet.size();
                System.out.println("Length is :"+length);
                 System.out.println("Just Itearting");
                 String area=null;
                  //String days[]=null; double amount[]=null;// Initializing arrays for days and amount
                  for(Iterator it=areaDet.iterator();it.hasNext();)
                  {
                     Double db= (Double)it.next();
                     //double dbValue = db.doubleValue();
                     
                     amount.add(db);
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
                     i=i+1;  
                     
                     areaList.add(area);
                  }
                
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( areaList );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
	        NumberDataSet seriesOneValues = NumberDataSetImpl.create(amount);
                
                /*TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"New York", "Boston", "Chicago", "San Francisco", "Dallas"} );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create( new double[]{
				54.65, 21, 75.95, 91.28, 37.43
		} );*/
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Sales" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );
                 System.out.println("Returning from create pie");
		return cwoaPie;
     }
     
     public static Chart createStatusWiseHumanMembersNumberPie(HashMap statusWiseHumanMembers)
     {
          
        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set human=statusWiseHumanMembers.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String status_name=(String)it.next();
                                      String total= (String)statusWiseHumanMembers.get(status_name);
                                      vs.add(status_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Status-Name "+status_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Status" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }

     public static Chart createStatusWiseHorseMembersNumberPie(HashMap statusWiseHorseMembers)
     {

        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$

		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set human=statusWiseHorseMembers.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String status_name=(String)it.next();
                                      String total= (String)statusWiseHorseMembers.get(status_name);
                                      vs.add(status_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Status-Name "+status_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Status" );//$NON-NLS-1$
		sePie.setExplosion( 5 );

		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }






     public static Chart createMembershipWiseHumanNumberByStatusPie(HashMap humanMembersMemberShips,String status)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "");//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set human=humanMembersMemberShips.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)humanMembersMemberShips.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Status" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }

     public static Chart createMembershipWiseHorseNumberByStatusPie(HashMap horseMembersMemberShips,String status)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$

		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "");//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set horse=horseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersMemberShips.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Status" );//$NON-NLS-1$
		sePie.setExplosion( 5 );

		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }
     public static Chart createTotalHumanMembersAreaWisePie(ArrayList totalHumanAreaWise)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                Vector vs = new Vector();
                 // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
                ArrayList vn1 = new ArrayList();
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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Area" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }
     public static Chart generateTotalHumanAllAreasStatusWisePie(ArrayList totalHumanAllAreasStatusWise)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<totalHumanAllAreasStatusWise.size();i++)
                        {
                              HashMap humanMembersCountStatusWise=(HashMap)totalHumanAllAreasStatusWise.get(i);
                              Set human=humanMembersCountStatusWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String area_name=(String)it.next();
                                      Double total= (Double)humanMembersCountStatusWise.get(area_name);
                                      vs.add(area_name);
                                      vn1.add(total);
                            }
                        }
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Area" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }
     public static Chart generateTotalHumanAllMembershipsAreaWisePie(ArrayList totalHumanAllAreasStatusWise)
     {
         ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<totalHumanAllAreasStatusWise.size();i++)
                        {
                              HashMap humanMembersCountStatusWise=(HashMap)totalHumanAllAreasStatusWise.get(i);
                              Set human=humanMembersCountStatusWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      Double total= (Double)humanMembersCountStatusWise.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(total);
                            }
                        }
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Membership" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }

      public static Chart createMemTypeWiseNewHorseMembersPie(HashMap newlyRegHorseMemberCount)
     {

        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$

		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( " " );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set horse=newlyRegHorseMemberCount.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)newlyRegHorseMemberCount.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Number of Horse Member" );//$NON-NLS-1$
		sePie.setExplosion( 5 );

		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }
       public static Chart createEventsWiseHorseMembersPie(HashMap HorseMemberCountEventWise)
     {

        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$

		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( " " );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set horse=HorseMemberCountEventWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String year=(String)it.next();
                                      String total= (String)HorseMemberCountEventWise.get(year);
                                      vs.add(year);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Year "+year);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Number of Non-Human Member" );//$NON-NLS-1$
		sePie.setExplosion( 5 );

		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }

 public static Chart createMembershipWiseHorseMembersEventPie(HashMap horseMembersEventsMembershipWise)
     {

        ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$

		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( " " );//$NON-NLS-1$
                Vector vs = new Vector();
         // INITIALIZE A COLLECTION WITH THE X-Y-SERIES DATA
              ArrayList vn1 = new ArrayList();
               Set human=horseMembersEventsMembershipWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersEventsMembershipWise.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
		TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Membership" );//$NON-NLS-1$
		sePie.setExplosion( 5 );

		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
     }

public static Chart generateTotalDonationAmountForAllDonationItemsPie(ArrayList totalDonationAmountForAllDonationItems)
{
   ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<totalDonationAmountForAllDonationItems.size();i++)
                        {
                              HashMap donationAmountForAllDonationItems=(HashMap)totalDonationAmountForAllDonationItems.get(i);
                              Set human=donationAmountForAllDonationItems.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String donation_name=(String)it.next();
                                      Double total= (Double)donationAmountForAllDonationItems.get(donation_name);
                                      vs.add(donation_name);
                                      vn1.add(total);
                            }
                        }
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Donation Amount" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie; 
}
public static Chart generateTotalEventsYearWisePie(ArrayList yearlyEvents)
{
   ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<yearlyEvents.size();i++)
                        {
                              HashMap eventsYearWise=(HashMap)yearlyEvents.get(i);
                              Set human=eventsYearWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String year_name=(String)it.next();
                                      Double total= (Double)eventsYearWise.get(year_name);
                                      vs.add(year_name);
                                      vn1.add(total);
                            }
                        }
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Events Conducted" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie; 
 
}
public static Chart generateTotalEventsAreawise(ArrayList yearlyEvents)
{
   ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<yearlyEvents.size();i++)
                        {
                              HashMap eventsYearWise=(HashMap)yearlyEvents.get(i);
                              Set human=eventsYearWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String year_name=(String)it.next();
                                      Double total= (Double)eventsYearWise.get(year_name);
                                      vs.add(year_name);
                                      vn1.add(total);
                            }
                        }
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Memebrs Participated" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie; 
 
}
public static Chart generateMembersJoinedForParticularYearPie(java.util.LinkedHashMap membersCount)
{
    ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create( );
		cwoaPie.setDimension( ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL );
		cwoaPie.setType( "Pie Chart" ); //$NON-NLS-1$	
		cwoaPie.setSubType( "Standard Pie Chart" ); //$NON-NLS-1$
		
		// Plot
		cwoaPie.setSeriesThickness( 10 );

		// Legend
		Legend lg = cwoaPie.getLegend( );
		lg.getOutline( ).setVisible( true );

		// Title
		cwoaPie.getTitle( ).getLabel( ).getCaption( ).setValue( "" );//$NON-NLS-1$
                     // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        
                            Set human=membersCount.keySet();
                                    for(Iterator it=human.iterator();it.hasNext();)
                                    {
                                              String month_Name=(String)it.next();
                                              Integer total= (Integer)membersCount.get(month_Name);
                                              vn1.add(new Double(total.doubleValue())); vs.add(month_Name);
                                              System.out.print("Membership-Name "+month_Name);
                                             System.out.print("Total  For"+total.intValue());
                                    }
                       
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs );//$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
		
                   // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	
		SampleData sdata = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdata.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sdata.getOrthogonalSampleData( ).add( sdOrthogonal );

		cwoaPie.setSampleData( sdata );

		// Base Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sd = SeriesDefinitionImpl.create( );
		cwoaPie.getSeriesDefinitions( ).add( sd );
		sd.getSeriesPalette( ).shift( 0 );
		sd.getSeries( ).add( seCategory );

		// Orthogonal Series
		PieSeries sePie = (PieSeries) PieSeriesImpl.create( );
		sePie.setDataSet( seriesOneValues );
		sePie.setSeriesIdentifier( "Members" );//$NON-NLS-1$ 
		sePie.setExplosion( 5 );
		
		SeriesDefinition sdCity = SeriesDefinitionImpl.create( );
		sd.getSeriesDefinitions( ).add( sdCity );
		sdCity.getSeries( ).add( sePie );

		return cwoaPie;
}

  public static void generatePieGraphImage(Chart cm,String path)
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
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"pie.png");
                System.out.println("Pie Image Rendered");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
  System.out.println("FinisedPie");
    }
  
  

  public static Chart generatePurchaseRequisitionPeriodWisePie(ArrayList yearlyEvents)
  {
      ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create();
      cwoaPie.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
      cwoaPie.setType("Pie Chart");
      cwoaPie.setSubType("Standard Pie Chart");
      cwoaPie.setSeriesThickness(10D);
      Legend lg = cwoaPie.getLegend();
      lg.getOutline().setVisible(true);
      cwoaPie.getTitle().getLabel().getCaption().setValue("");
      Vector vs = new Vector();
      ArrayList vn1 = new ArrayList();
      for(int i = 0; i < yearlyEvents.size(); i++)
      {
          HashMap eventsYearWise = (HashMap)yearlyEvents.get(i);
          Set human = eventsYearWise.keySet();
          Double total;
          for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
          {
              String year_name = (String)it.next();
              total = (Double)eventsYearWise.get(year_name);
              vs.add(year_name);
          }

      }

      org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
      org.eclipse.birt.chart.model.data.NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
      SampleData sdata = DataFactory.eINSTANCE.createSampleData();
      BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
      sdBase.setDataSetRepresentation("");
      sdata.getBaseSampleData().add(sdBase);
      OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
      sdOrthogonal.setDataSetRepresentation("");
      sdOrthogonal.setSeriesDefinitionIndex(0);
      sdata.getOrthogonalSampleData().add(sdOrthogonal);
      cwoaPie.setSampleData(sdata);
      Series seCategory = SeriesImpl.create();
      seCategory.setDataSet(categoryValues);
      SeriesDefinition sd = SeriesDefinitionImpl.create();
      cwoaPie.getSeriesDefinitions().add(sd);
      sd.getSeriesPalette().shift(0);
      sd.getSeries().add(seCategory);
      PieSeries sePie = (PieSeries)PieSeriesImpl.create();
      sePie.setDataSet(seriesOneValues);
      sePie.setSeriesIdentifier("Status");
      sePie.setExplosion(5);
      SeriesDefinition sdCity = SeriesDefinitionImpl.create();
      sd.getSeriesDefinitions().add(sdCity);
      sdCity.getSeries().add(sePie);
      return cwoaPie;
  }
  public static Chart generateVendorAnalysisReportPie(ArrayList yearlyEvents)
  {
      ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create();
      cwoaPie.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
      cwoaPie.setType("Pie Chart");
      cwoaPie.setSubType("Standard Pie Chart");
      cwoaPie.setSeriesThickness(10D);
      Legend lg = cwoaPie.getLegend();
      lg.getOutline().setVisible(true);
      cwoaPie.getTitle().getLabel().getCaption().setValue("");
      Vector vs = new Vector();
      ArrayList vn1 = new ArrayList();
      for(int i = 0; i < yearlyEvents.size(); i++)
      {
          HashMap eventsYearWise = (HashMap)yearlyEvents.get(i);
          Set human = eventsYearWise.keySet();
          Double total;
          for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
          {
              String year_name = (String)it.next();
              total = (Double)eventsYearWise.get(year_name);
              vs.add(year_name);
          }

      }

      org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
      org.eclipse.birt.chart.model.data.NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
      SampleData sdata = DataFactory.eINSTANCE.createSampleData();
      BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
      sdBase.setDataSetRepresentation("");
      sdata.getBaseSampleData().add(sdBase);
      OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
      sdOrthogonal.setDataSetRepresentation("");
      sdOrthogonal.setSeriesDefinitionIndex(0);
      sdata.getOrthogonalSampleData().add(sdOrthogonal);
      cwoaPie.setSampleData(sdata);
      Series seCategory = SeriesImpl.create();
      seCategory.setDataSet(categoryValues);
      SeriesDefinition sd = SeriesDefinitionImpl.create();
      cwoaPie.getSeriesDefinitions().add(sd);
      sd.getSeriesPalette().shift(0);
      sd.getSeries().add(seCategory);
      PieSeries sePie = (PieSeries)PieSeriesImpl.create();
      sePie.setDataSet(seriesOneValues);
      sePie.setSeriesIdentifier("Vendors");
      sePie.setExplosion(5);
      SeriesDefinition sdCity = SeriesDefinitionImpl.create();
      sd.getSeriesDefinitions().add(sdCity);
      sdCity.getSeries().add(sePie);
      return cwoaPie;
  }

  public static Chart generateQuarterSalesByItemParticularYearPie(ArrayList yearlyEvents)
  {
      ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create();
      cwoaPie.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
      cwoaPie.setType("Pie Chart");
      cwoaPie.setSubType("Standard Pie Chart");
      cwoaPie.setSeriesThickness(10D);
      Legend lg = cwoaPie.getLegend();
      lg.getOutline().setVisible(true);
      cwoaPie.getTitle().getLabel().getCaption().setValue("");
      Vector vs = new Vector();
      ArrayList vn1 = new ArrayList();
      for(int i = 0; i < yearlyEvents.size(); i++)
      {
          LinkedHashMap eventsYearWise = (LinkedHashMap)yearlyEvents.get(i);
          Set human = eventsYearWise.keySet();
          Double total;
          for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
          {
              String year_name = (String)it.next();
              total = (Double)eventsYearWise.get(year_name);
              vs.add(year_name);
          }

      }

      org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
      org.eclipse.birt.chart.model.data.NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
      SampleData sdata = DataFactory.eINSTANCE.createSampleData();
      BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
      sdBase.setDataSetRepresentation("");
      sdata.getBaseSampleData().add(sdBase);
      OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
      sdOrthogonal.setDataSetRepresentation("");
      sdOrthogonal.setSeriesDefinitionIndex(0);
      sdata.getOrthogonalSampleData().add(sdOrthogonal);
      cwoaPie.setSampleData(sdata);
      Series seCategory = SeriesImpl.create();
      seCategory.setDataSet(categoryValues);
      SeriesDefinition sd = SeriesDefinitionImpl.create();
      cwoaPie.getSeriesDefinitions().add(sd);
      sd.getSeriesPalette().shift(0);
      sd.getSeries().add(seCategory);
      PieSeries sePie = (PieSeries)PieSeriesImpl.create();
      sePie.setDataSet(seriesOneValues);
      sePie.setSeriesIdentifier("Sales($Million)");
      sePie.setExplosion(5);
      SeriesDefinition sdCity = SeriesDefinitionImpl.create();
      sd.getSeriesDefinitions().add(sdCity);
      sdCity.getSeries().add(sePie);
      return cwoaPie;
  }
  
  public static Chart generateQuarterSalesAllItemParticularYearPie(ArrayList yearlyEvents)
  {
      ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create();
      cwoaPie.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
      cwoaPie.setType("Pie Chart");
      cwoaPie.setSubType("Standard Pie Chart");
      cwoaPie.setSeriesThickness(10D);
      Legend lg = cwoaPie.getLegend();
      lg.getOutline().setVisible(true);
      cwoaPie.getTitle().getLabel().getCaption().setValue("");
      Vector vs = new Vector();
      ArrayList vn1 = new ArrayList();
      for(int i = 0; i < yearlyEvents.size(); i++)
      {
          HashMap eventsYearWise = (HashMap)yearlyEvents.get(i);
          Set human = eventsYearWise.keySet();
          Double total;
          for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
          {
              String year_name = (String)it.next();
              total = (Double)eventsYearWise.get(year_name);
              vs.add(year_name);
          }

      }

      org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
      org.eclipse.birt.chart.model.data.NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
      SampleData sdata = DataFactory.eINSTANCE.createSampleData();
      BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
      sdBase.setDataSetRepresentation("");
      sdata.getBaseSampleData().add(sdBase);
      OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
      sdOrthogonal.setDataSetRepresentation("");
      sdOrthogonal.setSeriesDefinitionIndex(0);
      sdata.getOrthogonalSampleData().add(sdOrthogonal);
      cwoaPie.setSampleData(sdata);
      Series seCategory = SeriesImpl.create();
      seCategory.setDataSet(categoryValues);
      SeriesDefinition sd = SeriesDefinitionImpl.create();
      cwoaPie.getSeriesDefinitions().add(sd);
      sd.getSeriesPalette().shift(0);
      sd.getSeries().add(seCategory);
      PieSeries sePie = (PieSeries)PieSeriesImpl.create();
      sePie.setDataSet(seriesOneValues);
      sePie.setSeriesIdentifier("Sales($Million)");
      sePie.setExplosion(5);
      SeriesDefinition sdCity = SeriesDefinitionImpl.create();
      sd.getSeriesDefinitions().add(sdCity);
      sdCity.getSeries().add(sePie);
      return cwoaPie;
  }

  public static Chart generateQuarterVolumeSalesByItemParticularYearPie(ArrayList yearlyEvents)
  {
      ChartWithoutAxes cwoaPie = ChartWithoutAxesImpl.create();
      cwoaPie.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
      cwoaPie.setType("Pie Chart");
      cwoaPie.setSubType("Standard Pie Chart");
      cwoaPie.setSeriesThickness(10D);
      Legend lg = cwoaPie.getLegend();
      lg.getOutline().setVisible(true);
      cwoaPie.getTitle().getLabel().getCaption().setValue("");
      Vector vs = new Vector();
      ArrayList vn1 = new ArrayList();
      for(int i = 0; i < yearlyEvents.size(); i++)
      {
          LinkedHashMap eventsYearWise = (LinkedHashMap)yearlyEvents.get(i);
          Set human = eventsYearWise.keySet();
          Double total;
          for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
          {
              String year_name = (String)it.next();
              total = (Double)eventsYearWise.get(year_name);
              vs.add(year_name);
          }

      }

      org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
      org.eclipse.birt.chart.model.data.NumberDataSet seriesOneValues = NumberDataSetImpl.create(vn1);
      SampleData sdata = DataFactory.eINSTANCE.createSampleData();
      BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
      sdBase.setDataSetRepresentation("");
      sdata.getBaseSampleData().add(sdBase);
      OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
      sdOrthogonal.setDataSetRepresentation("");
      sdOrthogonal.setSeriesDefinitionIndex(0);
      sdata.getOrthogonalSampleData().add(sdOrthogonal);
      cwoaPie.setSampleData(sdata);
      Series seCategory = SeriesImpl.create();
      seCategory.setDataSet(categoryValues);
      SeriesDefinition sd = SeriesDefinitionImpl.create();
      cwoaPie.getSeriesDefinitions().add(sd);
      sd.getSeriesPalette().shift(0);
      sd.getSeries().add(seCategory);
      PieSeries sePie = (PieSeries)PieSeriesImpl.create();
      sePie.setDataSet(seriesOneValues);
      sePie.setSeriesIdentifier("Units Sale");
      sePie.setExplosion(5);
      SeriesDefinition sdCity = SeriesDefinitionImpl.create();
      sd.getSeriesDefinitions().add(sdCity);
      sdCity.getSeries().add(sePie);
      return cwoaPie;
  }
}
