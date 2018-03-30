/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.birt.graphs;

import java.awt.image.BufferedImage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.Vector;
import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.GeneratedChartState;
import org.eclipse.birt.chart.factory.Generator;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.LegendItemType;
import org.eclipse.birt.chart.model.attribute.Position;
import org.eclipse.birt.chart.model.attribute.RiserType;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
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
import org.eclipse.birt.chart.model.layout.Legend;
import org.eclipse.birt.chart.model.layout.Plot;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.chart.util.PluginSettings;


/**
 *
 * @author parteek
 */
public class TubeGraph {

      public static Chart createHumanMembersSpecificMembershipByStatusTube(String total,String membership_Name,String status_Name)
      {
          ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
                double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new double[]{
				count
		} );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
      }



       public static Chart createHorseMembersSpecificMembershipByStatusTube(String total,String membership_Name,String status_Name)
      {
          ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new double[]{
				count
		} );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
      }
       
       public static Chart createTotalHumanAllAreasStatusWiseTube(ArrayList totalHumanAllAreasStatusWise)
       {
           ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
       }
     public static Chart generateTotalHumanAllMembershipsAreaWiseTube(ArrayList totalHumanMembersAllMemberhipTypesByArea)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
               Vector vs = new Vector();
                 // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
                ArrayList vn1 = new ArrayList();
                for(int i=0;i<totalHumanMembersAllMemberhipTypesByArea.size();i++)
                        {
                              HashMap humanMembersCountStatusWise=(HashMap)totalHumanMembersAllMemberhipTypesByArea.get(i);
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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
     }
      public static Chart createHorseMembersEventsTube(String total,String year)
      {
          ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                double count=Double.parseDouble(total);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				year} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new double[]{
				count
		} );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
      }
     public static Chart createHumanMembersSpecificAreaAndMembershipTypeTube(int total,String membership_Name,String area_name)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
               yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name+" in "+area_name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new Double(total)
		 );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
     }
     public static Chart createTotalDonationAmountTube(double total)
     {
        ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                 yAxisPrimary.getTitle( ).getCaption( ).setValue( "Amount in $" );
		yAxisPrimary.getTitle().setVisible(true); 
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Donations"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new Double(total)
		 );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube; 
     }
     public static Chart generateTotalEventsYearWiseTube(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
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
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;
     }
     public static Chart createHumanMembersParticipatedInEventsTube(Double count)
     {
       ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Human Members"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( count
		 );
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;  
     }
     
     public static Chart generateMembersJoinedForParticularYearTube(java.util.LinkedHashMap membersCount)
     {
        ChartWithAxes cwaTube = ChartWithAxesImpl.create( );
		cwaTube.setType( "Tube Chart" ); //$NON-NLS-1$
		cwaTube.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaTube.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaTube.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaTube.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaTube.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue( "" ); //$NON-NLS-1$ Title of the graph

		// Legend
		Legend lg = cwaTube.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Members Joined" );
		yAxisPrimary.getTitle().setVisible(true);
               Vector vs = new Vector();
               ArrayList vn1=new ArrayList();
                 // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
                 Set human=membersCount.keySet();
                                    for(Iterator it=human.iterator();it.hasNext();)
                                    {
                                              String month_Name=(String)it.next();
                                              Integer total= (Integer)membersCount.get(month_Name);
                                              vn1.add(new Double(total.doubleValue()));vs.add(month_Name);
                                              System.out.print("Month "+month_Name);
                                             System.out.print("Total  For"+total.intValue());
                                    }
		// Data Set
		// Data Set
		TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
		//NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
				//5, 10, 25, 10, 5
		//} );

		SampleData sd = DataFactory.eINSTANCE.createSampleData( );
		BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData( );
		sdBase.setDataSetRepresentation( "" );//$NON-NLS-1$
		sd.getBaseSampleData( ).add( sdBase );

		OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal1.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal1.setSeriesDefinitionIndex( 0 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal1 );

		OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData( );
		sdOrthogonal2.setDataSetRepresentation( "" );//$NON-NLS-1$
		sdOrthogonal2.setSeriesDefinitionIndex( 1 );
		sd.getOrthogonalSampleData( ).add( sdOrthogonal2 );

		cwaTube.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.TUBE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		//BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		//bs2.setRiser( RiserType.TUBE_LITERAL );
		//bs2.setDataSet( orthoValues2 );
		//bs2.getLabel( ).setVisible( true );
		//bs2.setLabelPosition( Position.INSIDE_LITERAL );

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaTube;  
     }
     public static void generateTubeGraphImage(Chart cm,String path)
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
		Bounds bo = BoundsImpl.create(0, 0, 500,400 ); // IN PIXELS
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
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"tube.png");
                System.out.println("Tube Image Rendered");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
         System.out.println("FinisedTube");
      }
     
     public static Chart generatePurchaseRequisitionPerStatusTube(Double count, String status)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create();
         cwaTube.setType("Tube Chart");
         cwaTube.setSubType("Side-by-side");
         cwaTube.getBlock().setBackground(ColorDefinitionImpl.WHITE());
         cwaTube.getBlock().getOutline().setVisible(true);
         Plot p = cwaTube.getPlot();
         p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
         cwaTube.getTitle().getLabel().getCaption().setValue("");
         Legend lg = cwaTube.getLegend();
         lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Number");
         yAxisPrimary.getTitle().setVisible(true);
         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(new String[] {
             status
         });
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues1 = NumberDataSetImpl.create(count);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal1.setDataSetRepresentation("");
         sdOrthogonal1.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal1);
         OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal2.setDataSetRepresentation("");
         sdOrthogonal2.setSeriesDefinitionIndex(1);
         sd.getOrthogonalSampleData().add(sdOrthogonal2);
         cwaTube.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
         bs1.setRiser(RiserType.TUBE_LITERAL);
         bs1.setDataSet(orthoValues1);
         bs1.getLabel().setVisible(true);
         bs1.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs1);
         return cwaTube;
     }

     public static Chart stockReqAndAvailTube(HashMap list)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create();
         cwaTube.setType("Tube Chart");
         cwaTube.setSubType("Side-by-side");
         cwaTube.getBlock().setBackground(ColorDefinitionImpl.WHITE());
         cwaTube.getBlock().getOutline().setVisible(true);
         Plot p = cwaTube.getPlot();
         p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
         cwaTube.getTitle().getLabel().getCaption().setValue("");
         Legend lg = cwaTube.getLegend();
         lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Number Of Units");
         yAxisPrimary.getTitle().setVisible(true);
         Vector vs = new Vector();
         ArrayList vn1 = new ArrayList();
         ArrayList vn2 = new ArrayList();
         System.out.println((new StringBuilder()).append("Size is ").append(list.size()).toString());
         Set type = list.keySet();
         for(Iterator it = type.iterator(); it.hasNext();)
         {
             String item_Name = (String)it.next();
             vs.add(item_Name);
             System.out.println((new StringBuilder()).append("Item Name").append(item_Name).toString());
             ArrayList listData = (ArrayList)list.get(item_Name);
             int i = 0;
             while(i < listData.size()) 
             {
                 Double db = (Double)listData.get(i);
                 if(i == 0)
                     vn1.add(db);
                 else
                     vn2.add(db);
                 System.out.print((new StringBuilder()).append("Value obtained: for itemName").append(item_Name).append(" ").append(db.doubleValue()).toString());
                 i++;
             }
         }

         org.eclipse.birt.chart.model.data.TextDataSet categoryValues = TextDataSetImpl.create(vs);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues2 = NumberDataSetImpl.create(vn2);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal1.setDataSetRepresentation("Av");
         sdOrthogonal1.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal1);
         OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal2.setDataSetRepresentation("");
         sdOrthogonal2.setSeriesDefinitionIndex(1);
         sd.getOrthogonalSampleData().add(sdOrthogonal2);
         cwaTube.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
         bs1.setRiser(RiserType.TUBE_LITERAL);
         bs1.setDataSet(orthoValues1);
         bs1.getLabel().setVisible(true);
         bs1.setLabelPosition(Position.INSIDE_LITERAL);
         BarSeries bs2 = (BarSeries)BarSeriesImpl.create();
         bs2.setRiser(RiserType.TUBE_LITERAL);
         bs2.setDataSet(orthoValues2);
         bs2.getLabel().setVisible(true);
         bs2.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs1);
         sdY.getSeries().add(bs2);
         return cwaTube;
     }

     public static Chart generateQuarterSalesAllItemParticularYearTube(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create();
         cwaTube.setType("Tube Chart");
         cwaTube.setSubType("Side-by-side");
         cwaTube.getBlock().setBackground(ColorDefinitionImpl.WHITE());
         cwaTube.getBlock().getOutline().setVisible(true);
         Plot p = cwaTube.getPlot();
         p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
         cwaTube.getTitle().getLabel().getCaption().setValue("");
         Legend lg = cwaTube.getLegend();
         lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Sales(Units in Thousands)");
         yAxisPrimary.getTitle().setVisible(true);
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
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal1.setDataSetRepresentation("");
         sdOrthogonal1.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal1);
         OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal2.setDataSetRepresentation("");
         sdOrthogonal2.setSeriesDefinitionIndex(1);
         sd.getOrthogonalSampleData().add(sdOrthogonal2);
         cwaTube.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
         bs1.setRiser(RiserType.TUBE_LITERAL);
         bs1.setDataSet(orthoValues1);
         bs1.getLabel().setVisible(true);
         bs1.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs1);
         return cwaTube;
     }
     
     public static Chart generateQuarterSalesByItemParticularYearTube(ArrayList yearlyEvents)
     {
         ChartWithAxes cwaTube = ChartWithAxesImpl.create();
         cwaTube.setType("Tube Chart");
         cwaTube.setSubType("Side-by-side");
         cwaTube.getBlock().setBackground(ColorDefinitionImpl.WHITE());
         cwaTube.getBlock().getOutline().setVisible(true);
         Plot p = cwaTube.getPlot();
         p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
         cwaTube.getTitle().getLabel().getCaption().setValue("");
         Legend lg = cwaTube.getLegend();
         lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
         Axis xAxisPrimary = cwaTube.getPrimaryBaseAxes()[0];
         xAxisPrimary.setType(AxisType.TEXT_LITERAL);
         xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
         xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
         Axis yAxisPrimary = cwaTube.getPrimaryOrthogonalAxis(xAxisPrimary);
         yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
         yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
         yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
         yAxisPrimary.getTitle().getCaption().setValue("Sales(Units in Thousands)");
         yAxisPrimary.getTitle().setVisible(true);
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
         org.eclipse.birt.chart.model.data.NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
         SampleData sd = DataFactory.eINSTANCE.createSampleData();
         BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
         sdBase.setDataSetRepresentation("");
         sd.getBaseSampleData().add(sdBase);
         OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal1.setDataSetRepresentation("");
         sdOrthogonal1.setSeriesDefinitionIndex(0);
         sd.getOrthogonalSampleData().add(sdOrthogonal1);
         OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
         sdOrthogonal2.setDataSetRepresentation("");
         sdOrthogonal2.setSeriesDefinitionIndex(1);
         sd.getOrthogonalSampleData().add(sdOrthogonal2);
         cwaTube.setSampleData(sd);
         Series seCategory = SeriesImpl.create();
         seCategory.setDataSet(categoryValues);
         SeriesDefinition sdX = SeriesDefinitionImpl.create();
         sdX.getSeriesPalette().shift(0);
         xAxisPrimary.getSeriesDefinitions().add(sdX);
         sdX.getSeries().add(seCategory);
         BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
         bs1.setRiser(RiserType.TUBE_LITERAL);
         bs1.setDataSet(orthoValues1);
         bs1.getLabel().setVisible(true);
         bs1.setLabelPosition(Position.INSIDE_LITERAL);
         SeriesDefinition sdY = SeriesDefinitionImpl.create();
         yAxisPrimary.getSeriesDefinitions().add(sdY);
         sdY.getSeries().add(bs1);
         return cwaTube;
     }

 }

