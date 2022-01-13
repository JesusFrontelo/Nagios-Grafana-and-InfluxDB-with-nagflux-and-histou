<div align="center">
  <img align="left" height="60" width="124" src="https://upload.wikimedia.org/wikipedia/commons/8/80/Nagios_logo.png"/>
  <img align="center" height="60" width="224" src="https://grafana.com/static/assets/internal/grafana_logo-web-white-text.svg" />
  <img align="right" height="60" width="224" src="https://influxdata.github.io/branding/img/downloads/influxdata-logo--full--castle.svg" />
</div>

# Nagios-Grafana-and-InfluxDB-with-nagflux-and-histou 


En este documento explicaremos como instalar y configurar un servidor Nagios Core 4, un
servidor Grafana 6.1 y un servidor InfluxDB 1.7, todos ellos con los plugin necesarios corriendo
sobre los sistemas Debian 9 stretch y Raspbian 9 stretch, desde cero.
¿Qué son y para qué sirven cada uno de los servidores?

* **Nagios** es un sistema de monitorización de redes de código abierto ampliamente
utilizado, que vigila los equipos (hardware) y servicios que se especifiquen, alertando
cuando el comportamiento de los mismos no sea el deseado. Entre sus características
principales figuran la monitorización de servicios de red (SMTP, POP3, HTTP, SNMP,
etc.), la monitorización de los recursos de sistemas de hardware (carga del procesador,
uso de los discos, memoria, estado de los puertos, etc.), independencia de sistemas
operativos, posibilidad de monitorización remota mediante túneles SSL cifrados o SSH,
y la posibilidad de programar plugin específicos para nuevos sistemas.
Aclarar aquí que el termino servicio se usa muy libremente en Nagios y puede referirse
a servicios que corren en un host (POP, SMTP,HTTP…) o a algún otro tipo de métrica
asociada a un host (respuesta a un ping, número de usuarios logueados en el sistema,
espacio libre en un disco…)

* **Grafana** es una herramienta de código abierto para el análisis y visualización de
métricas. Se utiliza frecuentemente para visualizar de una forma elegante series de
datos en el análisis de infraestructuras y aplicaciones. Suele ir acompañada de otras
aplicaciones/plugin que la complementan, en nuestro caso InfluxDB, para
proporcionarle las fuentes de datos que alimentan las gráficas y cuadros de mando
creados.

* **InfluxDB** es una base de datos basada en series de tiempo (time-series database), ideal
para logs o datos de graficas que se generen en vivo (dashboards). Programado en go
(Lenguaje Google) permite la interacción vía API HTTP(S)(JSON) e interfaz web y los
datos se gestionan con un lenguaje similar a SQL. Este tipo de bases de datos ha
experimentado un crecimiento exponencial en los últimos años, con la popularización
de IoT, Big Data y otras tecnologías que recogen mucha información en el tiempo. Se
necesita un sistema que maneje de forma eficiente esas series de datos, con miles de
datos por segundo, y de los que necesitamos hacer cálculos y agregar información de
manera eficiente, tales como medias, máximos, búsquedas en el tiempo, etc., y todo
ello en tiempo real. Dentro de esta categoría, InfluxDB es una base de datos que
supera los esquemas SQL y NoSQL, permitiendo hacer análisis de miríadas de datos en
tiempo real.
