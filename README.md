# Trivy JSON to CSV

A lightweight Bash-based toolkit that converts **Trivy vulnerability scan results**
into **CSV format**, with support for:

- JSON → CSV conversion
- Single container image scanning
- Bulk container image scanning from a list

Designed for **security engineers, pentesters, and DevSecOps teams** who need
structured vulnerability data for reporting, audits, and automation.

---

## ✨ Features

- Convert Trivy JSON reports to clean CSV
- Scan a single Docker image and export results to CSV
- Bulk scan multiple images from a file
- Graceful handling of missing fields
- Minimal dependencies (Bash, jq, Trivy)
- CI/CD and audit-friendly output

---

## 📁 Repository Structure

```text
.
├── bin/
│   ├── trivy-json-2-csv.sh      # Convert Trivy JSON → CSV
│   ├── trivy-scan-image.sh     # Scan a single image → CSV
│   └── trivy-scan-bulk.sh      # Scan multiple images → CSV
├── examples/
│   └── images.txt              # Sample image list
├── README.md
├── LICENSE
└── .gitignore
