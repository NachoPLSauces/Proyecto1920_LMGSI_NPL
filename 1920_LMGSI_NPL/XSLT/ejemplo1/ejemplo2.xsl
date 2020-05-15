<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : ejemplo1.xsl
    Created on : 14 de mayo de 2020, 12:42
    Author     : amor
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
  
  
    <xsl:template match="/garaje">
        <html>
            <head>
                <title>05.xsl</title>
            </head>
            <body>
                <xsl:element name="table" use-attribute-sets="bordesSencillos">                  
                    <xsl:apply-templates select="//coches/coche/matricula">
                        <xsl:sort />
                    </xsl:apply-templates>                
                </xsl:element>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="matricula">
        <tr>
            <xsl:element name="td" use-attribute-sets="bordesSencillos">          
                <xsl:value-of select="current()"/>
            </xsl:element>
            <xsl:element name="td" use-attribute-sets="bordesSencillos">          
                <ul>
                    <xsl:apply-templates select="//reparacion[matricula=current()]"/>
                </ul>
            </xsl:element>
        </tr>
    </xsl:template>

    <xsl:template match="//reparacion[matricula=current()]/@codigo">
        <li>          
            <xsl:value-of select="."/>
        </li>
    </xsl:template>

    <xsl:attribute-set name="bordesSencillos">
        <xsl:attribute name="style">border:1px solid black; witdh:100%;</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
