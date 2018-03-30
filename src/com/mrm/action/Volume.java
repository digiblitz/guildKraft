/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
// Decompiled by DJ v3.12.12.96 Copyright 2011 Atanas Neshkov  Date: 19-03-2012 10:29:04
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Volume.java

package com.mrm.action;


public class Volume
{

    public Volume()
    {
        quarter = null;
        unitSales = null;
    }

    public String getQuarter()
    {
        return quarter;
    }

    public void setQuarter(String quarter)
    {
        this.quarter = quarter;
    }

    public Double getUnitSales()
    {
        return unitSales;
    }

    public void setUnitSales(Double unitSales)
    {
        this.unitSales = unitSales;
    }

    String quarter;
    Double unitSales;
}
