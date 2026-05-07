# Bliss Keycloak

Custom Keycloak image with Bliss branding theme for login, account, and email pages.

## Structure

```
bliss-keycloak/
├── Dockerfile              # Builds custom Keycloak with theme baked in
├── realm-export.json       # Default realm config (imported on first start)
├── themes/
│   └── bliss/
│       ├── theme.properties
│       ├── login/
│       │   ├── theme.properties
│       │   ├── template.ftl        # Custom login page template
│       │   └── resources/
│       │       ├── css/bliss.css    # Custom styles
│       │       └── img/logo.png    # Bliss logo
│       └── email/
│           └── theme.properties
└── README.md
```

## Local Development

Used automatically by `bliss-infra/docker-compose.yml`:

```bash
cd bliss-infra
docker compose up -d
```

The Keycloak service builds from this directory and applies the Bliss theme.

## Theme Customization

- Edit `themes/bliss/login/resources/css/bliss.css` for styling
- Replace `themes/bliss/login/resources/img/logo.png` for logo
- Edit `themes/bliss/login/template.ftl` for layout changes

After changes, rebuild:

```bash
docker compose up -d --build keycloak
```

## Railway Deployment

Deploy as a Docker Image service pointing to the `bliss-keycloak` GitHub repo.

Required environment variables:
- `KEYCLOAK_ADMIN` = admin username
- `KEYCLOAK_ADMIN_PASSWORD` = admin password
- `KC_DB` = postgres
- `KC_DB_URL` = jdbc:postgresql://postgres.railway.internal:5432/railway
- `KC_DB_USERNAME` = (from Postgres service)
- `KC_DB_PASSWORD` = (from Postgres service)
- `KC_DB_SCHEMA` = keycloak
