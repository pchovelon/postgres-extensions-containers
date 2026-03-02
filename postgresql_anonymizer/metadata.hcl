# SPDX-FileCopyrightText: Copyright © contributors to CloudNativePG, established as CloudNativePG a Series of LF Projects, LLC.
# SPDX-License-Identifier: Apache-2.0
metadata = {
  name                     = "postgresql_anonymizer"
  sql_name                 = "anon"
  image_name               = "postgresql_anonymizer"
  shared_preload_libraries = []
  extension_control_path   = []
  dynamic_library_path     = []
  ld_library_path          = []
  auto_update_os_libs      = false

  versions = {
    bookworm = {
        // renovate: suite=bookworm-pgdg depName=postgresql-18-postgresql_anonymizer
        "18" = "3.0.0"
    }
    trixie = {
        // renovate: suite=trixie-pgdg depName=postgresql-18-postgresql_anonymizer
        "18" = "3.0.0"
    }
  }
}
