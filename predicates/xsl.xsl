<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="UTF-8"/>

	<xsl:template match="/">
	<!-- вывести:
	  2й item, если у него нет @vikings; (egg)
	  2й item из тех, что без @vikings. (sausage)
	-->
    <xsl:value-of select = "/data/item[2][not(@vikings)]"/>
    <xsl:text> and </xsl:text>
    <xsl:value-of select = "/data/item[not(@vikings)][2]"/>
      
	</xsl:template>

</xsl:stylesheet>
