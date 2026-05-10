# foodtrack-db
Diseñar el esquema relacional inicial de FoodTrack, una plataforma para gestionar operaciones de foodtrucks en distintos puntos de una ciudad.

Implementá este esquema en Microsoft SQL Server, utilizando DBeaver como cliente, y gestioná todas las versiones del proyecto con Git y GitHub.

La base debe contemplar la información de foodtrucks, productos, pedidos, ubicaciones y detalle de ítems pedidos. El objetivo es simular un entorno de desarrollo profesional, donde se trabaja con un motor robusto como SQL Server y se aplica versionado desde el inicio del proyecto.

Bases para trabajar:

- foodtrucks
- locations
- order_items
- orders
- products

![Diagrama ER](assets/foodtrucks_db.png)

## Estructura de la base de datos

La base de datos `DBEAVER` está compuesta por cinco tablas que modelan las operaciones de una red de foodtrucks.

### `foodtrucks`

Tabla central del esquema. Registra cada foodtruck activo en la plataforma.

| Columna | Tipo | Descripción |
|---|---|---|
| `foodtruck_id` | INT (PK) | Identificador único del foodtruck |
| `name` | NVARCHAR(100) | Nombre comercial del foodtruck |
| `cuisine_type` | NVARCHAR(100) | Tipo de cocina que ofrece (ej: mexicana, italiana) |
| `city` | NVARCHAR(100) | Ciudad en la que opera |

---

### `locations`

Registra las ubicaciones operativas de cada foodtruck a lo largo del tiempo. Un mismo foodtruck puede aparecer en múltiples zonas en distintas fechas.

| Columna | Tipo | Descripción |
|---|---|---|
| `location_id` | INT (PK) | Identificador único de la ubicación |
| `foodtruck_id` | INT (FK → foodtrucks) | Foodtruck al que pertenece esta ubicación |
| `location_date` | DATE | Fecha en que el foodtruck operó en esa zona |
| `zone` | NVARCHAR(100) | Nombre de la zona o punto de la ciudad |

**Relación:** `foodtrucks` 1 → N `locations`

---

### `products`

Catálogo de productos disponibles por foodtruck. Cada foodtruck gestiona su propio menú de forma independiente.

| Columna | Tipo | Descripción |
|---|---|---|
| `product_id` | INT (PK) | Identificador único del producto |
| `foodtruck_id` | INT (FK → foodtrucks) | Foodtruck que ofrece este producto |
| `name` | NVARCHAR(200) | Nombre del producto |
| `price` | DECIMAL | Precio unitario del producto |
| `stock` | INT | Unidades disponibles en inventario |

**Relación:** `foodtrucks` 1 → N `products`

---

### `orders`

Registra los pedidos realizados a cada foodtruck. Incluye el estado del pedido, el monto total y un campo opcional de comentarios del cliente.

| Columna | Tipo | Descripción |
|---|---|---|
| `order_id` | INT (PK) | Identificador único del pedido |
| `foodtruck_id` | INT (FK → foodtrucks) | Foodtruck que recibe el pedido |
| `order_date` | DATE | Fecha en que se realizó el pedido |
| `status` | NVARCHAR(200) | Estado actual (ej: pendiente, completado, cancelado) |
| `total` | INT | Monto total del pedido |
| `comentarios` | NVARCHAR(200) | Observaciones opcionales del cliente |

**Relación:** `foodtrucks` 1 → N `orders`

---

### `order_items`

Tabla de detalle de pedidos. Vincula cada pedido con los productos específicos que lo componen. Es la tabla pivote entre `orders` y `products`.

| Columna | Tipo | Descripción |
|---|---|---|
| `order_item_id` | INT (PK) | Identificador único del ítem |
| `order_id` | INT (FK → orders) | Pedido al que pertenece este ítem |
| `product_id` | INT (FK → products) | Producto incluido en el pedido |
| `quantity` | INT | Cantidad solicitada de ese producto |

**Relaciones:**
- `orders` 1 → N `order_items`
- `products` 1 → N `order_items`

---
