# DosConf2020 - Despliega tu infraestructura en Azure con Terraform

Material de la sesión "Despliega tu infraestructura en Azure con Terraform"  en dosconf 2020

Cualquier pregunta o duda o en lo que os pueda ayudar contactar conmigo a través de Twitter @alexmiravet

# Objetivo

El objetivo de la sesión  es deplegar esta infraestructura:

![](https://i.ibb.co/0B9vw7h/Arquitecture.png)

# Posts

Parte de lo explicado en la sesión  puede verse en los siguientes  posts:

[Primeros pasos provisionando infraestructura en Azure con Terraform](https://recetasdevops.com/primeros-pasos-provisionando-infraestructura-en-azure-con-terraform/)

[ Terraform 0.12 – Crear un Azure Web App](https://recetasdevops.com/terraform-0-12-crear-un-azure-web-app/)

[ Tu primer módulo de Terraform](https://recetasdevops.com/tu-primer-modulo-de-terraform/)

[ Tus tests de Azure con InSpec](https://recetasdevops.com/tus-tests-de-azure-con-inspec/)

[ Migra tu infraestructura actual de Azure a Terraform con py-az2tf](https://recetasdevops.com/migra-tu-infraestructura-actual-de-azure-a-terraform-con-py-az2tf/)

# Código fuente 

**01-Forma - La más simple**
Dentro del repositorio, en [https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/01-PrimeraForma](https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/01-PrimeraForma) podeís encontrar el código para desplegar nuestra infraestrura mencionada arriba en **Objetivo** usando Terraform de la forma más sencilla.  Esta primera forma consiste que con un único fichero de Terraform ([**main.tf**](https://github.com/recetasdevops/dosconf2020-terraform-database-module/blob/master/main.tf))  desplegar todo nuestra infraestructura. 

También se incluye una pipeline de Azure DevOps  [azure-pipelines.yml](https://github.com/agarciamiravet/dosconf-azureterraform/blob/master/src/01-PrimeraForma/azure-pipelines.yml) para realizar el despliegue de la infraestructura en CI/CD.

**02- Forma - Usando módulos**
Dentro del repositorio, en [https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/02-SegundaForma](https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/02-SegundaForma)  encontrareís como desplegar la arquitectura de ejemplo, pero esta vez haciendo uso de módulos en local. Estos módulos estan ubicados en la carpeta Modules en:

[https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/02-SegundaForma/Modules](https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/02-SegundaForma/Modules)

Haciendo uso de módulos evitamos [DRY (_Don't Repeat Yourself_)](https://es.wikipedia.org/wiki/No_te_repitas) 

En esta segunda forma, tenemos 2 módulos uno para crear nuestra base de datos , y otra para generar toda nuestra infraestrutura de nuestra web app.  Es decir creamos en nuestro módulo de webapp, los registros dns , el service plan, el web app así como el binding del certificado asociado.

También se incluye una pipeline de Azure DevOps  [azure-pipelines.yml][https://github.com/agarciamiravet/dosconf-azureterraform/blob/master/src/02-SegundaForma/azure-pipelines.yml](https://github.com/agarciamiravet/dosconf-azureterraform/blob/master/src/02-SegundaForma/azure-pipelines.yml) para realizar el despliegue de la infraestructura y además desplegar la aplicación de .Net Core una vez se ha desplegado la infraestructure.

**03-Forma-Usando múltiples directorios y módulos en remoto**
Dentro del repositorio, en [https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/03-TerceraForma](https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/03-TerceraForma)  podeís encontrar la tercera forma explciada en la sesión  para desplegar la infraestructura con Terraform.

En este caso separamos cada uno de los componentes de nuestra infraestructura en carpetas, para asi tener diferentes ficheros de estados (tfstates) y poder desplegar independientemente cada parte de nuestra infraestrutura. 

Aparte, en vez de hacer uso de módulos en local, en este ejemplo podeís ver 
el uso de módulos úbicados en remoto. En mi caso alojados en repositorios de GitHub. La ruta de estos repositorios son:

Módulo de base de datos  - [https://github.com/recetasdevops/dosconf2020-terraform-database-module](https://github.com/recetasdevops/dosconf2020-terraform-database-module)

Módulo WebApp - [https://github.com/recetasdevops/dosconf2020-terraform-webapp-module](https://github.com/recetasdevops/dosconf2020-terraform-webapp-module)


Asimismo dentro de esta tercera forma, podeís encontrar algunos tests realizados con Inspec.  La ubicación de estos tests es:

[https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/03-TerceraForma/VerificationTests](https://github.com/agarciamiravet/dosconf-azureterraform/tree/master/src/03-TerceraForma/VerificationTests)


Como en los formas anteriores, se incluye la pipeline de Azure DevOps que esta en la siguiente ruta:

[https://github.com/agarciamiravet/dosconf-azureterraform/blob/master/src/03-TerceraForma/azure-pipelines.yml](https://github.com/agarciamiravet/dosconf-azureterraform/blob/master/src/03-TerceraForma/azure-pipelines.yml)


En esta pipeline se despliega primero la infraestructura de base de datos. Una vez desplegada correctamente, se despliega la infraestructura de la WebApp. Por último para corroborar que aquella infraestructura que hemos desplegado es la correcta tal y como queremos que esté, lanzamos los tests de Inspec.
