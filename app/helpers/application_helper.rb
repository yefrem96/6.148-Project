module ApplicationHelper
	
def download_url_for(musictrack_key)
  AWS::S3::S3Object.url_for(musictrack_key, 'songholder', :authenticated => false)
end

def unsanitize_filename(filename)
  filename.gsub(current_user.email, '')
end

def sanitize_filename(filename)
  current_user.email + filename.gsub(/[^0-9A-z.\-]/, '') 

end
   
 
end
