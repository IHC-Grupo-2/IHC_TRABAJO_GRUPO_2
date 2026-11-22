# ResiliNet | HU02
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como nuevo usuario de ResiliNet, quiero registrarme ingresando únicamente mi número de DNI sin crear una contraseña obligatoria para acceder de inmediato al sistema en situaciones de riesgo sin llenar datos innecesarios.
# Acceptance criteria: CA01: El sistema debe solicitar el DNI como dato principal para iniciar el registro. CA02: Tras validar el DNI mediante el servicio de identidad disponible, el sistema debe mostrar los datos básicos recuperados para que el usuario los confirme. CA03: Una vez completado el registro, el dispositivo debe mantener la sesión activa para que el usuario pueda volver a abrir la aplicación sin iniciar sesión nuevamente.

@hu02
Feature: Registro Rápido mediante DNI (sin contraseña obligatoria)

  Scenario: Registro válido con DNI
    Given el usuario se encuentra por primera vez en ResiliNet y dispone de un DNI válido
    When ingresa su número de DNI y selecciona 'Continuar'
    Then el sistema valida el DNI, muestra los datos personales asociados para confirmación y permite avanzar a la selección de rol.

  Scenario: Intento de registro con DNI no válido
    Given el usuario se encuentra en la pantalla de registro por DNI
    When ingresa un número de DNI con formato incorrecto o no encontrado
    Then el sistema muestra un mensaje de error claro y solicita verificar el número ingresado sin crear un registro incompleto.
