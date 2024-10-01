import requests
import os
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse

# List of news websites
news_sites = [
    "biztoc.com",
    "androidcentral.com",
    "technode.com",
    "business-standard.com",
    "marketplace.org",
    "thepinknews.com",
    "theweek.com",
    "antaranews.com",
    "ibtimes.com",
    "yahoo.com/entertainment",
    "apnews.com",
    "nbcsports.com",
    "arrowheadpride.com",
    "nypost.com",
    "deseret.com",
    "si.com",  # Sports Illustrated
    "managingmadrid.com",
    "foxsports.com",
    "cbssports.com",
    "usatoday.com",
    "arizonasports.com",
    "reuters.com",
    "bbc.com/news",
    "cnn.com",
    "variety.com"
]

# Function to get the favicon URL by parsing the HTML
def get_favicon_from_html(site):
    try:
        response = requests.get(f"http://{site}", timeout=10)
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')

            # Look for any link tags with rel="icon" or rel="shortcut icon"
            icon_link = soup.find("link", rel=lambda value: value and "icon" in value.lower())
            if icon_link and icon_link.get("href"):
                # Construct the full URL for the favicon
                favicon_url = urljoin(f"http://{site}", icon_link["href"])
                return favicon_url
            else:
                print(f"No icon found for {site}.")
        else:
            print(f"Failed to fetch HTML for {site}. Status code: {response.status_code}")
    except Exception as e:
        print(f"Error fetching favicon for {site}: {e}")
    return None

# Function to download the favicon
def download_favicon(favicon_url, save_dir, site_name):
    try:
        response = requests.get(favicon_url)
        if response.status_code == 200:
            # Extract the file extension from the URL
            ext = os.path.splitext(favicon_url)[1] or '.ico'
            file_name = os.path.join(save_dir, f"{site_name}{ext}")
            with open(file_name, 'wb') as f:
                f.write(response.content)
            print(f"Downloaded favicon for {site_name}")
        else:
            print(f"Failed to download favicon for {site_name}. Status code: {response.status_code}")
    except Exception as e:
        print(f"Error downloading favicon for {site_name}: {e}")

# Example Usage
if __name__ == "__main__":
    save_directory = input("Enter the directory to save the favicons: ")

    if not os.path.exists(save_directory):
        os.makedirs(save_directory)

    # Iterate over the news sites and download the favicons
    for site in news_sites:
        print(f"Fetching favicon for {site}...")
        favicon_url = get_favicon_from_html(site)
        if favicon_url:
            site_name = site.split('.')[0]  # Use the first part of the domain as the file name
            download_favicon(favicon_url, save_directory, site_name)
        else:
            print(f"Could not find a favicon for {site}.")
