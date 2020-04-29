<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 28 de abril de 2020, 10:52
    Author     : Nacho
    Description:
        Documento xslt del ejercicio 03.xml. Peliculas: título, valoración y edad recomendada.
    Comentarios: 
        No se pueden escribir vocales con acento utilizando &?acute;
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <!-- Creación de la estructura de la página web -->
    <xsl:template match="/peliculas">
        <html>
            <head>
                <meta charset="utf-8"/>
                <title>03 XSLT Nacho del Prado Losada</title>
                <style>
                    header {
                        width: 100%;
                        color: white;
                        background-color: grey;
                        text-align: center;
                    }
                    
                    body {
                        background-image: url(./images/cine.jpg);
                        background-size: 100px;
                        margin: 5px;
                    }
                    
                    div {
                        border: 1px solid black;
                        background-color: #EEEEEE;
                        padding: 20px 7px;
                        margin: 5px;
                        width: 300px;
                        heigth: 180px;
                        text-align: center;
                        display: inline-block;
                    }
                    
                    footer {
                        width: 100%;
                        color: white;
                        background-color: grey;
                        text-align: center;
                        position: fixed;
                        bottom: 0;
                        left: 0;
                    }
                </style>
            </head>
            <body>
                <header>
                    <h1>Informacion de peliculas</h1>
                </header>
                
                <xsl:apply-templates select="pelicula"/>
                
                <footer>
                    <h2>Numero total de peliculas: <xsl:value-of select="count(//pelicula)"/></h2>
                </footer>
            </body>
        </html>
    </xsl:template>


    <!-- Mostrar los datos de cada pelicula -->
    <xsl:template match="pelicula">
        <div>
            <p>Dirigida a: <xsl:value-of select="./publico"/></p>
            <p>Puntuacion: 
                <xsl:choose>
                    <xsl:when test="./valoracion/@puntos&lt;5">
                        ***
                    </xsl:when>
                    <xsl:when test="./valoracion/@puntos&gt;7">
                        *******
                    </xsl:when>
                    <xsl:otherwise>
                        *****
                    </xsl:otherwise>
                </xsl:choose>
            </p>
            <strong><xsl:value-of select="./nombre"/></strong>
        </div>
    </xsl:template>
</xsl:stylesheet>
