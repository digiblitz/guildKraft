/*
 * PaginationTag.java
 *
 * Created on October 1, 2006, 4:04 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.util.tag;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author Shiva Kumar Subbiaha
 *
 */
public class PaginationTag extends TagSupport {

	private String start;
	private String range;
	private String results;
	private String action;
	private String styleClass;
	private String title;

	public static final String SPACE = "&nbsp;";
	public static final String YES = "yes";
	public static final String START = "start";
	public static final String RANGE = "range";
	public static final String FIRST = "first";
	public static final String AND = "&";
	public static final String EQUALS = "=";
	public static final String ABEGIN = "<a href=\"";
	public static final String AEND = "</a>";
	public static final String QUESTION = "?";
	public static final String QUOT = "\"";
	public static final String GT = ">";
	public static final String LT = "<";
	public static final String PIPE = "|";
	public static final String LB = "[";
	public static final String RB = "]";
	public static final String BOLDSTART = "<b>";
	public static final String BOLDEND = "</b>";
	public static final String PAGES = "pages";

	/**
	 * Returns the range.
	 * @return String
	 */
	public String getRange() {
		return range;
	}

	/**
	 * Returns the start.
	 * @return String
	 */
	public String getStart() {
		return start;
	}

	/**
	 * Sets the range.
	 * @param range The range to set
	 */
	public void setRange(String range) {
		this.range = range;
	}

	/**
	 * Sets the start.
	 * @param start The start to set
	 */
	public void setStart(String start) {
		this.start = start;
	}

	public int doStartTag() {

		int start, range, results, pages, i, ci;
		boolean firstPage, hasPreviousPage, hasNextPage;
		start = NumberUtils.stringToInt(this.start, 0);
		range = NumberUtils.stringToInt(this.range, 15);
		results = NumberUtils.stringToInt(this.results, 100);
		pages = (results / range);
		pages = results % range == 0 ? pages : pages + 1;
		if (pages > 1) {
			ci = (start / range); // current index
			firstPage = ci < 2 ? true : false;
			hasPreviousPage = ci > 0 ? true : false;
			hasNextPage = ci < pages - 1 ? true : false;
			start = 0; // setting start to 0
			StringBuffer sb = null;

			try {
				JspWriter out = pageContext.getOut();
				sb = new StringBuffer();
				sb.append(getTableWithStyle()).append("<tr><td>");
				sb.append(LB).append(SPACE);
				sb.append(pages).append(SPACE).append(PAGES).append(SPACE);

				if (hasPreviousPage) {
					sb.append(getAnchor((ci - 1) * range, range, LT)).append(
						PIPE).append(
						SPACE);
				}
				if (!firstPage) {
					sb.append(getAnchor(0, range, FIRST)).append(PIPE).append(
						SPACE);
				}

				/**
				 * logic for the anchors,
				 * we should show 5 achors both on the left and right of the current index if possible
				 */
				i = ci - 5 < 0 ? 0 : ci - 5;
				start = ci - 5 < 1 ? start : range * (ci - 5);
				pages = ci + 5 > pages ? pages : ci + 5;
				for (; i < pages; i++) {
					if (i == ci) {
						sb.append(BOLDSTART).append(i + 1).append(
							BOLDEND).append(
							SPACE);
					} else {
						sb.append(getAnchor(start, range, i + 1));
					}
					start += range;
				}
				if (hasNextPage) {
					sb.append(PIPE).append(SPACE).append(
						getAnchor((ci + 1) * range, range, GT));
				}
				sb.append(RB);
				sb.append("</td></tr></table>");
				out.println(sb);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return SKIP_BODY;
	}

	public int doEndTag() {
		return EVAL_PAGE;
	}

	private String getAnchor(int start, int range, int page) {
		return getAnchor(start, range, String.valueOf(page));
	}
	private String getAnchor(int start, int range, String page) {
		HttpServletRequest r = ((HttpServletRequest) pageContext.getRequest());
		String extension =
			(
				(String) pageContext.getServletContext().getAttribute(
					org.apache.struts.Globals.SERVLET_KEY)).substring(
				1);

		boolean hasQueryString =
			StringUtils.isEmpty(this.getQueryString(r.getParameterMap()))
				? false
				: true;
		StringBuffer url =
			new StringBuffer(
				r.getRequestURL().toString().substring(
					r.getRequestURL().toString().indexOf(r.getContextPath())));
		url =
			hasQueryString
				? url.append(QUESTION).append(
					this.getQueryString(r.getParameterMap())).append(
					AND)
				: url.append(QUESTION);

		return addTitle(
			new StringBuffer(ABEGIN)
				.append(
					this.action == null
						? url
                                                //hasQueryString
						:(this.action.indexOf('?') > -1)
                                                ? new StringBuffer(this.action)											
							.append(AND)
						/*? new StringBuffer(this.action)
							.append(extension)
							.append(QUESTION)
							.append(this.getQueryString(r.getParameterMap()))
							.append(AND)*/
						
		                : new StringBuffer(this.action).append(
							QUESTION))
				.append(START)
				.append(EQUALS)
				.append(start)
				.append(AND)
				.append(RANGE)
				.append(EQUALS)
				.append(range)
				.append(QUOT)
				.append(GT)
				.append(page)
				.append(AEND)
				.append(SPACE),
			page)
			.toString();
	}
	/**
	 * Returns the results.
	 * @return String
	 */
	public String getResults() {
		return results;
	}

	/**
	 * Sets the results.
	 * @param results The results to set
	 */
	public void setResults(String results) {
		this.results = results;
	}

	/**
	 * Returns the action.
	 * @return String
	 */
	public String getAction() {
		return action;
	}

	/**
	 * Sets the action.
	 * @param action The action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	public String getQueryString(Map map) {
		if (map == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		Set keys = map.keySet();
		Iterator iterator = keys.iterator();
		String obj = null;
		while (iterator.hasNext()) {
			obj = (String) iterator.next();
			if (!START.equals(obj) && !RANGE.equals(obj)) {
				sb.append(obj).append(EQUALS).append(
					((String[]) map.get(obj))[0]).append(
					AND);
			}
		}
		return sb.toString().endsWith(AND)
			? sb.toString().substring(0, sb.toString().length() - 1)
			: sb.toString();
	}
	/**
	 * Returns the styleClass.
	 * @return String
	 */
	public String getStyleClass() {
		return styleClass;
	}

	/**
	 * Sets the styleClass.
	 * @param styleClass The styleClass to set
	 */
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	public String getTableWithStyle() {
		if (StringUtils.isNotEmpty(this.styleClass)) {
			return new StringBuffer("<table")
				.append(" class=\"")
				.append(this.styleClass)
				.append("\"")
				.append(" width=\"100\"%>")
				.toString();
		}
		return "<table bgcolor=eeeeff border=1 style=\"border-collapse:collapse\" bordercolor=#666699 width=100%>";
	}
	/**
	 * Returns the title.
	 * @return String
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * Sets the title.
	 * @param title The title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	private StringBuffer addTitle(StringBuffer sb, String page) {
		if (sb == null || StringUtils.isEmpty(page)) {
			return sb;
		}
		if (StringUtils.isNotEmpty(this.title)
			&& StringUtils.trim(this.title).equals(YES)) {
			StringBuffer tt = new StringBuffer("<span title=\"");
			if (page.equals(LT)) {
				tt.append("Previous page\">");
			} else if (page.equals(GT)) {
				tt.append("Next page\">");
			} else if (page.equals(FIRST)) {
				tt.append("First page\">");
			} else {
				tt.append("Go to page " + page + "\">");
			}
			tt.append(sb);
			tt.append("</span>");
			return tt;
		}
		return sb;
	}

}

