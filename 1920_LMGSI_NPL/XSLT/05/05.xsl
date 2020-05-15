<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 15 de mayo de 2020, 22:03
    Author     : Nacho
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
  
  
    <xsl:template match="/garaje">
        <html>
            <head>
                <title>05 XSLT Nacho del Prado Losada</title>
                <meta charset="UTF-8"/>
                <style>
                    body {
                        font-family: 'Permanent Marker', cursive;
                    }
                    
                    th, .titulos, .total {
                        background-color: #007FF0;
                        color: #fff;
                    }
                    
                    th {
                        text-align: left;
                        font-size: 25px;
                    }
                    
                    .titulos {
                        text-align: center;
                    }
                    
                    td {
                        border: 2px solid grey;
                        width: 50%;
                    }
                    
                    div {
                        border: 1px solid grey;
                        
                    }
                    
                    .logo {
                        text-align: center;
                        font-weight: bold;
                    }
                </style>
            </head>
            
            <body>
                <xsl:element name="table" use-attribute-sets="bordesSencillos"> 
                    <th colspan="2">XSLT 05 Información de garajes</th>                 
                    <xsl:apply-templates select="//coches/coche/matricula">
                        <xsl:sort />
                    </xsl:apply-templates>                
                </xsl:element>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//coche/matricula">
        <tr class="titulos">
            <td>          
                <h3>Coches</h3>
            </td>
            <td>          
                <h3>Reparaciones</h3>
            </td>
        </tr>
        
        <tr>
            <td rowspan="2" class="logo">          
                <p>Matrícula: <xsl:value-of select="../matricula"/></p>
                <xsl:call-template name="imagenes"/>
            </td>
            <td>          
                <xsl:apply-templates select="//reparacion[matricula=current()]"/>
            </td>
        </tr>
        
        <tr class="total">
            <td>          
                <p>NÚMERO DE REPARACIONES: <xsl:value-of select="count(//reparacion[matricula=current()])"/></p>
                <p>TOTAL HORAS: <xsl:value-of select="sum(//reparacion[matricula=current()]/horas)"/></p>
                <p>TOTAL A PAGAR: </p>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="reparacion">
        <p><strong>Código <xsl:value-of select="./@codigo"/></strong></p>
        <div>
            <ul>
                <li>Descripción: <xsl:value-of select="./descripcion"/></li>
                <li>Fechas: (In: <xsl:value-of select="./fecha_entrada"/>, Out: <xsl:value-of select="./fecha_salida"/>)</li>
                <li>Tiempo: <xsl:value-of select="./horas"/> horas</li>
            </ul>
        </div>
    </xsl:template>

    <xsl:attribute-set name="bordesSencillos">
        <xsl:attribute name="style">border:2px solid grey; width:100%; border-collapse: collapse; </xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="setImagen"> 
        <xsl:attribute name="width">120px</xsl:attribute> 
        <xsl:attribute name="height">120px</xsl:attribute>
        <xsl:attribute name="alt">Aquí hay una imagen</xsl:attribute>   
    </xsl:attribute-set>
    
    <xsl:template name="imagenes">
        <xsl:choose>
            <xsl:when test="../marca='Renault'">
                <a href="https://www.renault.es/">
                    <xsl:element name="img" use-attribute-sets="setImagen">
                        <xsl:attribute name="src">./images/renault.png</xsl:attribute>
                    </xsl:element>
                </a>
            </xsl:when>
            <xsl:when test="../marca='Seat'">
                <a href="https://www.seat.es/">
                    <xsl:element name="img" use-attribute-sets="setImagen">
                        <xsl:attribute name="src">./images/seat.png</xsl:attribute>
                    </xsl:element>
                </a>
            </xsl:when>
            <xsl:when test="../marca='Volkswagen'">
                <a href="https://www.volkswagen.es/">
                    <xsl:element name="img" use-attribute-sets="setImagen">
                        <xsl:attribute name="src">./images/volkswagen.png</xsl:attribute>
                    </xsl:element>
                </a>
            </xsl:when>
            <xsl:when test="../marca='Ford'">
                <a href="https://www.ford.es/">
                    <xsl:element name="img" use-attribute-sets="setImagen">
                        <xsl:attribute name="src">./images/ford.png</xsl:attribute>
                    </xsl:element>
                </a>
            </xsl:when>
        </xsl:choose>
        
            
    </xsl:template>
</xsl:stylesheet>