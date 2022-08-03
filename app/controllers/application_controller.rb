class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  set :public_folder, 'app/public'
  set :image_dir, File.join(settings.public_folder, 'images')

  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post '/upload' do
    puts params
    if params[:image]
      filename = params[:image][:filename]
      tempfile = params[:image][:tempfile]
      # FileUtils.copy(tempfile, File.join(settings.image_dir, filename))
      {status: "ok", url: "/images/#{filename}"}.to_json
    else
      {status: "error", message: "no file"}
    end
  end

end
