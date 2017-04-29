<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output 

        method="html"

        encoding="UTF-8"
        indent="yes" />

    

    <xsl:template match="/">

        <html>

            <head>

                <meta charset="utf-8" />

                <title>Ma bibliothèque</title>

                <link type="text/css" rel="stylesheet" href="style.css"/>

            </head>

            <body>

                <!-- titre principal -->

                <h1>Ma bibliothèque</h1>

                <!-- Pour chaquee livre Block à afficher -->

                <xsl:for-each select="bibliotheque/livre">
                    <div class="book">

                        <h2>
                            <xsl:call-template name="afficherTitre">
                                <xsl:with-param name="titre" select="titreOriginal"></xsl:with-param>
                            </xsl:call-template>
                       </h2>

                        <xsl:if test="count(titres) != 0">
                            <h3>Autres titres</h3>
                            <ul>
                                <xsl:for-each select="titres/titre">
                                    <li>
                                         <xsl:call-template name="afficherTitre">
                                            <xsl:with-param name="titre" select="."></xsl:with-param>
                                        </xsl:call-template>
                                    </li> 
                                </xsl:for-each>
                            </ul>
                        </xsl:if>

                        <h3>Informations</h3>

                        <ul>
                            <xsl:call-template name="afficherInfos">
                                <xsl:with-param name="livre" select="."></xsl:with-param>
                            </xsl:call-template>
                        </ul>

                        <h3>Résumé</h3>

                        <p class="text-justify">
                            <xsl:value-of select="resume"></xsl:value-of>
                        </p>

                    </div>
                </xsl:for-each>

                <!-- Pied de page -->

                <div class="footer">Cyrille YAO - 29/04/2017</div>

            </body>

        </html>

    </xsl:template>    

    <xsl:template name="afficherTitre">
        <xsl:param name="titre"></xsl:param>
        <xsl:value-of select="$titre"></xsl:value-of>&#160;(<xsl:value-of select="$titre/@lang"></xsl:value-of>)
    </xsl:template>


    <xsl:template name="afficherInfos">
        <xsl:param name="livre"></xsl:param>

            <xsl:if test="count($livre/auteur) != 0">
                <li>
                    <span class="bold">Auteur</span>&#160;:&#160;
                    <xsl:if test="count($livre/auteur/prenom) != 0">
                        <xsl:value-of select="$livre/auteur/prenom"></xsl:value-of>&#160;
                    </xsl:if>
                    <xsl:if test="count($livre/auteur/nom) != 0">
                        <xsl:value-of select="$livre/auteur/nom"></xsl:value-of>
                    </xsl:if>
                </li>
            </xsl:if>


            <xsl:if test="count($livre/annee) != 0">
                <li>
                    <span class="bold">Date</span>&#160;:&#160;
                    <xsl:value-of select="$livre/annee"></xsl:value-of>
                </li>
            </xsl:if>


             <xsl:if test="count($livre/@style) != 0">
                <li>
                    <span class="bold">Style</span>&#160;:&#160;
                    <xsl:value-of select="$livre/@style"></xsl:value-of>
                </li>
            </xsl:if>

    </xsl:template>

</xsl:stylesheet>



