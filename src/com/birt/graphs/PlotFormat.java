/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.birt.graphs;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.Anchor;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.LegendItemType;
import org.eclipse.birt.chart.model.attribute.LineStyle;
import org.eclipse.birt.chart.model.attribute.Position;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
import org.eclipse.birt.chart.model.attribute.impl.GradientImpl;
import org.eclipse.birt.chart.model.component.Axis;
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
import org.eclipse.birt.chart.model.impl.ChartWithAxesImpl;
import org.eclipse.birt.chart.model.layout.Plot;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.GeneratedChartState;
import org.eclipse.birt.chart.factory.Generator;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.BaseSampleData;
import org.eclipse.birt.chart.util.PluginSettings;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Vector;


/**
 *
 * @author parteek
 */
public class PlotFormat {
    
     public static Chart createHumanMembersSpecificMembershipByStatusPlotFormatGraph(String total,String membership_Name,String status_Name)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$
		
		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title 

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                 double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( new double[]{
				count
		} );
		
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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
     }

      public static Chart createHorseMembersSpecificMembershipByStatusPlotFormatGraph(String total,String membership_Name,String status_Name)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                 double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( new double[]{
				count
		} );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
     }
      public static Chart createTotalHumanMembersAreaWisePlotFormatGraph(ArrayList totalHumanAreaWise)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
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
                            }
                        } 
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( 
				vn1
		 );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }
      public static Chart createTotalHumanAllAreasStatusWisePlotFormatGraph(ArrayList totalHumanAllAreasStatusWise)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( 
				vn1
		 );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }
      public static Chart generateTotalHumanAllMembershipsAreaWisePlotFormat(ArrayList totalHumanAllAreasStatusWise)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( 
				vn1
		 );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }

      public static Chart createHorseMembersEventsPlotFormatGraph(String total,String year)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                 double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				year} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( new double[]{
				count
		} );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
     }
      public static Chart createHumanMembersSpecificAreaAndMembershipTypePlotFormat(int total,String membership_Name,String area_name)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name+" in "+area_name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( new Double(total)
				
		);

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }
      public static Chart createTotalDonationAmountPlotFormatGraph(double total)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Donations"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( new Double(total)
				
		);

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }
      public static Chart generateTotalDonationAmountForAllDonationItemsPlotFormat(ArrayList totalDonationAmountForAllDonationItems)
      {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( 
				vn1
		 );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
      }
       public static Chart generateTotalEventsYearWisePlotFormat(ArrayList yearlyEvents)
       {
           ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                Vector vs = new Vector();
                 // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
                ArrayList vn1 = new ArrayList();
                for(int i=0;i<yearlyEvents.size();i++)
                        {
                              HashMap evnetsYearly=(HashMap)yearlyEvents.get(i);
                              Set human=evnetsYearly.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String year_name=(String)it.next();
                                      Double total= (Double)evnetsYearly.get(year_name);
                                      vs.add(year_name);
                                      vn1.add(total);
                            }
                        } 
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( 
				vn1
		 );

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
       }
       public static Chart createHumanMembersParticipatedInEventsPlotFormat(Double db)
       {
          ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
                 
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Human Members"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( db);
				
		

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar; 
       }
       public static Chart generateMembersJoinedForParticularYearPlotFormat(java.util.HashMap membersCount)
       {
           ChartWithAxes cwaBar = ChartWithAxesImpl.create( );
		cwaBar.setType( "Bar Chart" ); //$NON-NLS-1$
		cwaBar.setSubType( "Side-by-side" ); //$NON-NLS-1$

		// Plot
		Plot p = cwaBar.getPlot( );

		p.getOutline( ).setStyle( LineStyle.DASH_DOTTED_LITERAL );
		p.getOutline( ).setColor( ColorDefinitionImpl.create( 214, 100, 12 ) );
		p.getOutline( ).setVisible( true );

		p.setBackground( ColorDefinitionImpl.CREAM( ) );
		p.setAnchor( Anchor.NORTH_LITERAL );

		p.getClientArea( )
				.setBackground( GradientImpl.create( ColorDefinitionImpl.create( 225,
						0,
						255 ),
						ColorDefinitionImpl.create( 255, 253, 200 ),
						-35,
						false ) );
		p.getClientArea( ).getOutline( ).setVisible( true );

		// Title
		cwaBar.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ For title

		// Legend
		cwaBar.getLegend( ).setVisible( false );
		cwaBar.getLegend( ).setItemType( LegendItemType.CATEGORIES_LITERAL );

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
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Members Joined" );
		yAxisPrimary.getTitle().setVisible(true);
                 
		Vector vs = new Vector();
                 // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
                ArrayList vn1 = new ArrayList();
                Set human=membersCount.keySet();
                                    for(Iterator it=human.iterator();it.hasNext();)
                                    {
                                              String month_Name=(String)it.next();
                                              Integer total= (Integer)membersCount.get(month_Name);
                                              vn1.add(month_Name);vs.add(new Double(total.doubleValue()));
                                              System.out.print("Membership-Name "+month_Name);
                                             System.out.print("Total  For"+total.intValue());
                                    }
                // Data Set
                
		TextDataSet categoryValues = TextDataSetImpl.create( vn1 ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
		NumberDataSet orthoValues = NumberDataSetImpl.create( vs);
				
		

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
		bs.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs );

		return cwaBar;
       }
     public static void generatePlotFormatGraphImage(Chart cm,String path)
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
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"plotformat.png");
                System.out.println("Plot Format graph Image Rendered");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
  System.out.println("FinisedPlotFormat");
    }

     
     public static Chart generatePurchaseRequisitionPeriodWisePlotFormat(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Numbers");
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         for(int i = 0; i < yearlyEvents.size(); i++)
         {
             HashMap evnetsYearly = (HashMap)yearlyEvents.get(i);
             Set human = evnetsYearly.keySet();
             Double total;
             for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
             {
                 String year_name = (String)it.next();
                 total = (Double)evnetsYearly.get(year_name);
                 vs.add(year_name);
             }

         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }

     
     public static Chart generatePurchaseRequisitionPerStatusPlotFormat(Double db, String status)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Numbers");
         yAxisPrimary.getTitle().setVisible(true);
         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(new String[] {
             status
         });
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(db);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }

     public static Chart generateVendorAnalysisReportPlotFormat(ArrayList yearlyEvents, String yAxis)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue(yAxis);
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         for(int i = 0; i < yearlyEvents.size(); i++)
         {
             HashMap evnetsYearly = (HashMap)yearlyEvents.get(i);
             Set human = evnetsYearly.keySet();
             Double total;
             for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
             {
                 String year_name = (String)it.next();
                 total = (Double)evnetsYearly.get(year_name);
                 vs.add(year_name);
             }

         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }

     public static Chart generateQuarterSalesByItemParticularYearPlotFormat(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Sales($Million)");
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         for(int i = 0; i < yearlyEvents.size(); i++)
         {
             LinkedHashMap evnetsYearly = (LinkedHashMap)yearlyEvents.get(i);
             Set human = evnetsYearly.keySet();
             Double total;
             for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
             {
                 String year_name = (String)it.next();
                 total = (Double)evnetsYearly.get(year_name);
                 vs.add(year_name);
             }

         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }
     
     public static Chart generateQuarterSalesAllItemParticularYearPlotFormat(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Sales($Million)");
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         for(int i = 0; i < yearlyEvents.size(); i++)
         {
             HashMap evnetsYearly = (HashMap)yearlyEvents.get(i);
             Set human = evnetsYearly.keySet();
             Double total;
             for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
             {
                 String year_name = (String)it.next();
                 total = (Double)evnetsYearly.get(year_name);
                 vs.add(year_name);
             }

         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }
     public static Chart generateQuarterVolumeSalesByItemParticularYearPlotFormat(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaBar = ChartWithAxesImpl.create();
         cwaBar.setType("Bar Chart");
         cwaBar.setSubType("Side-by-side");
         Plot p = cwaBar.getPlot();
         p.getOutline().setStyle(LineStyle.DASH_DOTTED_LITERAL);
         p.getOutline().setColor(ColorDefinitionImpl.create(214, 100, 12));
         p.getOutline().setVisible(true);
         p.setBackground(ColorDefinitionImpl.CREAM());
         p.setAnchor(Anchor.NORTH_LITERAL);
         p.getClientArea().setBackground(GradientImpl.create(ColorDefinitionImpl.create(225, 0, 255), ColorDefinitionImpl.create(255, 253, 200), -35D, false));
         p.getClientArea().getOutline().setVisible(true);
         cwaBar.getTitle().getLabel().getCaption().setValue("");
         cwaBar.getLegend().setVisible(false);
         cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Units Sale");
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         for(int i = 0; i < yearlyEvents.size(); i++)
         {
             LinkedHashMap evnetsYearly = (LinkedHashMap)yearlyEvents.get(i);
             Set human = evnetsYearly.keySet();
             Double total;
             for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
             {
                 String year_name = (String)it.next();
                 total = (Double)evnetsYearly.get(year_name);
                 vs.add(year_name);
             }

         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal.setDataSetRepresentation("");
         sdOrthogonal.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal);
         cwaBar.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs = (BarSeries)BarSeriesImpl.create();
         bs.setDataSet(orthoValues);
         bs.getLabel().setVisible(true);
         bs.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs);
         return cwaBar;
     }


}
