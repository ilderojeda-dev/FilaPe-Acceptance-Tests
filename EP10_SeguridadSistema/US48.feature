Feature: Alerta de acceso sospechoso

  Background:
    Given que el usuario tiene una cuenta registrada en FilaPe
    And el sistema registra los intentos de inicio de sesión

  Scenario: Acceso sospechoso detectado
    Given que el sistema detecta un intento de inicio de sesión con los siguientes datos:
      | dispositivo          | ubicacion    | intentos_fallidos |
      | Equipo desconocido   | Otra ciudad  | 3                 |
    When el intento de acceso se realiza desde un dispositivo o ubicación no reconocida
    And se detectan múltiples intentos fallidos
    Then el sistema envía una alerta inmediata al canal de contacto registrado del usuario
    And bloquea temporalmente el acceso a la cuenta
    And permite al usuario restablecer su contraseña desde la alerta recibida

  Scenario: Inicio de sesión permitido sin alerta por acceso reconocido
    Given que el usuario intenta iniciar sesión con los siguientes datos:
      | dispositivo        | ubicacion | intentos_fallidos |
      | Celular registrado | Lima      | 0                 |
    When el sistema analiza el intento de acceso
    And no detecta señales de riesgo o comportamiento sospechoso
    Then el sistema permite el inicio de sesión normalmente
    And no envía una alerta de acceso sospechoso
    And registra el acceso como una actividad normal dentro de la cuenta