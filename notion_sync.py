import os
import sys
import requests

# Usage: python notion_sync.py [track] [company] [pdf_url]
# Example: python notion_sync.py frontend apple https://github.com/your/repo/path/to/pdf

NOTION_TOKEN = os.environ.get('NOTION_TOKEN')
DATABASE_ID = os.environ.get('NOTION_DATABASE_ID')

if not NOTION_TOKEN or not DATABASE_ID:
    print('Set NOTION_TOKEN and NOTION_DATABASE_ID as environment variables.')
    sys.exit(1)

if len(sys.argv) != 4:
    print('Usage: python notion_sync.py [track] [company] [pdf_url]')
    sys.exit(1)

track, company, pdf_url = sys.argv[1:4]

headers = {
    'Authorization': f'Bearer {NOTION_TOKEN}',
    'Notion-Version': '2022-06-28',
    'Content-Type': 'application/json',
}

# Prepare Notion page properties
properties = {
    'Name': {"title": [{"text": {"content": f"{track}/{company}"}}]},
    'PDF Link': {"url": pdf_url},
}

data = {
    'parent': {'database_id': DATABASE_ID},
    'properties': properties,
}

# Create a new page in Notion
resp = requests.post('https://api.notion.com/v1/pages', headers=headers, json=data)
if resp.status_code == 200:
    print('Notion updated successfully.')
else:
    print(f'Failed to update Notion: {resp.status_code} {resp.text}') 