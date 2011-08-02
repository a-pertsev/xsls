<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version = '1.0' 
     xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
     xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>

    <!--
    Надо отсортировать item по d в обратном порядке, выбрать 3 верхних.
    Три выбранных отсортировать по text() и вывести.
    -->
    
    <xsl:template match="/">
        <xsl:apply-templates match="items"/>
    </xsl:template>
    
    <xsl:template match="items">
        <xsl:variable name="sorted">
            <xsl:for-each select="item">
                <xsl:sort select="@d" order="descending" data-type="number"/>
                <xsl:copy-of select="."/>
            </xsl:for-each> 
        </xsl:variable>
        <xsl:for-each select="exsl:node-set($sorted)/item[position() &lt; 4]">
            <xsl:sort select="text()" data-type="text"/>
                <xsl:copy-of select="."/>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>
