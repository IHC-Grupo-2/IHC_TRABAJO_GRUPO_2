# ResiliNet | HU50
# Source: TF IHC - Grupo02 5.1.2.docx > 3.2 User Stories
# Specification only: not an executed/automated test result.
# User story: Como comerciante de zona de riesgo, quiero retransmitir alertas a los clientes en mi tienda, emitir advertencias de proximidad a peatones, coordinar vigilancia vecinal post-evacuación, registrar pérdidas en caché y ofrecer inventario solidario para proteger mi comunidad, resguardar mi negocio y apoyar el socorro local sin dependencia de internet.
# Acceptance criteria: CA01: Retransmisión a Clientes (US46): La app del comerciante debe difundir automáticamente la alerta activa a los teléfonos de los clientes presentes en el local mediante balizamiento BLE sin requerir datos. CA02: Advertencia a Peatones (US48): El dispositivo del comerciante debe actuar como baliza de proximidad emitiendo un aviso de advertencia a los peatones que se acerquen a menos de 15 metros de calles anegadas. CA03: Vigilancia Vecinal Post-Evacuación (US49): La app debe permitir la creación de una sala de chat mesh P2P entre bodegueros en el refugio para organizar la vigilancia de locales abandonados y prevenir saqueos. CA04: Inventario Solidario de Emergencia (US50): El comerciante debe poder registrar agua o víveres disponibles para donación, sincronizándolo offline con el panel de la brigada mediante escaneo de código QR. CA05: Registro Local de Pérdidas y Daños (US47): Tras el desastre, el comerciante debe poder tomar fotos y registrar los daños en mercadería en una base de datos local encriptada para su posterior carga automática al municipio al restablecerse la red.

@hu50
Feature: Módulo Integrado de Continuidad, Vigilancia y Solidaridad Comercial P2P

  Scenario: Retransmisión de alerta a clientes en tienda y balizamiento peatonal (US46 / US48)
    Given que el comerciante tiene la aplicación activa en modo de alerta crítica
    When los clientes o peatones se aproximan a menos de 15 metros del establecimiento con Bluetooth encendido
    Then sus dispositivos reciben automáticamente la carga útil de la alerta y la advertencia de calle inundada sin requerir saldo ni datos móviles.

  Scenario: Coordinación de vigilancia vecinal P2P e inventario solidario con brigadas (US49 / US50 / US47)
    Given que los comerciantes se encuentran reunidos en la zona segura y sin acceso a internet
    When forman un grupo de chat mesh offline para patrullaje comercial y registran suministros de agua para donación mediante código QR
    Then los registros de seguridad e inventario se sincronizan inmediatamente con los tableros de los brigadistas y se guardan en la caché local para reporte municipal posterior.
