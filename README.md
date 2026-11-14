# ResiliNet

Proyecto del curso IHC y Tecnologías Móviles, sección 6373 — Grupo 2.

ResiliNet es una propuesta de alerta temprana, evacuación y comunicación comunitaria ante huaicos y deslizamientos. Busca conectar a vecinos, brigadistas y comerciantes, incluso cuando hay poca señal o se interrumpe el acceso a internet.

## Integrantes

- Rodrigo Gustavo Porras Torres
- Ivette Lucero Villavicencio Dávila
- Darío Enrique Farfán Abanto
- Jose Matias Ramos Rodriguez
- Ashlee Jhamylet Manuelo Yupanqui
- Daniel Eduardo Lapa De La Cruz

## Segmentos objetivo

- **Residentes y jefes de hogar:** familias que viven en zonas vulnerables o cercanas a ríos y quebradas.
- **Brigadistas y vecinos activos:** personas que apoyan la organización de la comunidad y la respuesta ante emergencias.
- **Bodegueros y comerciantes:** personas que necesitan proteger su negocio y coordinar la evacuación de sus familias.

## Características de la solución propuesta

- Alertas tempranas y reportes de riesgos de la comunidad.
- Mapas descargados y rutas de evacuación que se puedan consultar sin internet.
- Comunicación entre dispositivos mediante una red Bluetooth en malla.
- Ubicación de puntos de encuentro y refugios.
- Solicitudes de ayuda y consulta del estado de familiares.

Estas características describen la propuesta completa. Este repositorio contiene el avance de su Landing Page, no una plataforma operativa de emergencias.

## Avance de la semana 12

- Página de Inicio basada en el mockup del grupo.
- Encabezado, presentación, panel de ejemplo, tarjetas de características y pie de página.
- Diseño adaptable a computadora y celular, con menú desplegable.
- Prerregistro de demostración con validación de campos. No envía ni almacena datos.
- Ventanas con información y enlaces a los diseños de las funciones pendientes.

El mapa en vivo, los reportes, el inicio de sesión y la descarga de la app todavía no están implementados. Las alertas visibles son datos de ejemplo del diseño. Se usa «Prerregistro» según el documento de wireframes más reciente; no se solicita DNI ni se simula una validación de identidad.

## Cómo abrir la página

1. Abrir este proyecto en WebStorm.
2. Abrir `public/index.html`.
3. Elegir **Open in Browser** o abrir ese archivo directamente desde el explorador de archivos.

No requiere instalar paquetes ni ejecutar un proceso de compilación. El logo, los iconos, los fondos y las fuentes están guardados en el proyecto. Los enlaces al prototipo de Figma sí requieren internet y acceso al archivo.

## Estructura

```text
public/
├── index.html
├── favicon.ico
└── assets/
    ├── styles/
    │   └── styles.css
    ├── scripts/
    │   └── main.js
    ├── images/
    └── fonts/
```

Se utiliza HTML, CSS y JavaScript, sin frameworks CSS. La tipografía Inter se obtuvo de Google Fonts y se incluye con su licencia. El logo, los iconos y los fondos provienen del Figma del grupo.

## Ramas de trabajo

- `main`: versión estable.
- `develop`: integración de los avances del grupo.
- `feature/estructura-base`: estructura del proyecto y primer avance de Inicio; creada desde `develop`.

La rama `feature/estructura-base` se creó desde `develop` para preparar este avance. Antes de integrar cambios, coordinar con el grupo y revisar los avances de otros integrantes. Cada nueva tarea debe partir de `develop` y usar un nombre como `feature/nombre-de-la-tarea`.

## Referencias del proyecto

- [Informe del Grupo 2](https://docs.google.com/document/d/1ljunTfXh2i6ndcldRosbKEGBy-jAVXaggyJ_5tEzFSc)
- [Wireflows y Landing Page Wireframes](https://docs.google.com/document/d/1a3nTzEHOzsN_VEwyWNCeL_ei9-ao0GjMn0VZo8YR12s)
- [Mockup de Inicio](https://www.figma.com/design/A73C7JusqqelOPR779nzMy/Mockup?node-id=89-1423)
- [Guía de estilos](https://www.figma.com/design/YmPO8xMFbosd5xCGxBGh3D/IHC_Guia-de-Estilos?node-id=0-1)
- [Prototipo móvil](https://www.figma.com/design/RCyX6w1rBZle6BDl1vobjG/PROTOTIPO-RESILINET?node-id=0-1)
