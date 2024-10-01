import os

# Define the path to your pubspec.yaml and assets directory
pubspec_path = '../../pubspec.yaml'
assets_dir = input("Please input a path to check : ")
print(f'Checking root/{assets_dir} for new assets...')

# Read existing pubspec.yaml content
with open(pubspec_path, 'r') as file:
    lines = file.readlines()

# Look for the assets section in pubspec.yaml
start_index = None
for i, line in enumerate(lines):
    if 'assets:' in line:
        start_index = i + 1
        break

# Get a list of all asset files in the assets directory
asset_files = []
for root, dirs, files in os.walk(assets_dir):
    for file in files:
        asset_path = os.path.join(root, file).replace("\\", "/")
        asset_files.append(asset_path)

# Check for existing entries to avoid duplicates
existing_assets = [line.strip() for line in lines[start_index:] if line.strip().startswith(f'- {assets_dir}')]

# Add any missing asset files to the pubspec.yaml
new_assets = []
for asset in asset_files:
    asset_entry = f'- {asset}'
    if asset_entry not in existing_assets:
        new_assets.append(f'    {asset_entry}\n')

# If there are new assets, append them to pubspec.yaml
if new_assets:
    lines[start_index:start_index] = new_assets

    # Write updated content back to pubspec.yaml
    with open(pubspec_path, 'w') as file:
        file.writelines(lines)
    print(f'Added {len(new_assets)} new asset(s) to pubspec.yaml.')
else:
    print('No new assets to add.')
