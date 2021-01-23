require 'sidekiq-scheduler'
require 'uri'
require 'csv'

class FetchCsvFromStorageJob < ApplicationJob
  EXTENSION_FILE = ".csv".freeze
  BUCKET_URL = "#{ENV.fetch('AWS_URL_BUCKET', 'some_key')}/csv/".freeze

  queue_as :default

  def perform
    readed_file = LogImportFile.all
    un_read_file = []
    contents = S3_CLIENT.list_objects(bucket: ENV.fetch('AWS_BUCKET', 'some_key')).contents

    return if contents.empty?

    contents.each do |content|
      next if readed_file.pluck(:file_name).include? content.etag || content.key.index(EXTENSION_FILE).nil?
      un_read_file << {"#{content.etag}": "#{BUCKET_URL}#{content.key}"}
    end

    un_read_file.each do |url|
      uri = URI.parse(url.values.first)
      csv = CSV.parse(Net::HTTP.get(uri), :headers => true, header_converters: :symbol).map(&:to_h)
      next unless User::IMPORT_HEADER_FORMAT.eql? csv.first.keys

      LogImportFile.create(file_name: url.keys.first)
      csv.each do |row|
        User.create(row)
      end
    end
  end
end
