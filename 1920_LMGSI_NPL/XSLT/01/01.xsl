<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 16 de abril de 2020, 12:44
    Author     : Nacho
    Description:
				 
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
	
	<!-- Mostrar los comentarios -->
	<xsl:template match="comment()">
		<xsl:comment><xsl:value-of select="."/></xsl:comment>
	</xsl:template>
	
	<!-- Creación de la estructura de la página web -->
    <xsl:template match="/edificio">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>01 XSLT Nacho del Prado Losada </title>
            </head>
            <body>
				<h1>Informacion de las viviendas</h1>
                <xsl:apply-templates select="vivienda"/>
				<p>Numero de viviendas:<xsl:value-of select="count(//vivienda)"/></p>
				<p>Numero total de vecinos:<xsl:value-of select="count(//vecinos/nombre)"/></p>
            </body>
        </html>
    </xsl:template>
    
    <!-- Mostrar los datos de cada vivienda -->
    <xsl:template match="vivienda">
        <p>Piso:<xsl:value-of select="./piso"/> Puerta:<xsl:value-of select="./puerta"/></p>
        <ol>
			<xsl:apply-templates select="vecinos/nombre"/>
		</ol>
    </xsl:template>
    
    <!-- Mostrar las vecinos de cada vivienda -->
    <xsl:template match="vecinos/nombre">
        <li><xsl:value-of select="./text()"/></li>
    </xsl:template>

</xsl:stylesheet>
