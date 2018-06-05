# [TP1] [Ruby] MailMerger
## AYDOO 2018, UNTREF

### Nievas Soto, Matías.
### Vazques, María Victoria.

Problemática a resolver
>Realizar una aplicación que permite hacer envíos de mails masivos a partir de una plantilla, un archivo de contactos  y un archivo de datos.

>El template tiene ciertos placeholders que la aplicación reemplaza por datos obtenidos del archivo de datos al momento de enviar los mails.
Las direcciones a las que deben ser enviados los mails se encuentran en el archivo de contactos.



Detalle solución realizada
>Se implementó una api responsive, utilizando el framework Sinatra, que envía mail’s a la lista de contactos que contiene el JSON recibido como parámetro. Para enviar los mail’s se utilizó la gema MailCatcher de ruby.


Paso a paso
+
    Abrir una terminal (la cual llamaremos T1)
+
    Clonar el repositorio
+
    Levantar el servicio de mails, ejecutar comando mailcatcher
+
    Ejecutar el siguiente comando ruby app.rb
+    
    Abrir otra terminal (la cual llamaremos T2), ir a la carpeta ./archivos_de_prueba y ejecutar el siguiente comando `curl -X POST -H "Content-Type: application/json" --data @json_contactos_datos.json localhost:4567/`.
+    
    Para corroborar los mails recibidos, dirigirse con el navegador y ingresar la URL `http://localhost:1080` para visualizar los mails.

### Precondiciones
Se espera recibir un JSON que contenga los siguientes JSON:
>template {}

>contactos {}

>datos {}

### Comportamiento
+	Ante un contacto incompleto, falta de algún atributo, se lanza una excepción y se notifica por consola que se excluyó un contacto.
+	Ante la falta de alguna de las etiquetas, mencionadas en las precondiciones, lanza una excepción y se retorna el siguiente JSON {"resultado": "error, entrada incorrecta"}.
+	Al finalizar la ejecución, de no haber errores, se retorna el siguiente JSON {"resultado": "ok"}.

### Pendiente
+   Soporte parcial de tags especiales.

 [![Build Status](https://travis-ci.org/MVictoriaV/aydoo-2018-tp-mail.svg?branch=master)](https://travis-ci.org/MVictoriaV/aydoo-2018-tp-mail)