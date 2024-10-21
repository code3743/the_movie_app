
# The Movie App

Esta es una aplicación simple de películas que permite a los usuarios buscar películas y ver detalles sobre ellas. La aplicación utiliza la [API de The Movie Database](https://www.themoviedb.org/) para obtener datos sobre las películas.

## Desarrollo

La aplicación está desarrollada en Flutter y utiliza los siguientes paquetes:

- `flutter_riverpod`: ^2.5.3
- `go_router`: ^14.3.0
- `http`: ^1.2.2

## Cómo Ejecutar el Proyecto

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/code3743/the_movie_app.git
   cd the_movie_app
   ```

2. **Instala las dependencias:**
   ```bash
   flutter pub get
   ```

3. **Configura tu API Key:**
   - Abre el archivo `lib/config/constants/api_themoviedb.dart`.
   - Establece tu API Key en la constante correspondiente.

   ```dart
    const String API_KEY = 'YOUR_API_KEY'
    ```

4. **Ejecuta la aplicación:**
   ```bash
   flutter run
   ```

## Estructura del Proyecto

La arquitectura utilizada en este proyecto implementa una arquitectura limpia, promoviendo la separación de responsabilidades y facilitando el mantenimiento y la escalabilidad de la aplicación. La estructura se organiza en varias capas:

- **Capa Común (common):** Aquí se encuentran componentes reutilizables como proveedores de estado, utilidades y widgets, lo que permite un desarrollo más eficiente y modular.

- **Capa de Configuración (config):** Esta sección incluye constantes, configuraciones de la API y proveedores específicos, asegurando que la lógica de configuración esté centralizada y sea fácilmente accesible.

- **Capa de Datos (data):** Se encarga de la gestión de datos, incluyendo las fuentes de datos, excepciones, modelos y repositorios, permitiendo una separación clara entre la lógica de negocio y la lógica de acceso a datos.

- **Capa de Dominio (domain):** Contiene la lógica de negocio y las entidades, manteniendo la independencia del resto de la aplicación y facilitando pruebas unitarias.

- **Capa de Interfaz de Usuario (ui):** Organiza las pantallas y widgets de la aplicación, separando claramente la lógica de presentación de la lógica de negocio.

```
.
├── lib
│   ├── common               # Componentes reutilizables
│   │   ├── providers        # Proveedores de estado
│   │   │   ├── genre_provider.dart
│   │   │   └── now_playing_provider.dart
│   │   ├── utils            # Utilidades generales
│   │   │   └── format_image_url.dart
│   │   └── widgets          # Widgets reutilizables
│   │       ├── app_logo.dart
│   │       ├── custom_button.dart
│   │       ├── movie_collection.dart
│   │       ├── movie_tile.dart
│   │       └── widgets.dart
│   ├── config               # Configuraciones de la aplicación
│   │   ├── constants        # Constantes y configuraciones de la API
│   │   │   └── api_themoviedb.dart
│   │   ├── providers        # Proveedores de la aplicación
│   │   │   ├── genre_usecase_provider.dart
│   │   │   ├── movie_repository_provider.dart
│   │   │   ├── movie_usecase_provider.dart
│   │   │   └── search_usecase_provider.dart
│   │   ├── router           # Rutas de navegación
│   │   │   ├── app_router.dart
│   │   │   └── app_router_name.dart
│   │   └── themes           # Temas de la aplicación
│   │       ├── app_colors.dart
│   │       ├── app_fonts.dart
│   │       ├── app_sizes.dart
│   │       └── app_themes.dart
│   ├── data                 # Gestión de datos
│   │   └── api             # Implementación de la API
│   │       ├── datasources  # Fuentes de datos
│   │       │   └── themoviedb_datasource.dart
│   │       ├── exceptions    # Manejo de excepciones
│   │       │   └── api_exception.dart
│   │       ├── models        # Modelos de datos
│   │       │   ├── casting_model.dart
│   │       │   ├── genre_model.dart
│   │       │   └── movie_model.dart
│   │       └── repositories   # Implementaciones de repositorios
│   │           └── movie_repository_impl.dart
│   ├── domain               # Lógica de negocio
│   │   ├── datasources      # Interfaces de fuentes de datos
│   │   │   └── movie_datasource.dart
│   │   ├── entities         # Entidades del dominio
│   │   │   ├── cast.dart
│   │   │   ├── genre.dart
│   │   │   └── movie.dart
│   │   ├── repositories      # Interfaces de repositorios
│   │   │   └── movie_repository.dart
│   │   └── usecases         # Casos de uso
│   │       ├── genre_usecase.dart
│   │       ├── movie_usecase.dart
│   │       └── search_usecase.dart
│   ├── main.dart            # Punto de entrada de la aplicación
│   └── ui                  # Interfaz de usuario
│       ├── details          # Pantalla de detalles de la película
│       │   ├── providers
│       │   │   └── movie_details_provider.dart
│       │   ├── screen
│       │   │   └── movie_details.dart
│       │   └── widgets
│       │       ├── expandable_text.dart
│       │       ├── movie_cast.dart
│       │       ├── movie_detail.dart
│       │       ├── movie_poster.dart
│       │       └── widgets.dart
│       ├── home             # Pantalla principal
│       │   ├── delegate
│       │   │   └── movie_search_delegate.dart
│       │   ├── providers
│       │   │   ├── get_movies_provider.dart
│       │   │   ├── movies_by_category_provider.dart
│       │   │   └── movie_search_provider.dart
│       │   ├── screen
│       │   │   └── home_screen.dart
│       │   └── widgets
│       │       ├── list_category.dart
│       │       ├── movie_banner.dart
│       │       ├── movie_genre_section.dart
│       │       ├── movie_preview.dart
│       │       ├── text_category.dart
│       │       └── widgets.dart
│       └── splash            # Pantalla de inicio
│           ├── screen
│           │   └── splash_screen.dart
│           └── widgets
│               ├── movie_list.dart
│               └── movie_splash.dart
├── test                    # Pruebas unitarias
│   ├── common
│   │   ├── utils
│   │   │   └── format_image_url_test.dart
│   │   └── widgets
│   │       ├── app_logo_test.dart
│   │       ├── custom_button_test.dart
│   │       ├── movie_collection_test.dart
│   │       └── movie_tile_test.dart
│   ├── datasource
│   │   └── test_movie_datasource.dart
│   ├── domain
│   │   └── usecases
│   │       ├── genre_usecase_test.dart
│   │       ├── movie_usecase_test.dart
│   │       └── search_usecase.dart
│   └── ui
│       ├── home
│       │   └── widgets
│       │       ├── list_category_test.dart
│       │       └── movie_banner_test.dart
│       └── splash
│           └── widgets
│               └── movie_list_test.dart
```

### Ejecución de Pruebas

Para ejecutar las pruebas unitarias, utiliza el siguiente comando:

```bash
flutter test
```

## Mejoras y Optimización

### Otras Bibliotecas o Paquetes de Flutter

- **Hive o Shared Preferences:** Para almacenar datos en caché como los favoritos de los usuarios.
- **Dio:** Para mejorar las solicitudes HTTP y manejar errores de forma más eficaz.

### Optimización del Rendimiento

- **Imágenes en caché:** Implementar un sistema de caché para las imágenes, utilizando paquetes como `cached_network_image`.
- **Lazy loading:** Cargar datos bajo demanda, por ejemplo, al hacer scroll hacia abajo en la lista.

### Características Adicionales

- **Favoritos:** Podría utilizar una base de datos local, como SQLite o Hive, para almacenar las películas que los usuarios marquen como favoritas, alternativamente, se podría usar un servicio en la nube como Firebase Firestore para sincronizar estos datos entre dispositivos.
- **Calificaciones:** Similar a los favoritos, las calificaciones podrían almacenarse en una base de datos local o en la nube.
- **Notificaciones push:** Para enviar notificaciones sobre nuevas películas o actualizaciones, se puede integrar Firebase Cloud Messaging (FCM). Esto permitiría enviar mensajes a los dispositivos de los usuarios de manera sencilla.

