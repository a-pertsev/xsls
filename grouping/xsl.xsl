<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output encoding="UTF-8"/>
	
	<xsl:key name="type" match="number" use="@type"/>
	<xsl:variable name = "uniq" select = "/data/number[generate-id(.) = generate-id(key('type',@type))] /@type"/>
	  
	<xsl:template match="/data">
		<xsl:for-each select = "$uniq">
			<xsl:element name = "{.}">
			<xsl:attribute name="numbers">
				<xsl:for-each select = "/data/number[@type = current()]">
				<xsl:sort data-type="number"/>
					<xsl:value-of select = "."/>
					<xsl:if test="position()!=last()">,</xsl:if>
				</xsl:for-each>
			</xsl:attribute>
			</xsl:element>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
