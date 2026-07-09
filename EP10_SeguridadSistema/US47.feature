Feature: Validación de identidad previo al acceso

  Background:
    Given que el usuario ha iniciado sesión en FilaPe
    And tiene una cuenta activa en la plataforma

  Scenario: Acceso a función sensible con validación adicional
    Given que el usuario intenta realizar una acción sensible
    And la acción seleccionada contiene la siguiente información:
      | accion             | requiere_validacion |
      | Cancelar un turno  | Si                  |
    When el sistema detecta que la acción requiere validación adicional
    And solicita un PIN, contraseña o código enviado al contacto registrado
    Then el sistema permite ejecutar la acción solo si la verificación es exitosa
    And registra el intento en el log de seguridad
    And mantiene protegida la acción sensible

  Scenario: Acción sensible bloqueada por verificación fallida
    Given que el usuario intenta realizar una acción sensible dentro de FilaPe
    And el sistema solicita una verificación adicional mediante PIN, contraseña o código de seguridad
    When el usuario ingresa un código incorrecto o no completa la verificación
    And confirma la acción solicitada
    Then el sistema no permite ejecutar la acción sensible
    And muestra el mensaje "La validación de identidad falló"
    And registra el intento fallido en el log de seguridad