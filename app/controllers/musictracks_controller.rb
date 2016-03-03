class MusictracksController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    
  end
  
  def download_url_for(musictrack_key)
    AWS::S3::S3Object.url_for(musictrack_key, 'songholder', :authenticated => false)
  end

  def download
    data = open(download_url_for(params[:awskey]))
    send_data data.read, filename: params[:awskey]
  end

  def new
    #nothing needed
  end

  def create

  end
    
  def edit
    #nothing needed
  end

  def index
    @musictracks = AWS::S3::Bucket.find('songholder').objects(:prefix => current_user.email)

  end

  def upload 
    begin
        AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, 'songholder', :access => :public_read)
        redirect_to root_path
    rescue
        render :text => "Couldn't complete the upload"
    end
end

def delete
    if (params[:awskey])
    AWS::S3::S3Object.find(params[:awskey], 'songholder').delete
    redirect_to root_path
    else
    render :text => "No song was found to delete!"
    end
end
    
private
 
def sanitize_filename(filename)
  current_user.email + filename.gsub(/[^0-9A-z.\-]/, '') 

end


end


