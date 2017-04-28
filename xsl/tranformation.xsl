<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output 
        method="html" 
        encoding="utf-8" 
        doctype-public="-//W3C//DTD HTML 4.01//EN" 
        doctype-system="http://www.w3.org/TR/html4/strict.dtd" 
        indent="yes" 
        />

        <xsl:template match="/">
            <html>
            <head>
                <title>Fonction Call:template</title>
            </head>

            <body>

            <xsl:for-each select="repertoire/personne">
                <xsl:call-template name="afficher">
                    <xsl:with-param name="nom" select="nom"></xsl:with-param>
                    <xsl:with-param name="texte"> Nom : </xsl:with-param>
                </xsl:call-template>
            </xsl:for-each>

            </body>

            </html>
        </xsl:template>

        <xsl:template name="afficher">
            <xsl:param name="nom"></xsl:param>
            <xsl:param name="texte"></xsl:param>
            <p><xsl:value-of select="$texte"></xsl:value-of>&#160;<xsl:value-of select="$nom"></xsl:value-of></p>
        </xsl:template>
       

</xsl:stylesheet>