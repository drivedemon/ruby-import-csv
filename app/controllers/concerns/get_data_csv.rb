require 'active_support/concern'
require 'csv'

module GetDataCsv
  extend ActiveSupport::Concern

  private

  def get_data_csv(file:)
    csv_text = File.read(file)
    CSV.parse(csv_text, :headers => true, header_converters: :symbol).map(&:to_h)
  end
end
