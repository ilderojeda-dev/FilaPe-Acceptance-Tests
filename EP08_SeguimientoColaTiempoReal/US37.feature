Feature: Tiempo estimado de espera

  Background:
    Given que el ciudadano ha iniciado sesión en FilaPe
    And tiene un ticket virtual registrado en la plataforma

  Scenario: Visualización del tiempo estimado de espera
    Given que el ciudadano tiene un ticket virtual activo
    And el sistema recibe información del avance de la cola
    And el ticket contiene la siguiente información:
      | id_ticket | numero_turno | posicion_actual | tiempo_estimado |
      | TCK-002   | B014         | 8               | 40 minutos      |
    When el ciudadano consulta el detalle de su turno
    And el sistema calcula el tiempo aproximado restante
    Then el sistema muestra el tiempo estimado de espera como "40 minutos"
    And actualiza la estimación conforme cambia la cola
    And permite al ciudadano organizar mejor su tiempo antes de acudir a la sede

  Scenario: Tiempo estimado no disponible por falta de datos de cola
    Given que el ciudadano tiene un ticket virtual activo
    And desea consultar el tiempo aproximado restante para su atención
    When el sistema intenta calcular el tiempo estimado de espera
    And no cuenta con información actualizada del avance de la cola
    Then el sistema no muestra una estimación incorrecta
    And presenta el mensaje "El tiempo estimado no está disponible temporalmente"
    And permite al ciudadano revisar nuevamente el estado de su turno más tarde