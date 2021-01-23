# RUBY ON RAILS

## Start Development

Setup project for the first time
```
git clone https://github.com/drivedemon/ruby-import-csv.git
```
Create `.env` file
```
cp .env.example .env
```
Access `env` file then change `Storage` key
```
AWS_ACCESS_KEY_ID="access_key"
AWS_SECRET="secret_key"
AWS_REGION="region_name"
AWS_BUCKET="bucket_name"
AWS_URL_BUCKET="bucket_url"
```
Install Dependencies
```
bundle install && yarn install
```
Migrate Data
```
rails db:setup
```
Start backend server (You should see the backend up and running on  `localhost:3000`)
```
rails s
```

## Noted
All required Dependencies please see in document:
```
https://gorails.com/setup/osx/11.0-big-sur
```
PS: For Background Job folder structure (Example file format: `user_example.csv`)
```
please create folder csv (~/csv/your_file.csv) then upload your file into that folder
```
