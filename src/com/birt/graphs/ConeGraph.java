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
import org.eclipse.birt.chart.device.IDeviceRenderer;
import org.eclipse.birt.chart.device.IDisplayServer;
import org.eclipse.birt.chart.exception.ChartException;
import org.eclipse.birt.chart.factory.Generator;
import org.eclipse.birt.chart.internal.log.DefaultLoggerImpl;
import org.eclipse.birt.chart.log.ILogger;
import org.eclipse.birt.chart.model.Chart;
import org.eclipse.birt.chart.model.ChartWithAxes;
import org.eclipse.birt.chart.model.attribute.*;
import org.eclipse.birt.chart.model.attribute.impl.*;
import org.eclipse.birt.chart.model.component.*;
import org.eclipse.birt.chart.model.component.impl.AxisImpl;
import org.eclipse.birt.chart.model.component.impl.SeriesImpl;
import org.eclipse.birt.chart.model.data.*;
import org.eclipse.birt.chart.model.data.impl.*;
import org.eclipse.birt.chart.model.impl.ChartWithAxesImpl;
import org.eclipse.birt.chart.model.layout.*;
import org.eclipse.birt.chart.model.type.BarSeries;
import org.eclipse.birt.chart.model.type.impl.BarSeriesImpl;
import org.eclipse.birt.chart.util.PluginSettings;
import org.eclipse.emf.common.util.EList;
/**
 *
 * @author parteek
 */
public class ConeGraph {
    public static Chart createHumanMembersSpecificMembershipByStatusCone(String total,String membership_Name,String status_Name){
    ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
    }

     public static Chart createHorseMembersSpecificMembershipByStatusCone(String total,String membership_Name,String status_Name){
    ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
    }
      public static Chart createTotalHumanMembersAreaWiseCone(ArrayList totalHumanAreaWise)
     {
          ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
     }
         public static Chart createHorseMembersEventsCone(String total,String year){
    ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
    }
        public static Chart createHumanMembersSpecificAreaAndMembershipTypeCone(int total,String membership_Name,String area_name)
        {
             ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Member" );
		yAxisPrimary.getTitle().setVisible(true);
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				membership_Name+" in "+area_name} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new Double
				(total)
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
        }
        public static Chart createTotalDonationAmountCone(double total)
         {
             ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Amount in $" );
		yAxisPrimary.getTitle().setVisible(true); 
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Donations"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create( new Double
				(total)
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
           
         }
        public static Chart generateTotalDonationAmountForAllDonationItemsCone(ArrayList totalDonationAmountForAllDonationItems)
        {
            ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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
		TextDataSet categoryValues = TextDataSetImpl.create( vs ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
        }
        public static Chart createHumanMembersParticipatedInEventsCone(Double count)
        {
          ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
		yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
		yAxisPrimary.setType( AxisType.LINEAR_LITERAL );
		yAxisPrimary.getLabel( ).getCaption( ).getFont( ).setRotation( 90 );
                yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
		TextDataSet categoryValues = TextDataSetImpl.create( new String[]{
				"Human Members"} ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
		NumberDataSet orthoValues1 = NumberDataSetImpl.create(
				count
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;  
        }
        public static Chart generateMembersJoinedForParticularYearCone(java.util.LinkedHashMap membersCount)
        {
          ChartWithAxes cwaCone = ChartWithAxesImpl.create( );
		cwaCone.setType( "Cone Chart" ); //$NON-NLS-1$
		cwaCone.setSubType( "Side-by-side" ); //$NON-NLS-1$
		// Plot
		cwaCone.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
		cwaCone.getBlock( ).getOutline( ).setVisible( true );
		Plot p = cwaCone.getPlot( );
		p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
				255,
				225 ) );

		// Title
		cwaCone.getTitle( )
				.getLabel( )
				.getCaption( )
				.setValue(""); //$NON-NLS-1$ Title

		// Legend
		Legend lg = cwaCone.getLegend( );
		lg.setItemType( LegendItemType.CATEGORIES_LITERAL );

		// X-Axis
		Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes( )[0];

		xAxisPrimary.setType( AxisType.TEXT_LITERAL );
		xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
		xAxisPrimary.getOrigin( ).setType( IntersectionType.MIN_LITERAL );

		// Y-Axis
		Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis( xAxisPrimary );
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
                                              vn1.add(total);vs.add(month_Name);
                                              System.out.print("Month "+month_Name);
                                             System.out.print("Total  For"+total.intValue());
                                    }
             // Data Set
		TextDataSet categoryValues = TextDataSetImpl.create( vs ); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
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

		cwaCone.setSampleData( sd );

		// X-Series
		Series seCategory = SeriesImpl.create( );
		seCategory.setDataSet( categoryValues );

		SeriesDefinition sdX = SeriesDefinitionImpl.create( );
		sdX.getSeriesPalette( ).shift( 0 );
		xAxisPrimary.getSeriesDefinitions( ).add( sdX );
		sdX.getSeries( ).add( seCategory );

		// Y-Series
		BarSeries bs1 = (BarSeries) BarSeriesImpl.create( );
		bs1.setRiser( RiserType.CONE_LITERAL );
		bs1.setDataSet( orthoValues1 );
		bs1.getLabel( ).setVisible( true );
		bs1.setLabelPosition( Position.INSIDE_LITERAL );

		/*BarSeries bs2 = (BarSeries) BarSeriesImpl.create( );
		bs2.setRiser( RiserType.CONE_LITERAL );
		bs2.setDataSet( orthoValues2 );
		bs2.getLabel( ).setVisible( true );
		bs2.setLabelPosition( Position.INSIDE_LITERAL );*/

		SeriesDefinition sdY = SeriesDefinitionImpl.create( );
		yAxisPrimary.getSeriesDefinitions( ).add( sdY );
		sdY.getSeries( ).add( bs1 );
		//sdY.getSeries( ).add( bs2 );

		return cwaCone;
          
        }
    public static void generateConeGraphImage(Chart cm,String path)
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
		idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path+"cone.png");
                System.out.println("Cone Image Rendered");
		try {
		gr.render(idr, gcs);
		} catch (ChartException rex)
		{
		DefaultLoggerImpl.instance().log(rex);
		}
         System.out.println("FinisedCone");
      }
    
    public static Chart generatePurchaseRequisitionPeriodWiseCone(ArrayList totalHumanAreaWise)
    {
        ChartWithAxes cwaCone = ChartWithAxesImpl.create();
        cwaCone.setType("Cone Chart");
        cwaCone.setSubType("Side-by-side");
        cwaCone.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaCone.getBlock().getOutline().setVisible(true);
        Plot p = cwaCone.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaCone.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaCone.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Purchase Requisitions");
        yAxisPrimary.getTitle().setVisible(true);
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < totalHumanAreaWise.size(); i++)
        {
            HashMap humanMembersCountStatusWise = (HashMap)totalHumanAreaWise.get(i);
            Set human = humanMembersCountStatusWise.keySet();
            Double total;
            for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
            {
                String area_name = (String)it.next();
                total = (Double)humanMembersCountStatusWise.get(area_name);
                vs.add(area_name);
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
        cwaCone.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.CONE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        return cwaCone;
    }

    
    public static Chart generatePurchaseRequisitionPerStatusCone(Double count, String status)
    {
        ChartWithAxes cwaCone = ChartWithAxesImpl.create();
        cwaCone.setType("Cone Chart");
        cwaCone.setSubType("Side-by-side");
        cwaCone.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaCone.getBlock().getOutline().setVisible(true);
        Plot p = cwaCone.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaCone.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaCone.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis(xAxisPrimary);
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
        cwaCone.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.CONE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        return cwaCone;
    }
    
    
    
    public static Chart stockReqAndAvailCone(HashMap list)
    {
        ChartWithAxes cwaBar = ChartWithAxesImpl.create();
        cwaBar.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwaBar.setType("Bar Chart");
        cwaBar.setSubType("Side-by-side");
        cwaBar.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaBar.getBlock().getOutline().setVisible(true);
        cwaBar.getTitle().getLabel().getCaption().setValue("");
        cwaBar.getLegend().setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaBar.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaBar.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Number Of Units");
        yAxisPrimary.getTitle().setVisible(true);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
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
        sdOrthogonal1.setDataSetRepresentation("");
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);
        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);
        cwaBar.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.OUTSIDE_LITERAL);
        BarSeries bs2 = (BarSeries)BarSeriesImpl.create();
        bs2.setDataSet(orthoValues2);
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.OUTSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwaBar.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwaBar;
    }
 
    public static Chart generateVendorAnalysisReportCone(ArrayList totalHumanAreaWise, String yAxis)
    {
        ChartWithAxes cwaCone = ChartWithAxesImpl.create();
        cwaCone.setType("Cone Chart");
        cwaCone.setSubType("Side-by-side");
        cwaCone.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaCone.getBlock().getOutline().setVisible(true);
        Plot p = cwaCone.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaCone.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaCone.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue(yAxis);
        yAxisPrimary.getTitle().setVisible(true);
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < totalHumanAreaWise.size(); i++)
        {
            HashMap humanMembersCountStatusWise = (HashMap)totalHumanAreaWise.get(i);
            Set human = humanMembersCountStatusWise.keySet();
            Double total;
            for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
            {
                String area_name = (String)it.next();
                total = (Double)humanMembersCountStatusWise.get(area_name);
                vs.add(area_name);
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
        cwaCone.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.CONE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        return cwaCone;
    }

    public static Chart generateQuarterSalesByItemParticularYearCone(ArrayList totalHumanAreaWise)
    {
        ChartWithAxes cwaCone = ChartWithAxesImpl.create();
        cwaCone.setType("Cone Chart");
        cwaCone.setSubType("Side-by-side");
        cwaCone.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaCone.getBlock().getOutline().setVisible(true);
        Plot p = cwaCone.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaCone.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaCone.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Sales($Million)");
        yAxisPrimary.getTitle().setVisible(true);
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < totalHumanAreaWise.size(); i++)
        {
            LinkedHashMap humanMembersCountStatusWise = (LinkedHashMap)totalHumanAreaWise.get(i);
            Set human = humanMembersCountStatusWise.keySet();
            Double total;
            for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
            {
                String area_name = (String)it.next();
                total = (Double)humanMembersCountStatusWise.get(area_name);
                vs.add(area_name);
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
        cwaCone.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.CONE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        return cwaCone;
    }

    public static Chart generateQuarterSalesAllItemParticularYearCone(ArrayList totalHumanAreaWise)
    {
        ChartWithAxes cwaCone = ChartWithAxesImpl.create();
        cwaCone.setType("Cone Chart");
        cwaCone.setSubType("Side-by-side");
        cwaCone.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaCone.getBlock().getOutline().setVisible(true);
        Plot p = cwaCone.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaCone.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaCone.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaCone.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaCone.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Sales($Million)");
        yAxisPrimary.getTitle().setVisible(true);
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < totalHumanAreaWise.size(); i++)
        {
            HashMap humanMembersCountStatusWise = (HashMap)totalHumanAreaWise.get(i);
            Set human = humanMembersCountStatusWise.keySet();
            Double total;
            for(Iterator it = human.iterator(); it.hasNext(); vn1.add(total))
            {
                String area_name = (String)it.next();
                total = (Double)humanMembersCountStatusWise.get(area_name);
                vs.add(area_name);
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
        cwaCone.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.CONE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        return cwaCone;
    }

}
