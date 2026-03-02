# PostgreSQL Anonymizer
<!--
SPDX-FileCopyrightText: Copyright © contributors to CloudNativePG, established as CloudNativePG a Series of LF Projects, LLC.
SPDX-License-Identifier: Apache-2.0
-->

The [PostgreSQL Anonymizer](https://gitlab.com/dalibo/postgresql_anonymizer) (or
`anon`) is an extension to mask or replace [personally identifiable information] (PII) or
commercially sensitive data from a Postgres database. For more information, see the [official documentation](https://postgresql-anonymizer.readthedocs.io).

## Usage

### 1. Add the PostgreSQL Anonymizer extension image to your Cluster

Define the PostgreSQL Anonymizer extension `anon` under the
`postgresql.extensions` section of your `Cluster` resource. For example:

```yaml
apiVersion: postgresql.cnpg.io/v1
kind: Cluster
metadata:
  name: cluster-postgresql_anonymizer
spec:
  imageName: ghcr.io/cloudnative-pg/postgresql:18-minimal-trixie
  instances: 1

  storage:
    size: 1Gi

  postgresql:
    extensions:
    - name: anon
      image:
        reference: ghcr.io/cloudnative-pg/postgresql_anonymizer:3.0.0-18-trixie
```

### 2. Enable the extension in a database

You can install PostgreSQL Anonymizer extension `anon` in a specific database by
creating or updating a `Database` resource. For example, to enable it in the
`app` database:

```yaml
apiVersion: postgresql.cnpg.io/v1
kind: Database
metadata:
  name: cluster-anon-db
spec:
  name: db
  owner: app
  cluster:
    name: cluster-anon
  extensions:
  - name: anon
    version: '3.0.0'
```

### 3. Verify installation

Once the database is ready, connect to it with `psql` and run:

```sql
\dx
```

You should see `anon` listed among the installed extensions.

```console
postgres=# \dx
                                  List of installed extensions
  Name   | Version | Default version |   Schema   |                 Description
---------+---------+-----------------+------------+---------------------------------------------
 anon    | 3.0.0   | 3.0.0           | public     | Anonymization & Data Masking for PostgreSQL
```

## Contributors

This extension is maintained by:

- Damien Clochard (@daamin)
- Pierrick Chovelon (@pchovelon)

The maintainers are responsible for:

- Monitoring upstream releases and security vulnerabilities.
- Ensuring compatibility with supported PostgreSQL versions.
- Reviewing and merging contributions specific to this extension's container
  image and lifecycle.

---

## Licenses and Copyright

This container image contains software that may be licensed under various
open-source licenses.

All relevant license and copyright information for the PostgreSQL Anonymizer
extension and its dependencies are bundled within the image at:

```text
/licenses/
```

By using this image, you agree to comply with the terms of the licenses
contained therein.
