# Crowdfunding Social - Proyecto Final

Aplicación de Crowdfunding para proyectos sociales desarrollada como parte del curso de Tecnologías de Construcción de Software. La plataforma permite a los usuarios registrados donar a causas sociales en diversas monedas, realizando conversiones automáticas y manteniendo la integridad transaccional.

## 🚀 Requisitos Técnicos Implementados

El proyecto cumple con los siguientes pilares del curso:

1.  **Internacionalización (i18n):** Soporte completo para Español (`es`) y Inglés (`en`) en toda la interfaz y rutas de la aplicación.
2.  **Validadores tipo Regex:** Implementación de expresiones regulares para la validación de correos electrónicos y códigos de transacción bancaria simbólicos.
3.  **Control de Transacciones:** Uso de *Service Objects* y bloques `ActiveRecord::Base.transaction` para asegurar la atomicidad en el proceso de donación.
4.  **Uso de API REST:** * **Consumo:** Integración con la API de Fixer.io para obtener tasas de cambio en tiempo real (con sistema de caché de 12h y Fallbacks de seguridad).
    * **Provisión:** Exposición de endpoints locales para consultar proyectos en formato JSON.

## 🛠️ Tecnologías

* **Lenguaje:** Ruby 3.3.5
* **Framework:** Rails 8.1.1
* **Base de Datos:** PostgreSQL
* **Gestión de APIs:** Faraday
* **Autenticación:** Sistema nativo de Rails 8 (Generado por `rails generate authentication`)

## 📋 Prerrequisitos

Asegúrate de tener instalados en tu sistema (optimizado para Apple Silicon M2):

* Ruby 3.3.5 (gestionado con `rbenv`)
* Rails 8.1.1
* PostgreSQL 16+

## 🔧 Instalación

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/tu-usuario/crowdfunding_app.git](https://github.com/tu-usuario/crowdfunding_app.git)
    cd crowdfunding_app
    ```

2.  **Instalar dependencias:**
    ```bash
    bundle install
    ```

3.  **Configurar variables de entorno:**
    Crea un archivo `.env` en la raíz del proyecto para la API de Fixer.io:
    ```text
    FIXER_API_KEY=tu_clave_de_fixer_io
    ```

4.  **Configurar la base de datos:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

5.  **Activar la caché de desarrollo (Crucial para no agotar créditos de la API):**
    ```bash
    rails dev:cache
    ```

## 🏃 Ejecución

Inicia el servidor local:
```bash
rails server