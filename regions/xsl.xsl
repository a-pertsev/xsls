<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8"/>

	<xsl:template match="/">
		<xsl:for-each select = "//flat/area">
			<xsl:text> </xsl:text>
			<xsl:value-of select = "./@name"/>
			<xsl:text>: </xsl:text>
			<xsl:copy-of select = "//tree//area[@name = current()/@name]/ancestor::area/@name = ../area[@name!=current()/@name]/@name"/>				
		</xsl:for-each>		
	</xsl:template>
	
</xsl:stylesheet>
