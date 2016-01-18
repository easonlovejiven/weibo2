require 'csv'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #csv下载功能
  def render_csv(data, options={})
    filename = options[:filename] || ''
    if options[:headers].blank?
      csv_str = CSV.generate(:col_sep => "\t") do |csv|
        data.each do |row|
          csv << row.values
        end
      end
    else
      csv_str = CSV.generate(:col_sep => "\t") do |csv|
        titles = []
        options[:headers].each do |h|
          titles << h[0]
        end
        csv << titles
        data.each do |row|
          line = []
          options[:headers].each do |h|
            line << row[h[1]]
          end
          csv << line
        end
      end
    end

    byte_arr = "\377\376".bytes.to_a  + csv_str.encode("UTF-16LE").bytes.to_a  #字符数组
    byte_str = byte_arr.pack("C*")    # create a String from bytes
    
    send_data(byte_str, type: "text/csv", filename: filename, disposition: 'attachment')
  end
end
