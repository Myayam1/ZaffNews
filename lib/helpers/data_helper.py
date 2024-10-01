import requests
import os
from datetime import datetime, timezone
from dateutil import parser
import pytz

# Define the NewsModel class to store each article's data
class NewsModel:
    def __init__(self, channel_name, headline, time_uploaded_utc, url_to_image):
        self.channelImagePath = 'lib/assets/news_assets/the_onion_logo.png'  # Placeholder for channel image path
        self.channelName = channel_name
        self.headline = headline
        self.timeUploaded = self.convert_time_to_wib(time_uploaded_utc)
        self.newsImagePath = url_to_image

    def __str__(self):
        return (f"      NewsModel(\n"
                f"          channelImagePath: '{self.channelImagePath}',\n"
                f"          channelName: '{self.channelName}',\n"
                f"          headline: '{self.headline}',\n"
                f"          timeUploaded: '{self.timeUploaded}',\n"
                f"          newsImagePath: '{self.newsImagePath}',\n"
                f"          isSaved: false\n"
                f"      )")

    def convert_time_to_wib(self, time_uploaded_utc):
        """Convert the time from UTC to WIB and return a relative time string (e.g., '3 hours ago')."""
        if not time_uploaded_utc:
            return "Unknown Time"

        try:
            # Parse the ISO 8601 time string to a datetime object
            utc_time = parser.isoparse(time_uploaded_utc).replace(tzinfo=timezone.utc)

            # Convert to WIB (UTC+7)
            wib_timezone = pytz.timezone('Asia/Jakarta')
            wib_time = utc_time.astimezone(wib_timezone)

            # Get the current time in WIB
            now_wib = datetime.now(wib_timezone)

            # Calculate the difference in time
            time_diff = now_wib - wib_time

            # Format the relative time (e.g., "3 hours ago", "2 days ago")
            if time_diff.days > 0:
                if time_diff.days == 1:
                    return "1 day ago"
                return f"{time_diff.days} days ago"
            elif time_diff.seconds // 3600 > 0:
                hours = time_diff.seconds // 3600
                if hours == 1:
                    return "1 hour ago"
                return f"{hours} hours ago"
            elif time_diff.seconds // 60 > 0:
                minutes = time_diff.seconds // 60
                if minutes == 1:
                    return "1 minute ago"
                return f"{minutes} minutes ago"
            else:
                return "Just now"
        except Exception as e:
            return f"Error in time conversion: {e}"

    def save_image(self, save_dir, index):
        if self.newsImagePath:
            try:
                # Fetch the image data
                img_data = requests.get(self.newsImagePath).content

                # Create a safe filename based on the index
                filename = f'image_{index + 1}.jpg'
                filepath = os.path.join(save_dir, filename)

                # Save the image to the specified directory
                with open(filepath, 'wb') as handler:
                    handler.write(img_data)

                print(f'Downloaded: {filepath}')
                self.newsImagePath = filepath
            except Exception as e:
                print(f"Failed to download {self.newsImagePath}. Error: {e}")
        else:
            print("No image URL provided for this article.")

# Fetch API URL, directory, and download limit from user input
api_url = input('Please input the API URL: ')
save_dir = input('Please input the directory to save the news images: ')

# Check if the directory exists
if not os.path.exists(save_dir):
    raise SystemExit(f'Unable to find directory {save_dir}. Process cancelled.')

# Limit for how many images/news articles to process
download_limit = int(input('Please input how many news you want to get: '))

# Get the name of the list to be generated in the .txt file
list_name = input('Please input the name of the list to save: ')

# Get the directory to save the .txt file
output_dir = input('Please input the directory to save the output .txt file: ')
if not os.path.exists(output_dir):
    raise SystemExit(f'Unable to find directory {output_dir}. Process cancelled.')

# Fetch data from the API
response = requests.get(api_url)
if response.status_code == 200:
    print('API response success, gathering data...')

    # Get the articles list from the API response
    articles = response.json().get('articles', [])

    # Check if there are any articles to process
    if not articles:
        print('No articles found in the API response.')
        raise SystemExit()

    # List to hold NewsModel objects
    news_list = []

    # Iterate over the articles to extract the required fields
    for article in articles:
        # Check if we have reached the desired number of news articles
        if len(news_list) >= download_limit:
            break

        source_name = article.get('source', {}).get('name', 'Unknown Source')
        title = article.get('title', 'No Title')
        published_at = article.get('publishedAt', 'Unknown Time')
        url_to_image = article.get('urlToImage')

        # Skip articles from "ETF Daily News" or with empty channel name, headline, or image
        if (source_name == "ETF Daily News" or source_name == "Biztoc.com" or not title or
            not source_name or not url_to_image):
            print(f'Skipping article: {title} from {source_name}.')
            continue

        # Create a NewsModel object
        news_model = NewsModel(source_name, title, published_at, url_to_image)

        # Print the article details
        print(news_model)

        # Save the image if available
        news_model.save_image(save_dir, len(news_list))

        # Add the news model to the list
        news_list.append(news_model)

    print(f"Processed {len(news_list)} articles.")

    # Write the news list to a .txt file in the specified output directory
    output_file_path = os.path.join(output_dir, f"{list_name}.txt")
    with open(output_file_path, "w") as f:
        f.write(f"List<NewsModel> {list_name} = [\n")
        for news in news_list:
            f.write(str(news) + ",\n")
        f.write("];\n")

    print(f"News data has been saved to {output_file_path}")
else:
    print(f'Failed to fetch API data. Status code: {response.status_code}')
