# ResiliNet

Plataforma móvil colaborativa de **alerta temprana y evacuación guiada sin conexión** para comunidades expuestas a huaicos, deslizamientos e inundaciones en el Perú.

> Curso: 1ASI0385 – IHC y Tecnologías Móviles · Sección 6373 · Ciclo 2026-02 · Facultad de Ingeniería, UPC
> Docente: Kevin Edgar Salazar Ruiz · Grupo 02

## Descripción

Cuando llueve fuerte, las redes celulares colapsan justo cuando más se necesitan. ResiliNet conecta a vecinos, brigadistas y comerciantes mediante una **red en malla (mesh) por Bluetooth**, con mapas y rutas de evacuación descargados con anticipación, para que la alerta llegue y la gente sepa hacia dónde ir aun sin internet ni saldo.

- **Misión:** salvar vidas y reducir el impacto de desastres naturales en comunidades vulnerables con herramientas móviles intuitivas, colaborativas y funcionales sin conexión.
- **Visión:** ser la plataforma móvil referente a nivel regional en prevención y respuesta comunitaria ante desastres geológicos y climáticos.

## Segmentos objetivo

| # | Segmento | Necesidad principal |
|---|----------|---------------------|
| 1 | Residentes y jefes de hogar en zonas vulnerables o ribereñas (Chosica, Chaclacayo, SJL) | Alertas tempranas, rutas de escape claras y saber si su familia está a salvo |
| 2 | Vecinos activos y brigadistas comunales de Defensa Civil | Coordinar la evacuación y priorizar rescates sin depender de la red celular |
| 3 | Bodegueros y comerciantes locales de quebradas y vías expuestas | Tiempo para asegurar el local y evacuar a familiares vulnerables |

## Principales características

- Alertas locales con semáforo de riesgo (verde, amarillo, naranja, rojo), sonoras y vibratorias, incluso en modo silencio.
- Red mesh Bluetooth con retransmisión multisalto: funciona sin internet.
- Mapas y rutas de evacuación precargados, con navegación GPS offline y recálculo ante vías bloqueadas.
- Botones de un solo toque: **«Estoy a salvo»** y **«Auxilio / Atrapado»**.
- Verificación cruzada entre vecinos para evitar falsas alarmas.
- Panel de triaje para brigadistas y modo «Asegurar negocio» con cuenta regresiva para comerciantes.
- Interfaz de alto contraste, botones grandes y modo de ahorro crítico de batería.

## Autores

| Integrante | Código |
|-----------|--------|
| Porras Torres, Rodrigo Gustavo | U20231F304 |
| Villavicencio Dávila, Ivette Lucero | U20241G010 |
| Farfán Abanto, Darío Enrique | U202411414 |
| Ramos Rodriguez, Jose Matias | U20241G339 |
| Manuelo Yupanqui, Ashlee Jhamylet | U20241E582 |
| Lapa De La Cruz, Daniel Eduardo | U202218690 |

## Estructura del proyecto

```
resilinet/
├── README.md
└── public/
    ├── index.html
    ├── favicon.ico
    └── assets/
        ├── styles/styles.css
        ├── images/
        └── scripts/main.js
```

## Flujo de trabajo (GitFlow)

- `main`: versión estable.
- `develop`: integración del desarrollo.
- `feature/<nombre>`: nuevas funcionalidades, siempre creadas desde `develop` (por ejemplo, `feature/landing-page`).
- `release/*` y `hotfix/*`: preparación de versiones y correcciones urgentes.

## Cómo ejecutarlo

Abrir `public/index.html` en el navegador, o usar el servidor integrado de WebStorm (clic derecho en el archivo → *Open in Browser*).
