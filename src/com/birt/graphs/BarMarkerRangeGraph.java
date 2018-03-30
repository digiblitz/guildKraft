/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.birt.graphs;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.Vector;
import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.GeneratedChartState;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.LegendItemType;
import org.eclipse.birt.chart.model.attribute.Position;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
import org.eclipse.birt.chart.model.component.Axis;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.MarkerRangeImpl;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.BaseSampleData;
import org.eclipse.birt.chart.model.data.DataFactory;
import org.eclipse.birt.chart.model.data.NumberDataSet;
import org.eclipse.birt.chart.model.data.OrthogonalSampleData;
import org.eclipse.birt.chart.model.data.SampleData;
import org.eclipse.birt.chart.model.data.SeriesDefinition;
import org.eclipse.birt.chart.model.data.TextDataSet;
import org.eclipse.birt.chart.model.data.impl.NumberDataElementImpl;
import org.eclipse.birt.chart.model.data.impl.NumberDataSetImpl;
import org.eclipse.birt.chart.model.data.impl.SeriesDefinitionImpl;
import org.eclipse.birt.chart.model.data.impl.TextDataSetImpl;
import org.eclipse.birt.chart.model.impl.ChartWithAxesImpl;
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.layout.Plot;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.chart.util.PluginSettings;
import org.eclipse.birt.chart.factory.Generator;

/**
 *
 * @author parteek
 */
public class BarMarkerRangeGraph {
    
    public static Chart generateTotalHumanAllAreasStatusWiseBarMarkerRangeGraph(ArrayList totalHumanAllAreasStatusWise)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$
		
		// Plot
		cwaBar.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaBar.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaBar.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$

		// Legend
		Legend lg = cwaBar.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);

		yAxisPrimary.getMarkerRanges( )
				.add( MarkerRangeImpl.create( yAxisPrimary,
						NumberDataElementImpl.create( 20 ),
						NumberDataElementImpl.create( 28 ),
						ColorDefinitionImpl.GREEN( ).translucent( ) ) );
                 
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
		
		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal );
		
		cwaBar.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs = (BarSeries) BarSeriesImpl.create( );
		bs.setDataSet( orthoValues );
		bs.getLabel( ).setVisible( true );
		bs.setTranslucent( true );
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
    }
     public static Chart generateTotalHumanAllMembershipsAreaWiseBarMarkerRangeGraph(ArrayList totalHumanAllMembershipsAreaWise)
     {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$
		
		// Plot
		cwaBar.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaBar.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaBar.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$

		// Legend
		Legend lg = cwaBar.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
		yAxisPrimary.getMarkerRanges( )
				.add( MarkerRangeImpl.create( yAxisPrimary,
						NumberDataElementImpl.create( 20 ),
						NumberDataElementImpl.create( 28 ),
						ColorDefinitionImpl.GREEN( ).translucent( ) ) );
                 
                        // INITIALIZE A COLLECTION WITH THE X-SERIES DATA
	Vector vs = new Vector();
	
	

	     // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
                        
                             
                        for(int i=0;i<totalHumanAllMembershipsAreaWise.size();i++)
                        {
                              HashMap humanMembersCountStatusWise=(HashMap)totalHumanAllMembershipsAreaWise.get(i);
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
		
		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal );
		
		cwaBar.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs = (BarSeries) BarSeriesImpl.create( );
		bs.setDataSet( orthoValues );
		bs.getLabel( ).setVisible( true );
		bs.setTranslucent( true );
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar; 
     }
     public static Chart generateTotalDonationAmountForAllDonationItemsBarMarker(ArrayList totalDonationAmountForAllDonationItems)
     {
      ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$
		
		// Plot
		cwaBar.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaBar.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaBar.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$

		// Legend
		Legend lg = cwaBar.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Amount in $" );
		yAxisPrimary.getTitle().setVisible(true); 
		yAxisPrimary.getMarkerRanges( )
				.add( MarkerRangeImpl.create( yAxisPrimary,
						NumberDataElementImpl.create( 20 ),
						NumberDataElementImpl.create( 28 ),
						ColorDefinitionImpl.GREEN( ).translucent( ) ) );
                 
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
		
		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal );
		
		cwaBar.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs = (BarSeries) BarSeriesImpl.create( );
		bs.setDataSet( orthoValues );
		bs.getLabel( ).setVisible( true );
		bs.setTranslucent( true );
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;   
     }
     public static Chart generateTotalEventsYearWiseBarMarkerRangeGraph(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$
		
		// Plot
		cwaBar.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaBar.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaBar.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$

		// Legend
		Legend lg = cwaBar.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Events" );
		yAxisPrimary.getTitle().setVisible(true);
		yAxisPrimary.getMarkerRanges( )
				.add( MarkerRangeImpl.create( yAxisPrimary,
						NumberDataElementImpl.create( 20 ),
						NumberDataElementImpl.create( 28 ),
						ColorDefinitionImpl.GREEN( ).translucent( ) ) );
                 
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
		
		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal );
		
		cwaBar.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs = (BarSeries) BarSeriesImpl.create( );
		bs.setDataSet( orthoValues );
		bs.getLabel( ).setVisible( true );
		bs.setTranslucent( true );
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
     }
    public static void generateBarMarkerRangeGraphImage(Chart cm,String path)
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
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"barMarker.png");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
  System.out.println("Finisedh");

     }

}
