<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 7 de mayo de 2020, 12:23
    Author     : Nacho
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/manual">
        <html>
            <head>
                <title>NachoPL:Servidor Web en Ubuntu</title>
                <xsl:call-template name="miHead"/>
                
                <style>
                    .titulo {
                        color: blue;
                        width: auto;
                    }
                    
                    h1, .titulo p {
                        width: auto;
                        border: 1px solid blue;
                        margin: 2px;
                        padding: 5px;
                    }
                    
                    .titulo p {
                        font-size: 30px;
                    }
                    
                    .informacion {
                        margin: 30px;
                        width: auto;
                    }
                    
                    .infoContenido {
                        font-size: 20px;
                        margin: 5px;
                        display: flex;
                    }
                    
                    .infoContenido:nth-last-child(1) {
                        display: block;
                    }
                    
                    h2 {
                        font-size: 20px;
                        color: blue;
                        margin-right: 3px;
                    }
                    
                    .infoContenido p {
                       line-height: 20px;
                    }
                    
                    .pasos {
                        margin: 30px;
                        margin-right: 10%;
                        width: auto;
                    }
                    
                    .paso {
                        width: auto;
                        border: 1px solid blue;
                        padding: 0 5px;
                        margin-bottom: 2px;
                    }
                    
                    .tituloPaso {
                        display: flex;
                    }
                    
                    .tituloPaso h3 {
                        line-height: 15px;
                        font-size: 20px;
                    }
                    
                    .tituloPaso p {
                        color: #fff;
                        background-color: blue;
                        text-align: center;
                        font-size: 18px;
                        line-height: 15px;
                        padding: 1px;
                        margin-rigth: 2px;
                    }
                    
                    .comando {
                        color: #fff;
                        background-color: blue;
                        text-align: center;
                        padding: 1px;
                    } 
                </style>
            </head>
            <body>
                <!-- Llamada a la plantilla "doctype" -->
                <xsl:call-template name="doctype"/>
                
                <!-- Llamada a la plantilla para mostrar los comentarios -->
                <xsl:apply-templates select="comment()"/>
                
                <!-- Cabecera de la página web -->
                <header class="titulo">
                    <h1>UBU18<xsl:value-of select="./titulo/text()"/></h1>
                    <p><xsl:value-of select="./subtitulo/text()"/></p>
                </header>
                
                <!-- Información sobre Ubuntu 18 -->
                <main>
                    <!-- Apartado de información -->
                    <div class="informacion">
                        <!-- Fecha creación/actualización -->
                        <div class="infoContenido">
                            <h2>DATE CREATED/UPDATE: </h2>
                            <p> <xsl:value-of select="./fechaCreacion/text()"/></p>
                        </div>
                        
                        <!-- Sistema operativo utilizado -->
                        <div class="infoContenido">
                            <h2>SISTEMA OPERATIVO: </h2>
                            <p> <xsl:value-of select="./sistema/text()"/></p>
                        </div>
                        
                        <!-- Arquitectura del sistema -->
                        <div class="infoContenido">
                            <h2>ARQUITECTURA: </h2>
                            <p> <xsl:value-of select="./sistema/@tipo"/></p>
                        </div>
                        
                        <!-- Webs de información -->
                        <div class="infoContenido">
                            <h2>DOCUMENTACIÓN: </h2>
                            <ul>
                                <li><xsl:value-of select="./url/text()"/></li>
                                <li><xsl:value-of select='./url[@pagina="wiki"]/text()'/></li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- Pasos a seguir para la instalación del sistema -->
                    <div class="pasos">
                        <h2>PASOS A SEGUIR</h2>
                        
                        <!-- Paso 1 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P01']/@id"/></p><h3>Paso 1</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P01']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P01']/descripcion/text()"/></p>
                            </div>
                        </div>
                        
                        <!-- Paso 2 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P02']/@id"/></p><h3>Paso 2</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P02']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P02']/descripcion/text()"/></p>
                            </div>
                        </div>
                        
                        
                        <!-- Paso 3 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P03']/@id"/></p><h3>Paso 3</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P03']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P03']/descripcion/text()"/></p>
                            </div>
                        </div>
                        
                        
                        <!-- Paso 4 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P04']/@id"/></p><h3>Paso 4</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P04']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P04']/descripcion/text()"/></p>
                            </div>
                        </div>
                        
                        <!-- Paso 5 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P05']/@id"/></p><h3>Paso 5</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P05']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P05']/descripcion/text()"/></p>
                            </div>
                        </div>
                        
                        <!-- Paso 6 -->
                        <div class="paso">
                            <!-- Título -->
                            <div class="tituloPaso">
                                <p><xsl:value-of select="./paso[@id='P06']/@id"/></p><h3>Paso 6</h3>
                            </div>
                            
                            <!-- Comando -->
                            <div class="comando">
                                <p><xsl:value-of select="./paso[@id='P06']/comando/text()"/></p>
                            </div>
                            
                            <!-- Descripción -->
                            <div class="descripcion">
                                <p><xsl:value-of select="./paso[@id='P06']/descripcion/text()"/></p>
                            </div>
                        </div>
                    </div>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="miHead">
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width-device-width, initial-scale-1.0"/>
        <meta name="author" content="Nacho del Prado Losada"/>
        <meta name="application-name" content="Actividades de un gimnasio"/>
        <meta name="robots" content="index, follow"/>
    </xsl:template>

    <xsl:template name="doctype">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:text>
        </xsl:text>
        <xsl:comment><xsl:value-of select="."/></xsl:comment>
        <xsl:if test="position()=last()">
        <xsl:text>
            
        </xsl:text>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
