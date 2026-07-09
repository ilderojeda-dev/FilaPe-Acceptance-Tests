Feature: Protección de datos personales

  Background:
    Given que el usuario ha iniciado sesión en FilaPe
    And tiene una cuenta registrada en la plataforma

  Scenario: Datos personales protegidos correctamente
    Given que el perfil del usuario contiene la siguiente información sensible:
      | dni      | nombres       | telefono  | correo         |
      | 76543210 | Juan Ramirez  | 987654321 | juan@email.com |
    When el usuario accede o modifica información de su perfil
    Then el sistema protege los datos sensibles durante la transmisión y almacenamiento
    And no expone datos personales a terceros sin consentimiento del usuario
    And cumple con la normativa vigente de protección de datos personales

  Scenario: Acceso rechazado a datos personales sin autorización
    Given que un usuario o proceso intenta acceder a información personal de un ciudadano
    And no cuenta con permisos válidos para consultar dichos datos
    When solicita visualizar o modificar la información del perfil
    And el sistema valida sus permisos de acceso
    Then el sistema bloquea el acceso a los datos personales
    And muestra el mensaje "No cuenta con autorización suficiente"
    And registra el intento de acceso no autorizado para fines de seguridad