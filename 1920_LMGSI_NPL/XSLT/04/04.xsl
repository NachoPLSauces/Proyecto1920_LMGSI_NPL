<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 4 de mayo de 2020, 18:25
    Author     : Nacho
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    
    <!-- Creación de la estructura de la página web -->
    <xsl:template match="/actividades">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>04 XSLT Nacho del Prado Losada</title>
                <style>
                    body {
                        font-family: 'Permanent Marker', cursive;
                    }
                    
                    .comentarios {
                        margin: 5px;
                        margin-bottom: 30px;
                    }
                    
                    .comentarios header {
                        margin-left:0;
                    }
                    
                    .comentarios header p {
                        padding-rigth: 10px;
                    }
                    
                    .headerEjercicio {
                        background-color: #387ab6;
                        color: #fff;
                        margin-bottom: 5px;
                        padding: 10px ;
                        width: auto;
                        font-size: 20px;
                        
                    }
                    
                    .titulo {
                        margin: 5px;
                        width: 100%;
                        background-color: #387ab6;
                        color: #fff;
                        padding: 20px;
                        text-align: center;
                        text-decoration: capitalize;
                    }
                    
                    footer {
                        margin: 5px;
                        width: 100%;
                        background-color: #387ab6;
                        color: #fff;
                        padding: 5px;
                        text-align: center;
                    }
                    
                    .ejercicio {
                        margin: 5px 25%;
                        border: 5px solid #387ab6;
                        padding: 5px;
                    }
                    
                    .resultado {
                        border-top: 3px solid grey;
                    }
                    
                    .opcion p {
                        margin-left: 35px;
                    }
                </style>
            </head>
            <body>
                <header class="titulo">
                    <h1>Práctica 04 XPATH</h1>
                </header>
                
                <main>
                    <div class="comentarios">
                        <header>
                            <h2>COMENTARIOS</h2>
                        </header> 
                        
                        <p>
                            <xsl:apply-templates select="comment()"/>
                        </p>
                    </div>
                    
                    
                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>01 Todos los elementos de las actividades infantiles.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: //actividad[@nivel="infantil"]/*</h3>
                            <xsl:apply-templates select="actividad"/>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>02 El nombre de las actividades para adultos.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: //actividad[@nivel="adultos"]/titulo/text()</h3>
                            <ul>
                                <xsl:for-each select="//actividad">
                                    <xsl:if test='./@nivel="adultos"'>
                                        <li><xsl:value-of select="./titulo/text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>03 El nombre de las actividades con dos sesiones por semana.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: //actividad[./sesiones/sesiones_semana=2]/titulo/text()</h3>
                            <ul>
                                <xsl:for-each select="//actividad">
                                    <xsl:if test="./sesiones/sesiones_semana=2">
                                        <li><xsl:value-of select="./titulo/text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>

                        <div class="opcion">
                            <h3>Opción B: //sesiones[/sesiones_semana=2]/../titulo/text()</h3>
                            <ul>
                                <xsl:for-each select="//sesiones">
                                    <xsl:if test="./sesiones_semana=2">
                                        <li><xsl:value-of select="./../titulo/text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>

                        <div class="opcion">
                            <h3>Opción C: //sesiones[/sesiones_semana=2]/parent::node()/titulo/text()</h3>
                            <ul>
                                <xsl:for-each select="//sesiones">
                                    <xsl:if test="./sesiones_semana=2">
                                        <li><xsl:value-of select="./parent::node()/titulo/text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header>
                            <h2 class="headerEjercicio">04 Cuenta el número de actividades.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: count(//actividad)</h3>
                            <p>Número de actividades: <xsl:value-of select="count(//actividad)"/></p>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>05 Cuenta el número de actividades infantiles.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: count(//actividad[@nivel="infantil"])</h3>
                            <p>Número de actividades infantiles: <xsl:value-of select='count(//actividad[@nivel="infantil"])'/></p>
                        </div>
                    </div>

                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>06 Convertir el número de actividades a string.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: string(count(//actividad))</h3>
                            <p>Número de actividades: <xsl:value-of select="string(count(//actividad))"/></p>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>07 Suma de las sesiones semanales de las actividades para adultos.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: sum(//sesiones_semana[//actividad/@nivel="adultos"])</h3>
                            <p>Suma de las sesiones semanales de las actividades para adultos: <xsl:value-of select='sum(//sesiones_semana[//actividad/@nivel="adultos"])'/></p>
                        </div>
                    </div>


                    <div class="ejercicio">
                        <header class="headerEjercicio">
                            <h2>08 Nodos de la actividad de código A06.</h2>
                        </header>

                        <div class="opcion">
                            <h3>Opción A: //actividad[codigo="A06"]/node()</h3>
                            <ul>
                                <xsl:for-each select="//actividad">
                                    <xsl:if test='./codigo="A06"'>
                                        <li><xsl:value-of select="name(//codigo)"/>: <xsl:value-of select="./codigo/text()"/></li>
                                        <li><xsl:value-of select="name(//titulo)"/>: <xsl:value-of select="./titulo/text()"/></li>
                                        <li><xsl:value-of select="name(//fecha_inicio)"/>: <xsl:value-of select="./fecha_inicio/text()"/></li>
                                        <li><xsl:value-of select="name(//minutos_sesion)"/>: <xsl:value-of select="./sesiones/minutos_sesion/text()"/></li>
                                        <li><xsl:value-of select="name(//sesiones_semana)"/>: <xsl:value-of select="./sesiones/sesiones_semana/text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                </main>
                
                <footer>
                    <p>2019-2020. Nacho del Prado Losada. Todos los derechos Reservados</p>
                    <p>Última actualización: 04/05/2020</p>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!-- Mostrar opciones ejercicio 01  -->
    <xsl:template match="actividad">
        <xsl:if test='./@nivel="infantil"'>
            <div class="resultado">
                <ul>
                    <li><xsl:value-of select="name(codigo)"/>: <xsl:value-of select="./codigo/text()"/></li>
                    <li><xsl:value-of select="name(titulo)"/>: <xsl:value-of select="./titulo/text()"/></li>
                    <li><xsl:value-of select="name(fecha_inicio)"/>: <xsl:value-of select="./fecha_inicio/text()"/></li>
                    <li><xsl:value-of select="name(sesiones)"/>: <xsl:value-of select="./sesiones/minutos_sesion/text()"/> <xsl:value-of select="./sesiones/sesiones_semana/text()"/></li>
                </ul>
            </div>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="miHead">
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width-device-width, initial-scale-1.0"/>
        <meta name="author" content="Nacho del Prado Losada">
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
