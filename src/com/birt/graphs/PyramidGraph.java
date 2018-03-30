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
import org.eclipse.birt.chart.model.attribute.ChartDimension;
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
import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.model.api.DesignConfig;
import org.eclipse.birt.report.model.api.IDesignEngine;
import org.eclipse.birt.report.model.api.IDesignEngineFactory;

/**
 *
 * @author admin
 */
public class PyramidGraph {

    public static final Chart createDailySalesPyramid(ArrayList dailyPaymentDet, String year, String month) {
        String monthList[] = {"Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"};
        month = monthList[Integer.parseInt(month)-1];
        System.out.println("month........." + month);
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(""); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Daily Sales" );
	yAxisPrimary.getTitle().setVisible(true);

        Vector vs = new Vector();



        // INITIALIZE A COLLECTION WITH THE Y-SERIES DATA
        ArrayList vn1 = new ArrayList();
        int i = 1;
        for (Iterator it = dailyPaymentDet.iterator(); it.hasNext();) {
            Double db = (Double) it.next();
            vs.add(new Integer(i));  // populating X Axis 
            vn1.add(db);              // populating Y Axis
            i = i + 1;
        }
        System.out.println("afetr month.............");
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);
        System.out.println("Returning from Creating Line");
        return cwaPyramid;
    }

    public static final Chart createMonthlySalesPyramid(ArrayList monthlyPaymentDet, String year) {
        String monthList[] = {"Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sep", "Oct", "Nov", "Dec"};
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(""); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Monthly Sales" );
	yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        int j = 0;
        for (Iterator it = monthlyPaymentDet.iterator(); it.hasNext();) {
            Double db = (Double) it.next();
            vs.add(monthList[j]);
            vn1.add(db);
            j = j + 1;
        }
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }

    public static final Chart createAreaSalesPyramid(ArrayList areaAmount) {
        // String monthList[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(""); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Yearly Sales" );
	yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
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
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }

    public static final Chart createMemberShipSalesPyramid(ArrayList areaDet, String year) {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(""); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
         yAxisPrimary.getTitle( ).getCaption( ).setValue( "Sales" );
	yAxisPrimary.getTitle().setVisible(true);
        // Data Set
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
           

            areaList.add(area);
            j = j + 1;
        }
        TextDataSet categoryValues = TextDataSetImpl.create(areaList); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }
    public static Chart createStatusWiseHumanMembersNumberPyramid(HashMap statusWiseHumanMembers)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue("" ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
	yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
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
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }
    public static Chart createStatusWiseHorseMembersNumberPyramid(HashMap statusWiseHorseMembers)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue("" ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
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
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }







     public static Chart createMembershipWiseHumanNumberByStatusPyramid(HashMap humanMembersMemberShips,String status)
     {
         ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue("" ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
        yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set human=humanMembersMemberShips.keySet();
                            for(Iterator it=human.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)humanMembersMemberShips.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
     }


     public static Chart createMembershipWiseHorseNumberByStatusPyramid(HashMap horseMembersMemberShips,String status)
     {
         ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue("" ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
		yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set horse=horseMembersMemberShips.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersMemberShips.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
     }
 public static Chart createMemTypeWiseNewHorseMembersPyramid(HashMap newlyRegHorseMemberCount)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(" " ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
         yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Horse Member" );
      yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set horse=newlyRegHorseMemberCount.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)newlyRegHorseMemberCount.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Status-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }


 public static Chart createEventsWiseHorseMembersPyramid(HashMap HorseMemberCountEventWise)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(" " ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
        yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
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
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
    }

  public static Chart createMembershipWiseHorseMembersEventsPyramid(HashMap horseMembersEventsMembershipWise)
     {
         ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue(" " ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
         yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Non-Human Members" );
        yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        Set horse=horseMembersEventsMembershipWise.keySet();
                            for(Iterator it=horse.iterator();it.hasNext();)
                            {
                                      String membership_name=(String)it.next();
                                      String total= (String)horseMembersEventsMembershipWise.get(membership_name);
                                      vs.add(membership_name); // populating X axis
                                      vn1.add(Double.valueOf(total));  // populating Y axis
                                      Debug.print("Membership-Name "+membership_name);
                                      Debug.print("Total  For"+" "+total);
                            }
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;
     }
  public static Chart createHumanMembersParticipatedInEventsPyramid(Double count)
  {
     ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart"); //$NON-NLS-1$
        cwaPyramid.setSubType("Side-by-side"); //$NON-NLS-1$
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        // Plot
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255,
                255,
                225));

        // Title
        cwaPyramid.getTitle().getLabel().getCaption().setValue("" ); //$NON-NLS-1$

        // Legend
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);

        // X-Axis
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];

        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);

        // Y-Axis
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90);
        yAxisPrimary.getTitle( ).getCaption( ).setValue( "Number Of Human Members" );
        yAxisPrimary.getTitle().setVisible(true);
        // Data Set
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        
                                      vs.add("Human Members"); // populating X axis
                                      vn1.add(count);  // populating Y axis
                                       
        TextDataSet categoryValues = TextDataSetImpl.create(vs); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$ //$NON-NLS-4$ //$NON-NLS-5$
        NumberDataSet orthoValues1 = NumberDataSetImpl.create(vn1);
        //NumberDataSet orthoValues2 = NumberDataSetImpl.create( new double[]{
        //5, 10, 25, 10, 5
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

        cwaPyramid.setSampleData(sd);

        // X-Series
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);

        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);

        // Y-Series
        BarSeries bs1 = (BarSeries) BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);

        BarSeries bs2 = (BarSeries) BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        //bs2.setDataSet( orthoValues2 );
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);

        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);

        return cwaPyramid;  
  }

    public static void generatePyramidGraphImage(Chart cm, String path) {

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
        idr.setProperty(IDeviceRenderer.FILE_IDENTIFIER, path + "PyramidChart.png");
        try {
            gr.render(idr, gcs);
        } catch (ChartException rex) {
            DefaultLoggerImpl.instance().log(rex);
        }
        System.out.println("FinisedPyramid");

    }
    
    public static Chart generatePurchaseRequisitionPerStatusPyramid(Double count, String status)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart");
        cwaPyramid.setSubType("Side-by-side");
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaPyramid.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Number");
        yAxisPrimary.getTitle().setVisible(true);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        vs.add(status);
        vn1.add(count);
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
        cwaPyramid.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        BarSeries bs2 = (BarSeries)BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);
        return cwaPyramid;
    }
    
    public static Chart stockReqAndAvailPyramidGraph(HashMap list)
    {
        ChartWithAxes cwaPyramid = ChartWithAxesImpl.create();
        cwaPyramid.setType("Pyramid Chart");
        cwaPyramid.setSubType("Side-by-side");
        cwaPyramid.setDimension(ChartDimension.TWO_DIMENSIONAL_WITH_DEPTH_LITERAL);
        cwaPyramid.getBlock().setBackground(ColorDefinitionImpl.WHITE());
        cwaPyramid.getBlock().getOutline().setVisible(true);
        Plot p = cwaPyramid.getPlot();
        p.getClientArea().setBackground(ColorDefinitionImpl.create(255, 255, 225));
        cwaPyramid.getTitle().getLabel().getCaption().setValue("");
        Legend lg = cwaPyramid.getLegend();
        lg.setItemType(LegendItemType.CATEGORIES_LITERAL);
        Axis xAxisPrimary = cwaPyramid.getPrimaryBaseAxes()[0];
        xAxisPrimary.setType(AxisType.TEXT_LITERAL);
        xAxisPrimary.getMajorGrid().setTickStyle(TickStyle.BELOW_LITERAL);
        xAxisPrimary.getOrigin().setType(IntersectionType.MIN_LITERAL);
        Axis yAxisPrimary = cwaPyramid.getPrimaryOrthogonalAxis(xAxisPrimary);
        yAxisPrimary.getMajorGrid().setTickStyle(TickStyle.LEFT_LITERAL);
        yAxisPrimary.setType(AxisType.LINEAR_LITERAL);
        yAxisPrimary.getLabel().getCaption().getFont().setRotation(90D);
        yAxisPrimary.getTitle().getCaption().setValue("Number Of Units");
        yAxisPrimary.getTitle().setVisible(true);
        ArrayList vs = new ArrayList();
        ArrayList vn1 = new ArrayList();
        ArrayList vn2 = new ArrayList();
        Set type = list.keySet();
        for(Iterator it = type.iterator(); it.hasNext();)
        {
            String item_Name = (String)it.next();
            System.out.println((new StringBuilder()).append("Item Name").append(item_Name).toString());
            vs.add(item_Name);
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
        cwaPyramid.setSampleData(sd);
        Series seCategory = SeriesImpl.create();
        seCategory.setDataSet(categoryValues);
        SeriesDefinition sdX = SeriesDefinitionImpl.create();
        sdX.getSeriesPalette().shift(0);
        xAxisPrimary.getSeriesDefinitions().add(sdX);
        sdX.getSeries().add(seCategory);
        BarSeries bs1 = (BarSeries)BarSeriesImpl.create();
        bs1.setRiser(RiserType.TRIANGLE_LITERAL);
        bs1.setDataSet(orthoValues1);
        bs1.getLabel().setVisible(true);
        bs1.setLabelPosition(Position.INSIDE_LITERAL);
        BarSeries bs2 = (BarSeries)BarSeriesImpl.create();
        bs2.setRiser(RiserType.TRIANGLE_LITERAL);
        bs2.setDataSet(orthoValues2);
        bs2.getLabel().setVisible(true);
        bs2.setLabelPosition(Position.INSIDE_LITERAL);
        SeriesDefinition sdY = SeriesDefinitionImpl.create();
        yAxisPrimary.getSeriesDefinitions().add(sdY);
        sdY.getSeries().add(bs1);
        sdY.getSeries().add(bs2);
        return cwaPyramid;
    }

}
