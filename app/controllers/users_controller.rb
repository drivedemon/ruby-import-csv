class UsersController < ApplicationController

  include GetDataCsv

  def index
    @users = User.all.order(level: :desc).paginate(page: params[:page], per_page: 10)
  end

  def import_csv
    csv = get_data_csv(file: params.require(:user).permit(:user_file)[:user_file])
    raise "Column not match" unless User::IMPORT_HEADER_FORMAT.eql? csv.first.keys

    csv.each do |row|
      User.create(row)
    end

    redirect_to users_path, flash: {success: "Import successfully"}
  rescue => e
    redirect_to '/', flash: {errors: e}
  end
end
