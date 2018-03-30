/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.birt.graphs;

import com.hlcmrm.util.Debug;
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
import org.eclipse.birt.chart.model.attribute.Angle3D;
import org.eclipse.birt.chart.model.attribute.AxisType;
import org.eclipse.birt.chart.model.attribute.Bounds;
import org.eclipse.birt.chart.model.attribute.ChartDimension;
import org.eclipse.birt.chart.model.attribute.IntersectionType;
import org.eclipse.birt.chart.model.attribute.Marker;
import org.eclipse.birt.chart.model.attribute.MarkerType;
import org.eclipse.birt.chart.model.attribute.Orientation;
import org.eclipse.birt.chart.model.attribute.Position;
import org.eclipse.birt.chart.model.attribute.TickStyle;
import org.eclipse.birt.chart.model.attribute.impl.Angle3DImpl;
import org.eclipse.birt.chart.model.attribute.impl.BoundsImpl;
import org.eclipse.birt.chart.model.attribute.impl.ColorDefinitionImpl;
import org.eclipse.birt.chart.model.attribute.impl.Rotation3DImpl;
import org.eclipse.birt.chart.model.component.Axis;
import org.eclipse.birt.chart.model.component.Series;
import org.eclipse.birt.chart.model.component.impl.AxisImpl;
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
import org.eclipse.birt.chart.model.type.LineSeries;
import org.eclipse.birt.chart.model.type.impl.LineSeriesImpl;
import org.eclipse.birt.chart.util.PluginSettings;
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.model.api.DesignConfig;
import org.eclipse.birt.report.model.api.IDesignEngine;
import org.eclipse.birt.report.model.api.IDesignEngineFactory;

/**
 *
 * @author hadatta
 */
public class LineGraph {

    public static Chart createDailySalesLine(ArrayList dailyPaymentDet, String year, String month) {
        String monthList[] = {"Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"};
        month = monthList[Integer.parseInt(month) - 1];

        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        // Data Set   
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        int j = 1;
        for (Iterator it = dailyPaymentDet.iterator(); it.hasNext();) {
            Double db = (Double) it.next();
            vs.add(new Integer(j));
            vn1.add(db);
            j = j + 1;
        }

        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create(vn1);

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }
    /* public static Chart createYearlySalesLine(HashMap yearlySales)
    {
    //String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
    // month=monthList[Integer.parseInt(month)];
    ChartWithAxes cwa3DLine = ChartWithAxesImpl.create( );
    cwa3DLine.setDimension( ChartDimension.THREE_DIMENSIONAL_LITERAL );
    cwa3DLine.setType( "Line Chart" ); //$NON-NLS-1$
    cwa3DLine.setSubType( "Overlay" ); //$NON-NLS-1$
    // Plot
    cwa3DLine.getBlock( ).setBackground( ColorDefinitionImpl.WHITE( ) );
    Plot p = cwa3DLine.getPlot( );
    p.getClientArea( ).setBackground( ColorDefinitionImpl.create( 255,
    255,
    225 ) );
    // Title
    cwa3DLine.getTitle( )
    .getLabel( )
    .getCaption( )
    .setValue( "Yearly Sales Report For year 2006-2009");//$NON-NLS-1$
    // X-Axis
    Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes( )[0];
    xAxisPrimary.setType( AxisType.TEXT_LITERAL );
    xAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
    xAxisPrimary.getOrigin( ).setType( IntersectionType.VALUE_LITERAL );
    // Y-Axis
    Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis( xAxisPrimary );
    yAxisPrimary.getMajorGrid( ).setTickStyle( TickStyle.LEFT_LITERAL );
    // Z-Axis
    Axis zAxis = AxisImpl.create( Axis.ANCILLARY_BASE );
    zAxis.setType( AxisType.TEXT_LITERAL );
    zAxis.setLabelPosition( Position.BELOW_LITERAL );
    zAxis.setTitlePosition( Position.BELOW_LITERAL );
    zAxis.getMajorGrid( ).setTickStyle( TickStyle.BELOW_LITERAL );
    zAxis.setOrientation( Orientation.HORIZONTAL_LITERAL );
    xAxisPrimary.getAncillaryAxes( ).add( zAxis );
    // Data Set   
    Vector vs = new Vector();
    ArrayList vn1 = new ArrayList();
    Set set=yearlySales.keySet();
    for(Iterator it=set.iterator();it.hasNext();)
    {
    Integer year= (Integer)it.next();
    Double amount=(Double)yearlySales.get(year);
    vs.add(year);  
    vn1.add(amount);              
    }
    TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
    NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
    NumberDataSet orthoValues2 = NumberDataSetImpl.create(vn1 );
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
    cwa3DLine.setSampleData( sd );
    // X-Series
    Series seCategory = SeriesImpl.create( );
    seCategory.setDataSet( categoryValues );
    SeriesDefinition sdX = SeriesDefinitionImpl.create( );
    xAxisPrimary.getSeriesDefinitions( ).add( sdX );
    sdX.getSeries( ).add( seCategory );
    // Y-Series
    LineSeries ls1 = (LineSeries) LineSeriesImpl.create( );
    ls1.setDataSet( orthoValues1 );
    ls1.getLineAttributes( ).setColor( ColorDefinitionImpl.CREAM( ) );
    for ( int i = 0; i < ls1.getMarkers( ).size( ); i++ )
    {
    ( (Marker) ls1.getMarkers( ).get( i ) ).setType( MarkerType.TRIANGLE_LITERAL );
    }
    ls1.getLabel( ).setVisible( true );
    ls1.setPaletteLineColor( true );
    // z-Series
    LineSeries ls2 = (LineSeries) LineSeriesImpl.create( );
    ls2.setDataSet( orthoValues2 );
    ls2.getLineAttributes( ).setColor( ColorDefinitionImpl.CREAM( ) );
    for ( int i = 0; i < ls2.getMarkers( ).size( ); i++ )
    {
    ( (Marker) ls2.getMarkers( ).get( i ) ).setType( MarkerType.TRIANGLE_LITERAL );
    }
    ls2.getLabel( ).setVisible( true );
    ls2.setPaletteLineColor( true );
    SeriesDefinition sdY = SeriesDefinitionImpl.create( );
    sdY.getSeriesPalette( ).shift( -1 );
    yAxisPrimary.getSeriesDefinitions( ).add( sdY );
    sdY.getSeries( ).add( ls1 );
    sdY.getSeries( ).add( ls2 );
    // Z-Series
    SeriesDefinition sdZ = SeriesDefinitionImpl.create( );
    zAxis.getSeriesDefinitions( ).add( sdZ );
    // Rotate the chart
    cwa3DLine.setRotation( Rotation3DImpl.create( new Angle3D[]{
    Angle3DImpl.create( -10, 25, 0 )
    } ) );
    return cwa3DLine;
    }*/

    public static Chart createMonthlySalesLine(ArrayList monthlyPaymentDet, String year) {
        String monthList[] = {"Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"};
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        int j = 0;
        for (Iterator it = monthlyPaymentDet.iterator(); it.hasNext();) {
            Double db = (Double) it.next();
            vs.add(monthList[j]);
            vn1.add(db);
            j = j + 1;
        }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }

    public static Chart createMemberShipSalesLine(ArrayList areaDet, String year) {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList areaList = new ArrayList();
        ArrayList vn1 = new ArrayList();
        String area = null;
        int j = 1;
        for (Iterator it = areaDet.iterator(); it.hasNext();) {
            Double db = (Double) it.next();

            vn1.add(db);
            if (j == 1) {
                area = "Junior Member";
            }
            if (j == 2) {
                area = "Non-Competing Member";
            }
            if (j == 3) {
                area = "Subscribing Member";
            }
            if (j == 4) {
                area = "Family Member";
            }
            if (j == 5) {
                area = "Full Member";
            }
            if (j == 6) {
                area = "Life Member";
            }
            j = j + 1;

            areaList.add(area);
        }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(areaList);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }

    public static Chart createAreaSalesLine(ArrayList areaAmount) {
        // String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
        // month=monthList[Integer.parseInt(month)];

        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        // Data Set   
        Vector vs = new Vector();
        ArrayList vn1 = new ArrayList();
        int j = 1;
        String area = null;
        for (Iterator it = areaAmount.iterator(); it.hasNext();) {
            Double db = (Double) it.next();
            if (j == 1) {
                area = "Area I";
            }
            if (j == 2) {
                area = "Area II";
            }
            if (j == 3) {
                area = "Area III";
            }
            if (j == 4) {
                area = "Area IV";
            }
            if (j == 5) {
                area = "Area V";
            }
            if (j == 6) {
                area = "Area VI";
            }
            if (j == 7) {
                area = "Area VII";
            }
            if (j == 8) {
                area = "Area VIII";
            }
            if (j == 9) {
                area = "Area IX";
            }
            if (j == 10) {
                area = "Area X";
            }
            if (j == 11) {
                area = "Area XI";
            }
            vs.add(area);
            vn1.add(db);
            j = j + 1;
        }

        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create(vn1);

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }
    
         public static Chart createStatusWiseHumanMembersNumberLine(HashMap statusWiseHumanMembers)
         {
             ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("" );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
        yAxisPrimary.getTitle().setVisible(true);
        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
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
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
         }


   public static Chart createStatusWiseHorseMembersNumberLine(HashMap statusWiseHorseMembers)
         {
             ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("" );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
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
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
         }




    public static Chart createMembershipWiseHumanNumberByStatusLine(HashMap humanMembersMemberShips,String status)
    {
              ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("" );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        
        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set human=humanMembersMemberShips.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)humanMembersMemberShips.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Mebership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }


     public static Chart createMembershipWiseHorseNumberByStatusLine(HashMap horseMembersMemberShips,String status)
    {
              ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("" );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        
        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set horse=horseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersMemberShips.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Mebership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }
 
 public static Chart createMemTypeWiseNewHorseMembersLine(HashMap newlyRegHorseMemberCount)
         {
             ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue(" " );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
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
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
         }
public static Chart createEventsWiseHorseMembersLine(HashMap HorseMemberCountEventWise)
         {
             ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("" );//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set human=HorseMemberCountEventWise.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String year=(String)it.next();
                                      String total= (String)HorseMemberCountEventWise.get(year);
                                      vs.add(year);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Year "+year);
                                      Debug.print("Total  For"+" "+total);
                            }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
         }

 public static Chart createMembershipWiseHorseMembersEventsLine(HashMap horseMembersEventsMembershipWise)
    {
              ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);

        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set horse=horseMembersEventsMembershipWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersEventsMembershipWise.get(membership_name);
                                      vs.add(membership_name);
                                      vn1.add(Double.valueOf(total));
                                      Debug.print("Mebership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine;
    }
    public static Chart createEventsAreaWiseForEventTypeLine(ArrayList eventTypes)
    {
       ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart"); //$NON-NLS-1$
        cwa3DLine.setSubType("Overlay"); //$NON-NLS-1$

        // Plot
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");//$NON-NLS-1$

        // X-Axis
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        //yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Conducted" );
        //yAxisPrimary.getTitle().setVisible(true);
        // Z-Axis
        Axis zAxis = AxisImpl.create(Axis.ANCILLARY_BASE);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        //-------
        for(int i=0;i<eventTypes.size();i++)
                         {
                                    HashMap typeWise=(HashMap)eventTypes.get(i);
                                            Set type=typeWise.keySet();
                                            for(Iterator it=type.iterator();it.hasNext();)
                                            {
                                                 String area_Name=(String)it.next();
                                                 Double db=(Double)typeWise.get(area_Name);
                                                 vs.add(area_Name);
                                                 vn1.add(db);
                                                 //Debug.print("Event Type Name is:"+area_Name+"  Count is "+db.doubleValue());
                                            }
                         }
        // Data Set
        TextDataSet categoryValues = TextDataSetImpl.create(vs);//$NON-NLS-1$//$NON-NLS-2$//$NON-NLS-3$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //15, 10, 25
        //} );

        SampleData sd = DataFactory.eINSTANCE.createSampleData();
        BaseSampleData sdBase = DataFactory.eINSTANCE.createBaseSampleData();
        sdBase.setDataSetRepresentation("");//$NON-NLS-1$
        sd.getBaseSampleData().add(sdBase);

        OrthogonalSampleData sdOrthogonal1 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal1.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal1.setSeriesDefinitionIndex(0);
        sd.getOrthogonalSampleData().add(sdOrthogonal1);

        OrthogonalSampleData sdOrthogonal2 = DataFactory.eINSTANCE.createOrthogonalSampleData();
        sdOrthogonal2.setDataSetRepresentation("");//$NON-NLS-1$
        sdOrthogonal2.setSeriesDefinitionIndex(1);
        sd.getOrthogonalSampleData().add(sdOrthogonal2);

        cwa3DLine.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();

        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        LineSeries ls1 = (LineSeries) LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls1.getMarkers().size(); i++) {
            ((Marker) ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);

        // Y-Series
        LineSeries ls2 = (LineSeries) LineSeriesImpl.create();
        //ls2.setDataSet( orthoValues2 );
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for (int i = 0; i < ls2.getMarkers().size(); i++) {
            ((Marker) ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);
        }
        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);


        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);

        // Z-Series
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);

        // Rotate the chart
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[]{
            Angle3DImpl.create(-10, 25, 0)
        }));

        return cwa3DLine; 
    }

    public static void generateLineGraphImage(Chart cm, String path) {

        // OBTAIN A PNG IMAGE DEVICE RENDERER
        PluginSettings ps = PluginSettings.instance();
        IDeviceRenderer idr = null;
        try {
            idr = ps.getDevice("dv.PNG");
        } catch (ChartException pex) {
            DefaultLoggerImpl.instance().log(pex);
        }

        // DEFINE THE BOUNDS AND CONVERT INTO POINTS
        Bounds bo = BoundsImpl.create(0, 0, 500, 400); // IN PIXELS
        bo.scale(72d / idr.getDisplayServer().getDpiResolution()); // CONVERTED TO POINTS

        // BUILD THE RENDERED CHART STRUCTURE
        Generator gr = Generator.instance();
        GeneratedChartState gcs = null;
        try {
            gcs = gr.build(
                    idr.getDisplayServer(),
                    cm, null,
                    bo, null);
        } catch (ChartException gex) {
            DefaultLoggerImpl.instance().log(gex);
            System.exit(0);
        }

        // RENDER THE CHART TO A PNG FILE
        new BufferedImage((int) bo.getWidth(), (int) bo.getHeight(), BufferedImage.TYPE_INT_ARGB);
        idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path + "Linechart.png");
        try {
            gr.render(idr, gcs);
        } catch (ChartException rex) {
            DefaultLoggerImpl.instance().log(rex);
        }
        System.out.println("FinisedLine");
    }
    
    public static Chart generatePurchaseRequisitionPeriodWisLine(ArrayList eventTypes)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < eventTypes.size(); i++)
        {
            HashMap typeWise = (HashMap)eventTypes.get(i);
            Set type = typeWise.keySet();
            Double db;
            for(Iterator it = type.iterator(); it.hasNext(); vn1.add(db))
            {
                String area_Name = (String)it.next();
                db = (Double)typeWise.get(area_Name);
                vs.add(area_Name);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }
    public static Chart getStockAndAvailLine(HashMap list)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.setDataSet(orthoValues2);
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }
    public static Chart generateVendorAnalysisReportLine(ArrayList eventTypes)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < eventTypes.size(); i++)
        {
            HashMap typeWise = (HashMap)eventTypes.get(i);
            Set type = typeWise.keySet();
            Double db;
            for(Iterator it = type.iterator(); it.hasNext(); vn1.add(db))
            {
                String area_Name = (String)it.next();
                db = (Double)typeWise.get(area_Name);
                vs.add(area_Name);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }
    
    public static Chart generateQuarterSalesByItemParticularYearLine(ArrayList eventTypes)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < eventTypes.size(); i++)
        {
            LinkedHashMap typeWise = (LinkedHashMap)eventTypes.get(i);
            Set type = typeWise.keySet();
            Double db;
            for(Iterator it = type.iterator(); it.hasNext(); vn1.add(db))
            {
                String area_Name = (String)it.next();
                db = (Double)typeWise.get(area_Name);
                vs.add(area_Name);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }

    public static Chart generateQuarterSalesAllItemParticularYearLine(ArrayList eventTypes)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < eventTypes.size(); i++)
        {
            HashMap typeWise = (HashMap)eventTypes.get(i);
            Set type = typeWise.keySet();
            Double db;
            for(Iterator it = type.iterator(); it.hasNext(); vn1.add(db))
            {
                String area_Name = (String)it.next();
                db = (Double)typeWise.get(area_Name);
                vs.add(area_Name);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }
    
    public static Chart generateQuarterVolumeSalesByItemParticularYearLine(ArrayList eventTypes)
    {
        ChartWithAxes cwa3DLine = ChartWithAxesImpl.create();
        cwa3DLine.setDimension(ChartDimension.THREE_DIMENSIONAL_LITERAL);
        cwa3DLine.setType("Line Chart");
        cwa3DLine.setSubType("Overlay");
        cwa3DLine.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        Plot p = cwa3DLine.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwa3DLine.getTitle().getLabel().getCaption().setValue("");
        Axis xAxisPrimary = cwa3DLine.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.VALUE_LITERAL);
        Axis yAxisPrimary = cwa3DLine.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        Axis zAxis = AxisImpl.create(3);
        zAxis.setType(AxisType.TEXT_LITERAL);
        zAxis.setLabelPosition(Position.BELOW_LITERAL);
        zAxis.setTitlePosition(Position.BELOW_LITERAL);
        zAxis.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        zAxis.setOrientation(Orientation.HORIZONTAL_LITERAL);
        xAxisPrimary.getAncillaryAxes().add(zAxis);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        for(int i = 0; i < eventTypes.size(); i++)
        {
            LinkedHashMap typeWise = (LinkedHashMap)eventTypes.get(i);
            Set type = typeWise.keySet();
            Double db;
            for(Iterator it = type.iterator(); it.hasNext(); vn1.add(db))
            {
                String area_Name = (String)it.next();
                db = (Double)typeWise.get(area_Name);
                vs.add(area_Name);
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
        cwa3DLine.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        LineSeries ls1 = (LineSeries)LineSeriesImpl.create();
        ls1.setDataSet(orthoValues1);
        ls1.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls1.getMarkers().size(); i++)
            ((Marker)ls1.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls1.getLabel().setVisible(true);
        ls1.setPaletteLineColor(true);
        LineSeries ls2 = (LineSeries)LineSeriesImpl.create();
        ls2.getLineAttributes().setColor(ColorDefinitionImpl.CREAM());
        for(int i = 0; i < ls2.getMarkers().size(); i++)
            ((Marker)ls2.getMarkers().get(i)).setType(MarkerType.TRIANGLE_LITERAL);

        ls2.getLabel().setVisible(true);
        ls2.setPaletteLineColor(true);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        sdY.getSeriesPalette().shift(-1);
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(ls1);
        sdY.getSeries().add(ls2);
        SeriesDefinition sdZ = SeriesDefinitionImpl.create();
        zAxis.getSeriesDefinitions().add(sdZ);
        cwa3DLine.setRotation(Rotation3DImpl.create(new Angle3D[] {
            Angle3DImpl.create(-10D, 25D, 0.0D)
        }));
        return cwa3DLine;
    }


}


