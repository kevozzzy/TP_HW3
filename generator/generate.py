import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["QUANTITY", "PRICE", "RATING", "CATEGORY"]

def generate_row():

    return {
        "QUANTITY": random.randint(0, 100),
        "PRICE": round(random.uniform(1.5, 9.9), 2),
        "RATING": random.randint(0, 100),
        "CATEGORY": random.choice(["A", "B", "C"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

