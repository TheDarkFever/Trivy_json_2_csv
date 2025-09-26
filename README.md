# Trivy_json_2_csv
A lightweight Bash script that parses vulnerability data from Trivy JSON scan reports and exports it into a clean, structured CSV file for easier analysis, reporting, or integration with other tools.

# Features
- Converts Trivy JSON output into readable CSV format
- Extracts key fields: Target, Type, CVE ID, Package, Version, Severity, Description, and Reference URL
- Handles missing fields gracefully
- Includes argument validation and error handling
- Ideal for CI pipelines, audit reports, and vulnerability dashboards

# Dependencies
- Bash
- jq installed
