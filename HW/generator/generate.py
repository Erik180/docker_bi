import csv
import random
import os
import sys

NUM_ROWS = 50

COLUMNS = ["sector", "funding_usd", "employees", "stage"]

def generate_row():
    return {
        "sector": random.choice(["SaaS", "Fintech", "EdTech", "HealthTech", "E-commerce"]),
        "funding_usd": random.randint(50000, 10000000),
        "employees": random.randint(2, 500),
        "stage": random.choice(["Pre-seed", "Seed", "Series A", "Series B"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)
