# 🚀 FilaPe - Acceptance Tests

## 📌 Descripción del proyecto

**FilaPe** es una plataforma digital propuesta por la startup **GovTech Perú**, orientada a mejorar la gestión de turnos virtuales en entidades públicas del Perú. La solución busca reducir las largas colas presenciales, optimizar el tiempo de los ciudadanos y brindar una experiencia de atención más organizada, accesible y eficiente.

Este repositorio contiene las **pruebas de aceptación** del proyecto, desarrolladas en lenguaje **Gherkin** mediante archivos `.feature`. Las pruebas permiten validar el comportamiento esperado del sistema a través de escenarios claros, considerando tanto el flujo exitoso como los flujos alternativos o no exitosos.

---

## 🎯 Objetivo del repositorio

El objetivo de este repositorio es organizar las pruebas de aceptación correspondientes a las épicas seleccionadas para la validación del sistema FilaPe.

Las pruebas fueron redactadas usando la estructura:

```gherkin
Feature
Background
Scenario
Given
When
Then
```

Además, se incluyen **data tables** cuando es necesario representar información específica como tickets, turnos, estados, sedes, usuarios o datos de seguridad.

---

## 🧪 Épicas validadas

Para las pruebas de aceptación se seleccionaron dos épicas funcionales del **core business** y una épica no funcional relacionada con seguridad:

| Tipo | Épica | Descripción |
|---|---|---|
| Core business | **EP06 - Generación de ticket virtual** | Valida la creación, visualización, descarga, QR y cancelación del ticket virtual. |
| Core business | **EP08 - Seguimiento de cola en tiempo real** | Valida la posición en cola, tiempo estimado, personas antes del turno y actualización automática. |
| No funcional | **EP10 - Seguridad del sistema** | Valida protección de datos, accesos seguros, alertas, auditoría y conexión segura con entidades públicas. |

---

## 📁 Organización del repositorio

El repositorio está organizado por épicas. Dentro de cada carpeta se encuentra un archivo `.feature` por cada historia de usuario evaluada.

```text
FilaPe-Acceptance-Tests
│
├── EP06_GeneracionTicketVirtual
│   ├── US26.feature
│   ├── US27.feature
│   ├── US28.feature
│   ├── US29.feature
│   └── US30.feature
│
├── EP08_SeguimientoColaTiempoReal
│   ├── US36.feature
│   ├── US37.feature
│   ├── US38.feature
│   ├── US39.feature
│   └── US40.feature
│
└── EP10_SeguridadSistema
    ├── US46.feature
    ├── US47.feature
    ├── US48.feature
    ├── US49.feature
    └── US50.feature
```

---

## 📄 Archivos por épica

### 🎫 EP06 - Generación de ticket virtual

| Archivo | Historia de usuario |
|---|---|
| `US26.feature` | Generación de ticket virtual |
| `US27.feature` | Visualización de número de turno |
| `US28.feature` | Código QR del ticket |
| `US29.feature` | Guardado o descarga del ticket |
| `US30.feature` | Cancelación de ticket virtual |

### ⏱️ EP08 - Seguimiento de cola en tiempo real

| Archivo | Historia de usuario |
|---|---|
| `US36.feature` | Posición actual en cola |
| `US37.feature` | Tiempo estimado de espera |
| `US38.feature` | Personas antes del turno |
| `US39.feature` | Actualización automática del avance de cola |
| `US40.feature` | Consulta del estado del turno |

### 🔐 EP10 - Seguridad del sistema

| Archivo | Historia de usuario |
|---|---|
| `US46.feature` | Protección de datos personales |
| `US47.feature` | Validación de identidad previo al acceso |
| `US48.feature` | Alerta de acceso sospechoso |
| `US49.feature` | Registro de acciones importantes del usuario |
| `US50.feature` | Protección de la conexión con entidades públicas |

---

## 🔄 Tipos de escenarios considerados

Las pruebas incluyen dos tipos de escenarios:

| Tipo de escenario | Descripción |
|---|---|
| ✅ Escenario exitoso | Representa el flujo esperado cuando el usuario o sistema realiza la acción correctamente. |
| ⚠️ Escenario alternativo | Representa errores, restricciones, falta de disponibilidad, datos inválidos o fallas de conexión. |

Esto permite validar no solo el funcionamiento ideal de FilaPe, sino también cómo responde el sistema ante situaciones no esperadas.

---

## 🛠️ Tecnologías y herramientas utilizadas

- **Gherkin** para la redacción de pruebas de aceptación.
- **Visual Studio Code** como editor de trabajo.
- **Git** para control de versiones.
- **GitHub** para almacenamiento y evidencia del repositorio.
- **Trello** como apoyo para la organización de sprint backlogs.

---

## 👥 Equipo

Proyecto desarrollado como parte del curso **Ingeniería de Requisitos**.

**Startup:** GovTech Perú  
**Servicio:** FilaPe  
**Solución:** Plataforma digital de gestión inteligente de turnos virtuales para entidades públicas.

---

## 📌 Estado del repositorio

✅ Estructura organizada por épicas.  
✅ Archivos `.feature` separados por historia de usuario.  
✅ Escenarios redactados en formato Given–When–Then.  
✅ Uso de Background y data tables en los casos correspondientes.  
✅ Pruebas alineadas con las épicas seleccionadas para la validación del proyecto.

---

## 📚 Nota

Este repositorio forma parte de la documentación de validación del proyecto FilaPe y sirve como evidencia del desarrollo de las pruebas de aceptación solicitadas en el informe final.
