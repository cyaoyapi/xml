<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:output
    method="html"
    encoding="UTF-8"
    doctype-public="-//W3C//DTD HTML 4.01//EN"
    doctype-system="http://www.w3.org/TR/html4/strict.dtd"
    indent="yes" />
    
  <!-- template principal qui structure le document HTML -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Ma bibliotheque</title>
        <link type="text/css" rel="stylesheet" href="style.css"/>
      </head>
      <body>
        <h1>Ma bibliothèque</h1>
        
        <!-- utilisation d'un élément for-each pour boucler sur l'ensemble des livres -->
        <xsl:for-each select="bibliotheque/livre">
          <!-- on appelle le template "book" en lui passant un libre en paramètre -->
          <xsl:call-template name="book">
            <xsl:with-param name="livre" select="." />
            </xsl:call-template>
        </xsl:for-each>
        
        <div class="footer">
          Ludovic ROLAND - 22/10/2014
        </div>
      </body>
    </html>
  </xsl:template>
 
  <!-- template "book" qui gère l'affichage d'un livre -->
  <xsl:template name="book">
    <xsl:param name="livre" />
    
    <div class="book">
      <!-- on appelle le template "titreOriginal" -->
      <xsl:call-template name="titreOriginal">
        <xsl:with-param name="titre" select="$livre/titreOriginal" />
      </xsl:call-template>
              
      <!-- on conditionne l'appel au template "titres" en vérifiant que le livre à au moins un autre titre -->
      <xsl:if test="count($livre/titres) != 0">
        <xsl:call-template name="titres">
          <xsl:with-param name="titres" select="$livre/titres" />
        </xsl:call-template>
      </xsl:if>
      
      <!-- on appelle le template "informations" -->
      <xsl:call-template name="informations">
        <xsl:with-param name="type" select="$livre/@type" />
        <xsl:with-param name="style" select="$livre/@style" />
        <xsl:with-param name="auteur" select="$livre/auteur" />
        <xsl:with-param name="date" select="$livre/annee" />
      </xsl:call-template>
      
      <!-- on appelle le template "resume" -->
      <xsl:call-template name="resume">
        <xsl:with-param name="resume" select="$livre/resume" />
      </xsl:call-template>
    </div>
  </xsl:template>
 
  <!-- template "titreOriginal" qui gère l'affichage du titre original d'un livre -->
  <xsl:template name="titreOriginal">
    <xsl:param name="titre" />
    
    <h2>
      <xsl:value-of select="$titre" />&#160;(<xsl:value-of select="$titre/@lang" />)
    </h2>
  </xsl:template>
 
  <!-- template "titres" qui gère l'affichage des autres titres d'un livre -->
  <xsl:template name="titres">
    <xsl:param name="titres" />
      
    <h3>Autres titres </h3>
    <ul>
      <!-- utilisation d'un élément for-each pour boucler sur l'ensemble des titres -->
      <xsl:for-each select="$titres/titre">
        <li><xsl:value-of select="." />&#160;(<xsl:value-of select="./@lang" />)</li>
      </xsl:for-each>
    </ul>
  </xsl:template>
 
  <!-- template "informations" qui gère l'affichage des informations d'un livre -->
  <xsl:template name="informations">
    <xsl:param name="type" />
    <xsl:param name="style" />
    <xsl:param name="auteur" />
    <xsl:param name="date" />
      
    <h3>Informations</h3>
    <ul>
      <li>
        <span class="bold">Auteur : </span>
        <xsl:value-of select="$auteur/prenom" />
        
        <!-- on conditionne l'affichage du nom de l'auteur qui n'est pas systématiquement présent -->
        <xsl:if test="$auteur/nom != ''">
          &#160;<xsl:value-of select="$auteur/nom" />
        </xsl:if>
      </li>
      
      <li><span class="bold">Date : </span><xsl:value-of select="$date" /></li>
      
      <!-- on conditionne l'affichage du type du livre qui n'est pas systématiquement présent -->
      <xsl:if test="$type != ''">
        <li><span class="bold">Type : </span><xsl:value-of select="$type" /></li>
      </xsl:if>
 
      <li><span class="bold">Style : </span><xsl:value-of select="$style" /></li>
    </ul>        
  </xsl:template>
 
  <!-- template "resume" qui gère l'affichage du résumé d'un livre -->
  <xsl:template name="resume">
    <xsl:param name="resume" />
    
    <h3>Résumé</h3>
    <p class="text-justify" ><xsl:value-of select="$resume" /></p>
  </xsl:template>
</xsl:stylesheet>
