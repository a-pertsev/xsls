<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8"/>

<xsl:stylesheet version = '1.0' 
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
	 xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <xsl:variable name = "inRow" select = "3"/>
    <xsl:variable name = "inColumns" select = "4"/>
    <xsl:variable name = "last" select = "'xx'"/>
    
    <xsl:variable name = "tds1">
    	<xsl:for-each select = "//data/item">
    		<td><xsl:value-of select = "."/></td>
    	</xsl:for-each>	
    	<td><xsl:value-of select = "$last"/></td>
    </xsl:variable>
    
    <xsl:variable name = "tds">
    	<xsl:for-each select = "//data/item">
    		<xsl:sort select="(position() - 1) mod 3"/>
    		<td><xsl:value-of select = "."/></td>
    	</xsl:for-each>	
    	<td><xsl:value-of select = "$last"/></td>
    </xsl:variable>
    
    <xsl:template match="/">
    	<table>
    		<xsl:call-template name = "rows">
    		</xsl:call-template>	
    	</table>
    	<table>	
    		<xsl:call-template name = "rows">
    			<xsl:with-param name = "cells" select = "$tds1"/>
    			<xsl:with-param name = "columns" select = "$inRow"/>
    		</xsl:call-template>	
    	</table>
    </xsl:template>
    
    <xsl:template name="rows">
    	<xsl:param name="level" select="0"/>
    	<xsl:param name="cells" select = "$tds"/>
    	<xsl:param name="columns" select = "$inColumns"/>
    	<xsl:if test = "$level &lt;= count(data/*) div $columns">
    		<tr>
    			<xsl:for-each select = "exsl:node-set($cells)/td[position() &lt;= ($level + 1)*$columns and position() > $level*$columns]">
    				<xsl:copy-of select = "."/>
    			</xsl:for-each>	
    		</tr>
    		<xsl:call-template name = "rows">
    			<xsl:with-param name = "level" select = "$level + 1"/>
    			<xsl:with-param name="cells" select = "$cells"/>
    			<xsl:with-param name="columns" select = "$columns"/>
    		</xsl:call-template>		
    	</xsl:if>
    </xsl:template>

</xsl:stylesheet>
</xsl:stylesheet>
