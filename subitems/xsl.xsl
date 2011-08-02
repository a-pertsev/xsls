<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template match="resumes">
	<resumelist>
		<xsl:apply-templates select = "resume[1] | resume[@uid != preceding-sibling::resume[1]/@uid]" mode="main"/>
	</resumelist>
</xsl:template>

<xsl:template match="resume" mode="main">
	<resume id="{@rid}" user="{@uid}">
		<xsl:apply-templates select = "following-sibling::resume[@uid = current()/@uid]"  mode="additional"/>		
	</resume>
</xsl:template>

<xsl:template match="resume" mode="additional">
	<item id="{@rid}"/>
</xsl:template>
	
</xsl:stylesheet>
