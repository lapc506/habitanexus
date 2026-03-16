# Cadena de Valor (Value Chain)

> ¿Cómo fluye el valor desde el propietario hasta el inquilino?

## Flujo de Valor Principal

```mermaid
sequenceDiagram
    participant P as Propietario
    participant H as HabitaNexus
    participant I as Inquilino

    rect rgb(240, 248, 255)
        Note over P,I: DESCUBRIMIENTO
        P->>H: Lista propiedad (fotos, precio, condiciones)
        I->>H: Busca con filtro de presupuesto y zona
        H->>I: Muestra resultados filtrados
    end

    rect rgb(245, 255, 245)
        Note over P,I: CALENDARIZACIÓN
        I->>H: Agenda visita al inmueble
        H->>P: Notificación de cita programada
        Note over P,I: Visita presencial al inmueble
    end

    rect rgb(255, 248, 240)
        Note over P,I: NEGOCIACIÓN
        I->>H: Envía propuesta (precio, condiciones, mascotas)
        H->>P: Notifica propuesta
        P->>H: Envía contrapropuesta
        H->>I: Notifica contrapropuesta
        Note over P,I: Iteran hasta acuerdo
    end

    rect rgb(240, 255, 240)
        Note over P,I: CONTRATO
        P->>H: Firma contrato digital (Ley 7527)
        I->>H: Firma contrato digital
        I->>H: Deposita garantía
        H->>H: Custodia (escrow) con Trustless Worker
    end

    rect rgb(255, 255, 240)
        Note over P,I: CONVIVENCIA
        I->>H: Paga alquiler mensual (Kindo SINPE)
        H->>P: Transfiere pago
        I->>H: Reclamo (fuga, eléctrica) con fotos
        H->>P: Notifica reclamo + plazo para responder
        P->>H: Responde reclamo (acepta/rechaza)
        H->>I: Notifica resolución
        P->>H: Reclamo (ruido, daños) con fotos
        H->>I: Notifica reclamo
        I->>H: Responde
    end

    rect rgb(255, 240, 240)
        Note over P,I: FIN DE CONTRATO
        H->>I: Libera depósito (según condiciones del contrato)
        I->>H: Califica al propietario
        P->>H: Califica al inquilino
    end
```

## Máquina de Estados del Reclamo Bidireccional

```mermaid
stateDiagram-v2
    [*] --> CREADO: Inquilino o Propietario<br/>abre reclamo con fotos

    CREADO --> EN_REVISIÓN: Contraparte recibe<br/>notificación

    EN_REVISIÓN --> ACEPTADO: Contraparte acepta<br/>responsabilidad
    EN_REVISIÓN --> DISPUTADO: Contraparte rechaza<br/>el reclamo
    EN_REVISIÓN --> ESCALADO: Timeout (X días<br/>sin respuesta)

    ACEPTADO --> RESUELTO: Reparación/corrección<br/>completada con evidencia

    DISPUTADO --> MEDIACIÓN: Se asigna<br/>mediador neutral
    MEDIACIÓN --> RESUELTO: Mediador resuelve<br/>a favor de una parte
    MEDIACIÓN --> ESCALADO: Mediación<br/>no exitosa

    ESCALADO --> RESUELTO: Intervención<br/>resuelve el caso
    ESCALADO --> CALIFICACIÓN_NEGATIVA: Calificación negativa<br/>automática por no responder

    RESUELTO --> [*]
    CALIFICACIÓN_NEGATIVA --> [*]
```

## Valor Generado por Eslabón

| Eslabón | Valor para el Inquilino | Valor para el Propietario | Valor para HabitaNexus |
|---------|------------------------|--------------------------|----------------------|
| **Listado** | Propiedades filtradas por presupuesto | Inquilinos calificados que realmente pueden pagar | Inventario de la plataforma |
| **Calendarización** | Ahorro de tiempo en visitas | Menos "no-shows" | Activación del usuario |
| **Negociación** | Proceso predecible y respetuoso | Respuestas más rápidas, menos ghosting | Datos de conversión |
| **Contrato** | Seguridad jurídica sin abogado | Protección legal estandarizada | Comisión por transacción |
| **Custodia (Escrow)** | Depósito protegido | Garantía real de que el inquilino pagó | Comisión por procesamiento |
| **Reclamos** | Auditoría del inmueble con evidencia | Documentación de incumplimientos | Retención + diferenciación |
| **Calificación** | Evaluar propietarios antes de alquilar | Historial verificable de inquilinos | Efecto de red + confianza |

---

> 💡 El flujo de reclamos está inspirado en la arquitectura de AltruPets: máquina de estados con auto-escalamiento por timeout, código de seguimiento único, y fotos como evidencia.
