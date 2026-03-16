# Estructura de Costos (Cost Structure)

> ¿Cuánto cuesta operar HabitaNexus?

## Costos Fijos

| Concepto | Costo Mensual | Notas |
|----------|--------------|-------|
| Infraestructura cloud (Azure AKS staging + prod) | ~$1.086/mes (~₡530.000) | Estimación con AKS; control plane gratis. Cubierto por Microsoft for Startups ($5.000 créditos = ~5 meses) |
| Dominio + DNS | ~₡5.000/mes | .com + .cr |
| Herramientas de desarrollo (GitHub Pro, Figma) | ~₡15.000/mes | GitHub gratis con Microsoft for Startups |
| **Subtotal fijo** | **~₡550.000/mes** | |

## Costos Variables

| Concepto | Costo por Unidad | Notas |
|----------|-----------------|-------|
| Procesamiento de pagos (Kindo/ONVO) | 1-3% por transacción | Se traslada al usuario |
| Custodia (escrow) Trustless Worker | Por definir | Comisión por custodia |
| Verificación de propietarios | ~₡2.000/verificación | Servicio de identidad |
| Marketing (publicidad Facebook/Instagram) | ₡50.000-₡200.000/mes | Cuando haya producto listo |

## Inversión Inicial

| Concepto | Monto | Notas |
|----------|-------|-------|
| Validación legal de plantillas de contrato (Sfera Legal) | ~₡500.000-₡1.500.000 | Una vez; reutilizable para cada transacción |
| Diseño UX/UI (freelancer o equipo) | ~₡300.000-₡800.000 | Figma screens principales |
| Infraestructura primeros 5 meses | $0 | Cubierto por Microsoft for Startups |
| **Total inversión inicial** | **~₡800.000-₡2.300.000** | (~$1.600-$4.600 USD) |

## Punto de Equilibrio (Break-Even)

| Métrica | Valor |
|---------|-------|
| Costos fijos mensuales (post-créditos) | ~₡550.000/mes |
| Ingreso promedio por propietario suscrito | ₡10.000-₡30.000/mes |
| Propietarios necesarios para punto de equilibrio | **~25-55 propietarios** |
| Tiempo estimado para alcanzar punto de equilibrio | **6-12 meses** |

## Comparación de Programas Cloud para Startups

| Programa | Créditos iniciales | Costo K8s control plane | Mejor para |
|----------|-------------------|------------------------|------------|
| **Microsoft for Startups** | $5.000 (sin inversor) | **$0/mes (AKS gratis)** | ✅ Recomendado — menor barrera, más créditos accesibles |
| Google for Startups | $2.000 (sin fondeo) | $0-$73/mes (GKE) | Bueno si consigue fondeo institucional ($100K-$200K) |
| AWS Activate | $1.000 (sin proveedor) | $73/mes (EKS) | Solo si consigue proveedor aprobado o Impact Accelerator |

## Economías de Escala

A medida que HabitaNexus crece:
- **Costo por transacción baja**: Las plantillas de contrato ya están validadas; cada contrato adicional es marginal
- **Infraestructura escala sub-linealmente**: Kubernetes auto-escala; no hay que duplicar servidores
- **Costo de adquisición baja**: Efecto de red + referidos reducen CAC con el tiempo
- **Margen bruto mejora**: De ~30% en mes 1 a >70% en mes 12
