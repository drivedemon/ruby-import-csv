# config/initializers/s3.rb
require 'aws-sdk-s3'

Aws.config.update(
  {
    region: ENV.fetch('AWS_REGION', 'some_key'),
    credentials: Aws::Credentials.new(
      ENV.fetch('AWS_ACCESS_KEY_ID', 'some_key'),
      ENV.fetch('AWS_SECRET', 'some_key')
    )
  }
)

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV.fetch('AWS_BUCKET', 'some_key'))

S3_CLIENT = Aws::S3::Client.new(region: ENV.fetch('AWS_REGION', 'some_key'))
