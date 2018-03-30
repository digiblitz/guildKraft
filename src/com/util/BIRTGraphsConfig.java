/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import org.eclipse.birt.core.framework.Platform;
import org.eclipse.birt.report.model.api.DesignConfig;
import org.eclipse.birt.report.model.api.IDesignEngine;
import org.eclipse.birt.report.model.api.IDesignEngineFactory;
import javax.servlet.ServletContext;
import org.eclipse.birt.core.exception.BirtException;
import org.eclipse.birt.core.exception.BirtException;
import org.eclipse.birt.core.framework.IPlatformContext;
import org.eclipse.birt.core.framework.PlatformServletContext;
import org.eclipse.birt.report.engine.api.EngineConfig;
import org.eclipse.birt.report.engine.api.IReportEngine;
import org.eclipse.birt.report.engine.api.IReportEngineFactory;
/**
 *
 * @author parteek
 */
public class BIRTGraphsConfig {
    
    public static void initializeDesignConfig(ServletContext theApplicationsServletContext)
    {
       
        IPlatformContext context = new PlatformServletContext(theApplicationsServletContext);
		IReportEngine birtEngine=null;
		EngineConfig config = new EngineConfig();
                config.setEngineHome("");
                config.setPlatformContext(context);
                config.setPlatformContext( context );
                try {
            Platform.startup(config);
        } catch (BirtException e) {
        	e.printStackTrace();
            //logger.error(e.getMessage(), e);
        }

        IReportEngineFactory factory = (IReportEngineFactory) Platform.createFactoryObject(IReportEngineFactory.EXTENSION_REPORT_ENGINE_FACTORY);
        
       
        birtEngine = factory.createReportEngine(config);
        //System.out.println("Inside New");
    }
    public static void initializeDesignConfig()
    {
        DesignConfig config = new DesignConfig( );

		config.setProperty("BIRT_HOME", "C:/birt-runtime-2_3_2_1/birt-runtime-2_3_2/ReportEngine");
		IDesignEngine engine = null;
		try{
					
			
		Platform.startup( config );
		IDesignEngineFactory factory = (IDesignEngineFactory) Platform
		.createFactoryObject( IDesignEngineFactory.EXTENSION_DESIGN_ENGINE_FACTORY );
		engine = factory.createDesignEngine( config );

		}catch( Exception ex){
			ex.printStackTrace();
		}
    }

}
