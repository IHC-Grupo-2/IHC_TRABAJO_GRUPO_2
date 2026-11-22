# ResiliNet | HU01
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como nuevo usuario de ResiliNet, quiero visualizar un carrusel interactivo de bienvenida de 3 pantallas al abrir la aplicación por primera vez para comprender el funcionamiento de la red en malla offline y sus funciones clave antes de ingresar al sistema.
# Acceptance criteria: CA01: El sistema debe presentar una pantalla de bienvenida (Splash Screen) con la marca ResiliNet y un carrusel de 3 tarjetas explicativas. CA02: El usuario debe poder deslizar o presionar 'Siguiente' para avanzar entre las pantallas del carrusel o presionar 'Omitir' para ir directamente al registro. CA03: La aplicación debe guardar la confirmación del onboarding para no volver a mostrarlo en futuros inicios de sesión.

@hu01
Feature: Splash Screen y Carrusel de Bienvenida (Onboarding de 3 pantallas)

  Scenario: Recorrido completo del carrusel de onboarding
    Given el usuario abre la aplicación ResiliNet por primera vez en su dispositivo
    When desliza a través de las 3 pantallas informativas y presiona el botón 'Comenzar'
    Then la aplicación guarda el estado de onboarding completado y redirige a la pantalla de registro por DNI.

  Scenario: Omisión del carrusel de bienvenida
    Given el usuario se encuentra en la primera pantalla del carrusel de bienvenida
    When presiona el botón 'Omitir' en la esquina superior derecha
    Then el sistema omite las pantallas restantes y avanza directamente al módulo de registro por DNI.
