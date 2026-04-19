# AGENTS.md — Website BusGasteiz

Landing page estática del proyecto BusGasteiz, accesible en **busgasteiz.eu**.

---

## Estructura del repositorio

```
website/
├── index.html              # Redirección automática al idioma del navegador (eu / es / en)
├── style.css               # Estilos globales compartidos por todas las páginas
├── page-home.css           # Estilos específicos de la página de inicio (hero, badges)
├── page-content.css        # Estilos específicos de páginas de contenido (privacidad, términos)
├── icon.png                # Icono de la app (usado en el hero de la landing)
├── app_store_en.svg        # Badge "Download on the App Store" (inglés)
├── app_store_es.svg        # Badge "Descargar en el App Store" (castellano/euskera)
├── CNAME                   # Dominio personalizado de GitHub Pages: busgasteiz.eu
├── docker-compose.yml      # Servidor nginx local para desarrollo
├── Makefile                # Atajos: make start / stop / restart
├── LICENSE
├── en/
│   ├── index.html          # Landing en inglés
│   ├── privacy.html        # Política de privacidad en inglés
│   └── terms.html          # Términos y condiciones en inglés
├── es/
│   ├── index.html          # Landing en castellano
│   ├── privacy.html        # Política de privacidad en castellano
│   └── terms.html          # Términos y condiciones en castellano
└── eu/
    ├── index.html          # Landing en euskera
    ├── privacy.html        # Política de privacidad en euskera
    └── terms.html          # Términos y condiciones en euskera
```

---

## Tecnologías

- **HTML + CSS** puro. Sin frameworks ni herramientas de build.
- **JavaScript** mínimo: solo el fragmento de detección de idioma en `index.html`.
- Servido localmente con **nginx** vía Docker.
- Desplegado en **GitHub Pages** con dominio personalizado (`CNAME`).

---

## Idiomas

`index.html` detecta el idioma preferido del navegador (`navigator.languages`) y redirige a la
subcarpeta correspondiente. Los idiomas soportados son:

| Subcarpeta | Idioma     |
|------------|------------|
| `eu/`      | Euskera    |
| `es/`      | Castellano |
| `en/`      | Inglés     |

Si el idioma del navegador no coincide con ninguno de los tres, se usa **castellano** como fallback.

Cada subcarpeta es autocontenida: sus páginas referencian los assets con rutas relativas al padre
(`../style.css`, `../icon.png`, etc.).

---

## Desarrollo local

```bash
make start    # Levanta nginx en http://localhost (puerto 80)
make stop     # Para el contenedor
make restart  # Para y vuelve a levantar
```

Requiere **Docker** instalado y en ejecución.

---

## Convenciones

- Mantener los tres idiomas (eu / es / en) **siempre sincronizados**: cualquier cambio de contenido
  en una página debe replicarse en las otras dos.
- Los estilos globales van en `style.css`; los específicos de página de inicio en `page-home.css`
  y los de páginas de contenido (privacidad, términos) en `page-content.css`.
- No añadir dependencias externas ni herramientas de build: la web debe poder abrirse directamente
  en un navegador sin compilación previa.
