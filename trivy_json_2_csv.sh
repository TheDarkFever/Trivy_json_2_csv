#!/bin/bash

#Checking if the syntax is correct?
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_json_file> <output_csv_file>"
    exit 1
fi

# Adding the files to Variables
INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Checking whether Input File exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' not found."
    exit 1
fi

# Writing Column Headers to CSV file (output)
echo "Target,Type,VulnerabilityID,PackageName,InstalledVersion,FixedVersion,Severity,Description,PrimaryURL" > "$OUTPUT_FILE"

# Extracting Data from JSON FILE which contains Vulnerabilities != Null
jq -r '
  .Results[]
  | select(.Vulnerabilities != null)
  | . as $target
  | .Vulnerabilities[]
  | [
      ($target.Target // ""),
      (.Type // ""),
      (.VulnerabilityID // ""),
      (.PkgName // ""),
      (.InstalledVersion // ""),
      (.FixedVersion // ""),
      (.Severity // ""),
      (.Description // ""),
      (.PrimaryURL // "")
    ]
  | @csv ' "$INPUT_FILE" >> "$OUTPUT_FILE" # Writing data to OUTPUT_FILE

# Printing Completion Message
echo "Conversion completed: $OUTPUT_FILE"
